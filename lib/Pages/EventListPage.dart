import 'package:flutter/material.dart';
import 'EventPage.dart';

class EventListPage extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      'title': 'Tech Symposium 2024',
      'image': 'assets/images/backgrondimage.jpg',
      'date': '20-06-2024',
      'description': 'A tech symposium to discuss the latest trends in technology.'
    },
    {
      'title': 'Tech Symposium 2024',
      'image': 'assets/images/backgrondimage.jpg',
      'date': '20-06-2024',
      'description': 'A tech symposium to discuss the latest trends in technology.'
    },
    {
      'title': 'Tech Symposium 2024',
      'image': 'assets/images/backgrondimage.jpg',
      'date': '20-06-2024',
      'description': 'A tech symposium to discuss the latest trends in technology.'
    },
    {
      'title': 'Tech Symposium 2024',
      'image': 'assets/images/backgrondimage.jpg',
      'date': '20-06-2024',
      'description': 'A tech symposium to discuss the latest trends in technology.'
    },
    // Add more events here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  // height: 250, // Set the height you want
                  width: double.infinity, // Ensure it takes up full width
                  child: Image.asset(
                    event['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event['title']!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text('Date: ${event['date']}'),
                      SizedBox(height: 5),
                      Text('Description: ${event['description']}'),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventFormPage(),
                              ),
                            );
                          },
                          child: Text('View Details'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}