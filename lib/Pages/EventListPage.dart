import 'package:flutter/material.dart';
import 'EventPage.dart';

class EventListPage extends StatefulWidget {
  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  final List<Map<String, String>> allEvents = [
    {
      'title': 'Tech Symposium 2024',
      'image': 'assets/images/backgrondimage.jpg',
      'date': '20-06-2024',
      'category': 'Technical',
      'description': 'A tech symposium to discuss the latest trends in technology.'
    },
    {
      'title': 'Cultural Fest 2024',
      'image': 'assets/images/backgrondimage.jpg',
      'date': '25-06-2024',
      'category': 'Cultural',
      'description': 'A fest celebrating diverse cultures and performances.'
    },
    {
      'title': 'Literary Meetup 2024',
      'image': 'assets/images/backgrondimage.jpg',
      'date': '10-07-2024',
      'category': 'Literature',
      'description': 'A gathering of literary minds to discuss and debate.'
    },
    {
      'title': 'Management Summit 2024',
      'image': 'assets/images/backgrondimage.jpg',
      'date': '15-07-2024',
      'category': 'Management',
      'description': 'A summit for future business leaders and managers.'
    },
    // Add more events here
  ];

  String selectedCategory = 'All'; // Default category is 'All'

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredEvents = selectedCategory == 'All'
        ? allEvents
        : allEvents.where((event) => event['category'] == selectedCategory).toList();

    return SafeArea(
      child: Scaffold(
        appBar:PreferredSize(
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
              title: const Text("Events",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
              centerTitle: true,
              toolbarHeight: 80.0, // Adjust as needed
            ),
          ),
        ),
        body: Column(
          children: [
            // Category filter buttons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCategoryButton('All'),
                    _buildCategoryButton('Technical'),
                    _buildCategoryButton('Cultural'),
                    _buildCategoryButton('Literature'),
                    _buildCategoryButton('Management'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredEvents.length,
                itemBuilder: (context, index) {
                  final event = filteredEvents[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventFormPage(),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Container(
                              height: 250,
                              width: double.infinity,
                              child: Image.asset(
                                event['image']!,
                                fit: BoxFit.cover,
                              ),
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for category buttons
  Widget _buildCategoryButton(String category) {


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {

          setState(() {
            selectedCategory = category;
          });
        },
        child: Text(category,style: TextStyle(color: selectedCategory==category? Colors.white:Colors.indigo),),
        style: ElevatedButton.styleFrom(
          backgroundColor: selectedCategory == category ? Colors.indigo : Colors.white,
        ),
      ),
    );
  }
}