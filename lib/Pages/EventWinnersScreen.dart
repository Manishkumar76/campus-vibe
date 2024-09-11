import 'package:flutter/material.dart';

class WinnerCard extends StatelessWidget {
  final String winnerName;
  final String position;
  final String winnerImage;

  WinnerCard({
    required this.winnerName,
    required this.position,
    required this.winnerImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(winnerImage),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  winnerName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  position,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EventWinnersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> events = [
    {
      'eventName': 'Hackathon 2024',
      'eventDate': 'April 12, 2024',
      'winners': [
        {
          'name': 'Alice Johnson',
          'position': '1st Place',
          'image': 'https://example.com/image1.jpg'
        },
        {
          'name': 'Bob Williams',
          'position': '2nd Place',
          'image': 'https://example.com/image2.jpg'
        },
      ],
    },
    {
      'eventName': 'Sports Meet 2024',
      'eventDate': 'March 20, 2024',
      'winners': [
        {
          'name': 'Eve Roberts',
          'position': '1st Place',
          'image': 'https://example.com/image3.jpg'
        },
        {
          'name': 'John Doe',
          'position': '2nd Place',
          'image': 'https://example.com/image4.jpg'
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Winners"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event['eventName'],
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  event['eventDate'],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 16),
                Column(
                  children: List.generate(event['winners'].length, (winnerIndex) {
                    final winner = event['winners'][winnerIndex];
                    return WinnerCard(
                      winnerName: winner['name'],
                      position: winner['position'],
                      winnerImage: winner['image'],
                    );
                  }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}