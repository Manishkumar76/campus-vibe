import 'dart:convert';
import 'package:campus_vibe/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Pages/SplashScreen.dart';
import '../../constant/utils.dart';
import '../../main.dart';
import '../SingnUp/SignUpScreen.dart';
import 'forgot_password.dart';


// Define your LoginModel here
class LoginModel {
  final String email;
  final String password;

  // Constructor to initialize all fields
  LoginModel({
    required this.email,
    required this.password,
  });

  // Factory method to create a new instance from a JSON object
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'],
      password: json['password'],
    );
  }

  // Method to convert the instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var warning = "";
  bool isLoading = false; // State variable for loading indicator

  void setWarning(String message) {
    setState(() {
      warning = message;
    });
  }

  void login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      setWarning("Every field must be filled!");
    } else {
      setWarning(""); // Clear warning message
      setState(() {
        isLoading = true; // Show loading indicator
      });

      try {
        // Create the LoginModel instance with user inputs
        LoginModel loginModel = LoginModel(
          email: emailController.text,
          password: passwordController.text,
        );

        // Send the login request
        final response = await http.post(
          Uri.parse('${Utils.baseUrl}user/login'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(loginModel.toJson()),
        );
           print('${Utils.baseUrl}user/login');
        // Handle the response
        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          SharedPreferences sp= await SharedPreferences.getInstance();
          setState(() {
            sp.setBool(SplashScreenState.loginKey, true);
            sp.setInt("userId", responseData['id']);
          });
           await UserServices().getUserById(sp.getInt("userId")!);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const MyHomePage(title: "Campus Vibe")),
            );
        }
        else if(response.statusCode==404){
          _showErrorMessage("Account doesn't exist!");
        }
        else {
          // Handle server error
          _showErrorMessage('Server error while logging in.');
        }
      } catch (error) {
        _showErrorMessage('An unexpected error occurred.');
      } finally {
        setState(() {
          isLoading = false; // Hide loading indicator
        });
      }
    }
  }

  void _showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // Add listeners to hide warning when fields change
    emailController.addListener(() {
      if (warning.isNotEmpty) {
        setWarning("");
      }
    });
    passwordController.addListener(() {
      if (warning.isNotEmpty) {
        setWarning("");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'New here?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const SignUpScreen()),
                        );
                      },
                      child: const Text(
                        'Create account',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: 'Email Address',
                    filled: true,
                    fillColor: const Color(0xFFEAE8E4),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    hintText: 'Password',
                    filled: true,
                    fillColor: const Color(0xFFEAE8E4),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ForgotPassword()),
                        );
                      },
                      child: const Text('Forgot?'),
                    ),
                    suffixStyle: const TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: warning.isEmpty
                      ? null
                      : Text(
                          warning,
                          style: const TextStyle(fontSize: 12, color: Colors.red),
                        ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      login();
                    }, // Disable button while loading
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'or login with',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialLoginButton(icon: Icons.g_mobiledata, color: Colors.orange, onPressed: (){}),
                    SocialLoginButton(
      
                      icon: Icons.apple,
                      color: Colors.black, // Apple color
                      onPressed: () {
                        // Handle Apple login
                      },
                    ),
                    SocialLoginButton(
                      icon: Icons.facebook,
                      color: Colors.blueAccent, // Facebook color
                      onPressed: () {
                        // Handle Facebook login
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          size: 30,
          color: color,
        ),
      ),
    );
  }
}
