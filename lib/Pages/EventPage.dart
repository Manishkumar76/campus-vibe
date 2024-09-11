import 'dart:ui';
import 'package:flutter/material.dart';

class EventFormPage extends StatefulWidget {
  @override
  _EventFormPageState createState() => _EventFormPageState();
}

class _EventFormPageState extends State<EventFormPage> {
  double _blurAmount = 0.0;
  List<Map<String, String>> winners = [
    {"name": "John Doe", "position": "Gold"},
    {"name": "Jane Smith", "position": "Silver"},
    {"name": "Michael Johnson", "position": "Bronze"}
  ]; // List of winners with positions

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Event Name',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigo,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
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
                  width: double.infinity,
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
            maxChildSize: 1, // Maximum drawer size when dragged upwards
            builder: (BuildContext context, ScrollController scrollController) {
              return NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  setState(() {
                    _blurAmount = (notification.extent - 0.55) * 10; // Control the blur amount dynamically
                  });
                  return true;
                },
                child: Container(
                  decoration: const BoxDecoration(
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
                      const Center(
                        child: Icon(
                          Icons.horizontal_rule_rounded, // Arrow icon
                          size: 50.0,
                          color: Colors.grey,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // The form fields
                            Text(
                              "Name of Event",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.indigo,
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
                                color: Colors.indigo,
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
                                color: Colors.indigo,
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
                                color: Colors.indigo,
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
                                color: Colors.indigo,
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
                                color: Colors.indigo,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Tech Symposium 2024 is an exciting gathering of innovators, tech enthusiasts, and industry leaders from across the globe. This event will feature cutting-edge discussions on the latest trends in technology, including artificial intelligence, blockchain, quantum computing, and emerging software solutions. Attendees will have the opportunity to participate in workshops, network with professionals, and gain insights from keynote speeches by pioneers in the tech world.",
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                      // Winners List
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Winners",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18, color: Colors.indigo),
                            ),
                            SizedBox(height: 10),
                            // Display the list of winners with position badges
                            for (var winner in winners)
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      winner['position'] == "Gold"
                                          ? Icons.emoji_events
                                          : winner['position'] == "Silver"
                                          ? Icons.emoji_events_outlined
                                          : Icons.military_tech,
                                      color: winner['position'] == "Gold"
                                          ? Colors.amber
                                          : winner['position'] == "Silver"
                                          ? Colors.grey
                                          : Colors.brown,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "${winner['name']} - ${winner['position']}",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),

                      // Participate Button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your participate logic here
                          },
                          child: Text(
                            'Participate',
                            style: TextStyle(
                              color: Colors.white, // Set the desired text color here
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo, // Background color of the button
                            shape: StadiumBorder(),
                            padding: EdgeInsets.symmetric(vertical: 15), // Button padding
                          ),
                        ),
                      ),

                      // Add Winner Button for organizers
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ElevatedButton(
                          onPressed: _addWinnerDialog, // Call function to add a winner
                          child: Text(
                            'Add Winner',
                            style: TextStyle(
                              color: Colors.white, // Set the desired text color here
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green, // Background color of the button
                            shape: StadiumBorder(),
                            padding: EdgeInsets.symmetric(vertical: 15), // Button padding
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
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

  // Function to display a dialog and add a new winner to the list
  void _addWinnerDialog() {
    TextEditingController winnerController = TextEditingController();
    String? selectedPosition;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add Winner"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: winnerController,
                decoration: const InputDecoration(hintText: "Enter Winner's Name"),
              ),
              DropdownButtonFormField<String>(
                value: selectedPosition,
                items: ["Gold", "Silver", "Bronze"].map((String position) {
                  return DropdownMenuItem<String>(
                    value: position,
                    child: Text(position),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedPosition = newValue;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Select Position',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            ElevatedButton(
              child: const Text("Add"),
              onPressed: () {
                setState(() {
                  if (winnerController.text.isNotEmpty && selectedPosition != null) {
                    winners.add({
                      "name": winnerController.text,
                      "position": selectedPosition!
                    });
                  }
                });
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
