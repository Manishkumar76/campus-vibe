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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
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
    );
  }
}

void main() => runApp(MaterialApp(home: NotificationPage()));
