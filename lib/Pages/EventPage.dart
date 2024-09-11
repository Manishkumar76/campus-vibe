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
              leading: IconButton(
                color: Colors.white,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent, // Use transparent to allow the Container's color to show
              elevation: 0,
              title: const Text("Event Name",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
              toolbarHeight: 80.0, // Adjust as needed
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            // The background image with blur effect
            SizedBox(
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
                    filter: ImageFilter.blur(
                        sigmaX: _blurAmount, sigmaY: _blurAmount),
                    child: Container(
                      color: Colors.black.withOpacity(0),
                    ),
                  ),
                ],
              ),
            ),
            // The DraggableScrollableSheet (drawer)
            DraggableScrollableSheet(
              initialChildSize:
                  0.55, // Start with the drawer showing 55% of the screen
              minChildSize: 0.55, // Minimum drawer size
              maxChildSize: 1, // Maximum drawer size when dragged upwards
              builder: (BuildContext context, ScrollController scrollController) {
                return NotificationListener<DraggableScrollableNotification>(
                  onNotification: (notification) {
                    setState(() {
                      _blurAmount = (notification.extent - 0.55) *
                          10; // Control the blur amount dynamically
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
                              // Event Details using ListTile
                              ListTile(
                                leading: Icon(Icons.event),
                                title: Text(
                                  "Name of Event",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.indigo,
                                  ),
                                ),
                                subtitle: Text("Tech Symposium 2024"),
                              ),
                              ListTile(
                                leading: Icon(Icons.calendar_today),
                                title: Text(
                                  "Event's Registration Date",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.indigo,
                                  ),
                                ),
                                subtitle: Text("01-06-2024 - 15-06-2024"),
                              ),
                              ListTile(
                                leading: Icon(Icons.event_available),
                                title: Text(
                                  "Event's Date",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.indigo,
                                  ),
                                ),
                                subtitle: Text("20-06-2024"),
                              ),
                              ListTile(
                                leading: Icon(Icons.access_time),
                                title: Text(
                                  "Time",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.indigo,
                                  ),
                                ),
                                subtitle: Text("09:00 AM"),
                              ),
                              ListTile(
                                leading: Icon(Icons.location_on),
                                title: Text(
                                  "Venue",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.indigo,
                                  ),
                                ),
                                subtitle: Text("Conference Room"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Description",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.indigo,
                                ),
                              ),
                              Text(
                                  "Tech Symposium 2024 is an exciting gathering of innovators, tech enthusiasts, and industry leaders from across the globe. This event will feature cutting-edge discussions on the latest trends in technology, including artificial intelligence, blockchain, quantum computing, and emerging software solutions. Attendees will have the opportunity to participate in workshops, network with professionals, and gain insights from keynote speeches by pioneers in the tech world."),
                            ],
                          ),
                        ),
                        // Winners Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Winners",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.indigo),
                              ),
                              const SizedBox(height: 10),
                              // Display the list of winners with position badges
                              for (var winner in winners)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: ListTile(
                                    leading: Icon(
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
                                    title: Text(
                                      "${winner['name']} - ${winner['position']}",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(
                                          Icons.delete_outline_rounded),
                                      onPressed: () {
                                        _showRemoveWinnerDialog(winner);
                                      },
                                    ),
                                  ),
                                ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
      
                        // Participate Button
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              // Add your participate logic here
                            },
                            child: Text(
                              'Participate',
                              style: TextStyle(
                                color: Colors
                                    .white, // Set the desired text color here
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.indigo, // Background color of the button
                              shape: StadiumBorder(),
                              padding: EdgeInsets.symmetric(
                                  vertical: 15), // Button padding
                            ),
                          ),
                        ),
      
                        // Add Winner Button for organizers
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ElevatedButton(
                            onPressed:
                                _addWinnerDialog, // Call function to add a winner
                            child: Text(
                              'Add Winner',
                              style: TextStyle(
                                color: Colors
                                    .white, // Set the desired text color here
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.green, // Background color of the button
                              shape: StadiumBorder(),
                              padding: EdgeInsets.symmetric(
                                  vertical: 15), // Button padding
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
      ),
    );
  }

  void _showRemoveWinnerDialog(winner) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Remove Winner"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  "Do you want to remove ${winner['name']} from the winners list?"),
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
              child: const Text("Remove"),
              onPressed: () {
                setState(() {
                  winners.remove(winner);
                });
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  // Function to display a dialog and add a new winner to the list
  void _addWinnerDialog() {
    String? selectedWinner;
    String? selectedPosition;

    // Sample list of participants to choose from
    List<String> participants = [
      "John Doe",
      "Jane Smith",
      "Michael Johnson",
      "Emily Davis",
      "David Wilson"
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add Winner"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Dropdown for selecting the winner from the participants list
              DropdownButtonFormField<String>(
                value: selectedWinner,
                items: participants.map((String participant) {
                  return DropdownMenuItem<String>(
                    value: participant,
                    child: Text(participant),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedWinner = newValue;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Select Winner',
                ),
              ),
              // Dropdown for selecting the winner's position
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
                  if (selectedWinner != null && selectedPosition != null) {
                    winners.add({
                      "name": selectedWinner!,
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
