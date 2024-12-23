import 'package:flutter/material.dart';

class LivePage extends StatelessWidget {
  // Sample data for events
  final List<Map<String, String>> events = [
    {
      'name': 'Tech Conference 2024',
      'venue': 'Convention Center',
      'timing': '10:00 AM - 4:00 PM',
      'organizer': 'Tech Corp'
    },
    {
      'name': 'Music Festival',
      'venue': 'City Park',
      'timing': '2:00 PM - 10:00 PM',
      'organizer': 'Music Inc.'
    },
    // Add more events here
  ];

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
              backgroundColor: Colors.transparent, // Use transparent to allow the Container's color to show
              elevation: 0,
              title: const Text("Live Events",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
              centerTitle: true,
              toolbarHeight: 80.0, // Adjust as needed
            ),
          ),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                title: Text(
                  event['name'] ?? 'No Name',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.0),
                    Text('Venue: ${event['venue'] ?? 'No Venue'}'),
                    Text('Timing: ${event['timing'] ?? 'No Timing'}'),
                    Text('Organizer: ${event['organizer'] ?? 'No Organizer'}'),
                  ],
                ),
                isThreeLine: true,
                leading: Icon(
                  Icons.event,
                  color: Colors.deepPurple,
                  size: 40.0,
                ),
                // Remove tileColor to keep the background as default
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LivePage(),
  ));
}
