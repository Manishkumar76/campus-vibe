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
      elevation: 4,
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

class EventWinnersScreen extends StatefulWidget {
  @override
  _EventWinnersScreenState createState() => _EventWinnersScreenState();
}

class _EventWinnersScreenState extends State<EventWinnersScreen> {
  String selectedCategory = 'All';

  final List<Map<String, dynamic>> events = [
    {
      'eventName': 'Hackathon 2024',
      'eventDate': 'April 12, 2024',
      'category': 'Technical',
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
      'category': 'Sports',
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
    {
      'eventName': 'Cultural Fest 2024',
      'eventDate': 'February 15, 2024',
      'category': 'Cultural',
      'winners': [
        {
          'name': 'Charlie Brown',
          'position': '1st Place',
          'image': 'https://example.com/image5.jpg'
        },
        {
          'name': 'Lucy Van Pelt',
          'position': '2nd Place',
          'image': 'https://example.com/image6.jpg'
        },
      ],
    },
  ];

  final Color defaultIconColor = Colors.grey;
  // Highlighted icon color
  final Color highlightedIconColor=Colors.indigo;

  // List of all categories
  final List<String> categories = ['All', 'Technical', 'Sports', 'Cultural'];

  // Filter the events based on selected category
  List<Map<String, dynamic>> getFilteredEvents() {
    if (selectedCategory == 'All') {
      return events;
    }
    return events.where((event) => event['category'] == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredEvents = getFilteredEvents();

    return SafeArea(
      child: Scaffold(
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
              title: const Text("Winners",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
              actions: [
                DropdownButton<String>(
                  value: selectedCategory,
                  dropdownColor: Colors.indigo,
                  icon: Icon(Icons.filter_list, color: Colors.white),
                  underline: Container(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue!;
                    });
                  },
                  items: categories.map<DropdownMenuItem<String>>((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          category,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(width: 10),
              ],
              toolbarHeight: 80.0, // Adjust as needed
            ),
          ),
        ),
        body: filteredEvents.isEmpty
            ? Center(
          child: Text(
            'No winners found in this category.',
            style: TextStyle(fontSize: 18),
          ),
        )
            : ListView.builder(
          itemCount: filteredEvents.length,
          itemBuilder: (context, index) {
            final event = filteredEvents[index];
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
      ),
    );
  }
}
