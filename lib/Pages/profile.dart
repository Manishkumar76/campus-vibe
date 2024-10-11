import 'package:campus_vibe/Authentication/Login/loginScreen.dart';
import 'package:flutter/material.dart';

import '../Models/user_model.dart';
import '../services/user_services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  // Method to show the logout confirmation dialog
  void showDialogbox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text("Are you sure to logout ?"),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                logout();
              },
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("No")
            ),
          ],
        );
      },
    );
  }

  // Method to handle user logout
  void logout() {
    UserServices().removeUserId();

    // Clear the navigation stack and navigate to the login screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false, // This removes all the previous routes
    );
  }

  User userdata = UserServices.userData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                userdata.name,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              toolbarHeight: 80.0, // Adjust as needed
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              Container(
                height: 250,
                child: Stack(
                  children: [
                    Container(
                      height: 180,
                      width: double.infinity,
                      child: Image.asset(
                        userdata.profileImage, // Add your image here
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width / 2 - 50,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          userdata.profileImage,
                        ), // Add your profile image URL
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30), // Increased spacing for a better look

              // User Information Section
              Center(
                child: Column(
                  children: [
                    Text(
                      userdata.name.toString().toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text('Department: ${userdata.departmentId}',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                    Text('Batch: ${userdata.batch}',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                    const SizedBox(height: 10),
                    Text(userdata.email,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                    const SizedBox(height: 20),
                  ],
                ),
              ),

              // Buttons for Participated and Organized
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.list_alt, size: 30),
                        SizedBox(height: 5),
                        Text('Participated'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.event_available, size: 30),
                        SizedBox(height: 5),
                        Text('Organized'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30), // Increased spacing for clear separation

              // Profile Settings Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Account Section
                    const Text(
                      'Account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.security, color: Colors.indigo),
                      title: const Text('Security'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to Security Page
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.notifications, color: Colors.indigo),
                      title: const Text('Notifications'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to Notifications Page
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.lock, color: Colors.indigo),
                      title: const Text('Privacy'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to Privacy Settings
                      },
                    ),

                    // Support & About Section
                    const SizedBox(height: 20),
                    const Text(
                      'Support & About',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.help_outline, color: Colors.green),
                      title: const Text('Help & Support'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to Help & Support
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.policy, color: Colors.green),
                      title: const Text('Terms and Policies'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to Terms and Policies
                      },
                    ),

                    // Actions Section
                    const SizedBox(height: 20),
                    const Text(
                      'Actions',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.report_problem, color: Colors.red),
                      title: const Text('Report a problem'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to Report Problem Page
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.add, color: Colors.red),
                      title: const Text('Add account'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to Add Account Page
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout, color: Colors.red),
                      title: const Text('Log out'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        showDialogbox();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
