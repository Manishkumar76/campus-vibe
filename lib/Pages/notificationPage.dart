import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  // Sample list of notifications
  final List<Map<String, String>> notifications = [
    {
      'title': 'Event Reminder',
      'message': 'Don\'t forget to attend the event tomorrow!',
    },
    {
      'title': 'New Message',
      'message': 'You have received a new message.',
    },
    {
      'title': 'App Update',
      'message': 'A new version of the app is available for download.',
    },
  ];

  final Color defaultIconColor = Colors.grey;
  // Highlighted icon color
  final Color highlightedIconColor=Colors.indigo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0), // Height of the AppBar
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color:highlightedIconColor,
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
            leading: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.transparent, // Use transparent to allow the Container's color to show
            elevation: 0,
            title: const Text("Notification",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
            centerTitle: true,
            toolbarHeight: 80.0, // Adjust as needed
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(Icons.notifications),
              title: Text(notifications[index]['title']!),
              subtitle: Text(notifications[index]['message']!),
              onTap: () {
                // Handle notification click here
              },
            ),
          );
        },
      ),
    ));
  }
}

void main() => runApp(MaterialApp(home: NotificationPage()));
