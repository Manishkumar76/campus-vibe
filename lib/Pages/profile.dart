import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0), // Height of the AppBar
          child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color:Colors.indigo,
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
              title: const Text("User Name",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
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
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/profile.jpeg', // Add your image here
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width / 2 - 50,
                    bottom: -50,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJrXSXb_jayac8vtbpTX_FYximkklGxSWZgA&s'), // Add your profile image URL
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60), // Increased spacing for a better look
      
              // User Information Section
              Center(
                child: Column(
                  children: [
                    Text(
                      'RAVI KUMAR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('Department: Electronics & Communication',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                    Text('Batch: 2023',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                    SizedBox(height: 10),
                    Text('ravi.kumar@example.com',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                    SizedBox(height: 20),
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
              SizedBox(height: 30), // Increased spacing for clear separation
      
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
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.security, color: Colors.indigo),
                      title: Text('Security'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to Security Page
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.notifications, color: Colors.indigo),
                      title: Text('Notifications'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to Notifications Page
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.lock, color: Colors.indigo),
                      title: Text('Privacy'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to Privacy Settings
                      },
                    ),
      
                    // Support & About Section
                    SizedBox(height: 20),
                    Text(
                      'Support & About',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.help_outline, color: Colors.green),
                      title: Text('Help & Support'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to Help & Support
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.policy, color: Colors.green),
                      title: Text('Terms and Policies'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to Terms and Policies
                      },
                    ),
      
                    // Actions Section
                    SizedBox(height: 20),
                    Text(
                      'Actions',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.report_problem, color: Colors.red),
                      title: Text('Report a problem'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to Report Problem Page
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.add, color: Colors.red),
                      title: Text('Add account'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to Add Account Page
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout, color: Colors.red),
                      title: Text('Log out'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Add logout functionality
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30), // Increased bottom padding for better UI
            ],
          ),
        ),
      ),
    );
  }
}













// import 'package:flutter/material.dart';
//
// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Profile Header
//             Stack(
//               alignment: Alignment.center,
//               children: [
//                 Image.asset(
//                   'assets/images/profile.jpeg', // Add your image here
//                   fit: BoxFit.cover,
//                 ),
//                 // Positioned(
//                 //   top: 100,
//                 //   child: CircleAvatar(
//                 //     radius: 50,
//                 //     backgroundImage: NetworkImage(
//                 //         'https://example.com/profile_image.jpg'), // Add your profile image URL
//                 //   ),
//                 // ),
//               ],
//             ),
//             SizedBox(height: 60),
//
//             // User Information Section
//             Text(
//               'RAVI KUMAR',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//             ),
//             SizedBox(height: 10),
//             Text('Department : 1'),
//             Text('Batch : 1'),
//             SizedBox(height: 10),
//             Text('ravi.kumar@example.com'),
//             SizedBox(height: 20),
//
//             // Buttons for Participated and Organized
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Column(
//                   children: [
//                     Icon(Icons.list_alt),
//                     Text('Participated'),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Icon(Icons.event_available),
//                     Text('Organized'),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//
//             // Logout Button
//             ElevatedButton(
//               onPressed: () {
//                 // Add logout functionality
//               },
//               child: Text('Logout'),
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }