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
      body: Stack(
        children: <Widget>[
          // The background image
          Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/backgrondimage.jpg', // Add your image here
                  fit: BoxFit.cover,

                  // height: MediaQuery.of(context).size.height,
                  // width: MediaQuery.of(context).size.width,
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
            initialChildSize: 0.4, // Start with the drawer showing 40% of the screen
            minChildSize: 0.4, // Minimum drawer size
            maxChildSize: 0.9, // Maximum drawer size when dragged upwards
            builder: (BuildContext context, ScrollController scrollController) {
              return NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  setState(() {
                    _blurAmount = (notification.extent - 0.4) * 10; // Control the blur amount dynamically
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
                                color: Colors.purple,
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
                                color: Colors.purple,
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
                                color: Colors.purple,
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
                                color: Colors.purple,
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
                                color: Colors.purple,
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
                                color: Colors.purple,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Description for Tech Symposium 2024"),
                            SizedBox(height: 20),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('Participate'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
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
