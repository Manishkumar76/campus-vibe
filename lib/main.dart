import 'package:campus_vibe/Pages/EventListPage.dart';
import 'package:campus_vibe/Pages/live.dart';
import 'package:campus_vibe/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Models/user_model.dart';
import 'Pages/SplashScreen.dart';
import 'Pages/addNewEvent.dart';
import 'Pages/profile.dart';
import 'Pages/search.dart';

void main() {

  runApp(
      ChangeNotifierProvider(
          create: (context) => User(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 6, 33, 63)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    SearchPage(),
    EventListPage(), // Replace this with the imported EventPage
    LivePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Default icon color
    final Color defaultIconColor = Colors.grey;
    // Highlighted icon color
    final Color highlightedIconColor = Colors.indigo;

    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: _widgetOptions,
          ),
          Positioned(
            bottom: 70.0, // Adjust this value to set the distance from the BottomAppBar
            right: 10.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddEventPage()),
                );
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, -4), // Shadow below the BottomAppBar
            ),
          ],
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          height: 70,// Use transparent to show the Container's color
          shape: const CircularNotchedRectangle( ),
          notchMargin: 6.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: _selectedIndex == 0 ? highlightedIconColor : defaultIconColor,
                ),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: _selectedIndex == 1 ? highlightedIconColor : defaultIconColor,
                ),
                onPressed: () => _onItemTapped(1),
              ),
              IconButton(
                icon: Icon(
                  Icons.event,
                  color: _selectedIndex == 2 ? highlightedIconColor : defaultIconColor,
                ),
                onPressed: () => _onItemTapped(2),
              ),
              IconButton(
                icon: Icon(
                  Icons.live_tv,
                  color: _selectedIndex == 3 ? highlightedIconColor : defaultIconColor,
                ),
                onPressed: () => _onItemTapped(3),
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: _selectedIndex == 4 ? highlightedIconColor : defaultIconColor,
                ),
                onPressed: () => _onItemTapped(4),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}