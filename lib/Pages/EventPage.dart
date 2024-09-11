import 'dart:ui';
import 'package:flutter/material.dart';

class EventFormPage extends StatefulWidget {
  @override
  _EventFormPageState createState() => _EventFormPageState();
}

class _EventFormPageState extends State<EventFormPage> {
  double _blurAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the event list page
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          // The background image
          Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  'assets/images/backgrondimage.jpg', // Add your image here
                  fit: BoxFit.cover,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: _blurAmount, sigmaY: _blurAmount),
                  child: Container(
                    color: Colors.black.withOpacity(0),
                  ),
                ),
              ],
            ),
          ),
          // The DraggableScrollableSheet (drawer)
          DraggableScrollableSheet(
            initialChildSize: 0.55, // Start with the drawer showing 55% of the screen
            minChildSize: 0.55, // Minimum drawer size
            maxChildSize: 0.98, // Maximum drawer size when dragged upwards
            builder: (BuildContext context, ScrollController scrollController) {
              return NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  setState(() {
                    _blurAmount = (notification.extent - 0.55) * 10; // Control the blur amount dynamically
                  });
                  return true;
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: <Widget>[
                      // Arrow icon at the top
                      Center(
                        child: Icon(
                          Icons.horizontal_rule, // Arrow icon
                          size: 50.0,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // The form fields
                            Text(
                              "Name of Event",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.lightBlue,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Tech Symposium 2024"),
                            SizedBox(height: 10),
                            Text(
                              "Event's Registration Date",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.lightBlue,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("01-06-2024 - 15-06-2024"),
                            SizedBox(height: 10),
                            Text(
                              "Event's Date",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.lightBlue,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("20-06-2024"),
                            SizedBox(height: 10),
                            Text(
                              "Time",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.lightBlue,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("09:00 AM"),
                            SizedBox(height: 10),
                            Text(
                              "Venue",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.lightBlue,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Conference Room"),
                            SizedBox(height: 10),
                            Text(
                              "Description",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.lightBlue,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Tech Symposium 2024 is an exciting gathering of innovators, tech enthusiasts, and industry leaders from across the globe. This event will feature cutting-edge discussions on the latest trends in technology, including artificial intelligence, blockchain, quantum computing, and emerging software solutions. Attendees will have the opportunity to participate in workshops, network with professionals, and gain insights from keynote speeches by pioneers in the tech world. Tech Symposium 2024 is an exciting gathering of innovators, tech enthusiasts, and industry leaders from across the globe. This event will feature cutting-edge discussions on the latest trends in technology, including artificial intelligence, blockchain, quantum computing, and emerging software solutions. Attendees will have the opportunity to participate in workshops, network with professionals, and gain insights from keynote speeches by pioneers in the tech world. Tech Symposium 2024 is an exciting gathering of innovators, tech enthusiasts, and industry leaders from across the globe. This event will feature cutting-edge discussions on the latest trends in technology, including artificial intelligence, blockchain, quantum computing, and emerging software solutions. Attendees will have the opportunity to participate in workshops, network with professionals, and gain insights from keynote speeches by pioneers in the tech world."),
                            SizedBox(height: 20),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Participate',
                                  style: TextStyle(
                                    color: Colors.white, // Set the desired text color here
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent, // Background color of the button
                                  shape: StadiumBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}