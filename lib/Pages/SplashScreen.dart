import 'package:campus_vibe/Authentication/Login/loginScreen.dart';
import 'package:campus_vibe/services/event_services.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:campus_vibe/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/user_services.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final String _text = "Campus Vibe";
  String _displayText = "";
  int _currentIndex = 0;
  Timer? _typingTimer;
  bool? isLogin= false;
  static var loginKey="isLogin";

   void checkUserIsLogin() async{
     SharedPreferences sp= await SharedPreferences.getInstance();
     setState(() {
       isLogin= sp.getBool(loginKey);
     });
     if(isLogin==true){
       try{
         await UserServices().getUserById(sp.getInt("userId")!);
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const MyHomePage(title: "Campus Vibe")));

     }catch(e){
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const LoginScreen()));;}
     }
     else{
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  const LoginScreen()));
     }
   }
  @override
  void initState() {
    super.initState();
    _startTypingAnimation();
  }

  void _startTypingAnimation() {
    const duration = Duration(milliseconds: 100);
    _typingTimer = Timer.periodic(duration, (timer) {
      if (_currentIndex < _text.length) {
        setState(() {
          _displayText += _text[_currentIndex];
          _currentIndex++;
        });
      } else {
        timer.cancel();
        _navigateToNextScreen();
      }
    });
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 2), () async{
     await EventServices().fetchAllEvents();
      checkUserIsLogin();
    });
  }

  @override
  void dispose() {
    _typingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          _displayText,
          style: const TextStyle(
            fontSize: 32,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
      ),
    );
  }
}