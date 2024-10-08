import 'package:campus_vibe/Pages/EventPage.dart';
import 'package:campus_vibe/services/event_services.dart';
import 'package:campus_vibe/services/user_services.dart';
import 'package:flutter/material.dart';
import '../Models/eventCategory_model.dart';
import '../Models/event_model.dart';
import '../Models/user_model.dart';
import 'notificationPage.dart';
import 'package:campus_vibe/Pages/EventWinnersScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {


  var events= EventServices.eventList;
  List<Category> categories=[
    Category(id: 1, name: "Technical", icon:Icons.computer_rounded ),
    Category(id: 2, name: "Cultural", icon:Icons.palette_rounded ),
    Category(id: 3, name: "Sports", icon:Icons.sports_soccer_rounded ),
    Category(id: 4, name: "Robotics", icon:Icons.android_rounded ),
    Category(id: 5, name: "Innovation", icon:Icons.lightbulb_rounded ),
    Category(id: 6, name: "Environment", icon:Icons.eco_rounded ),
    Category(id: 7, name: "Art", icon:Icons.palette_rounded ),
    Category(id: 10, name: "Entrepreneurship", icon:Icons.business_center_rounded ),
  ];

// Default icon color
  final Color defaultIconColor = Colors.grey;
  // Highlighted icon color
  final Color highlightedIconColor=Colors.indigo;

  String selectedCategory ="All";

  User userdata= UserServices.userData;

  int _getCategoryId(String categoryName) {
    return categories.firstWhere((category) => category.name == categoryName).id;
  }

  @override
  void initState() async{
    super.initState();
    await EventServices().fetchAllEvents();
  }
  @override
  Widget build(BuildContext context) {
    List<Event> filteredEvents = (selectedCategory == 'All'
        ? events
        : events.where((event) => event.categoryId == _getCategoryId(selectedCategory)).toList());

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
                backgroundColor: Colors.transparent, // Use transparent to allow the Container's color to show
                elevation: 0,
                title: const Text("Campus Vibe",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                actions: [
                  IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.notifications),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationPage()),
                      );
                    },
                  ),
                ],
                toolbarHeight: 80.0, // Adjust as needed
              ),
            ),
          ),
          body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8 ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                _buildInitialBar(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  const Text("Winners...",style: TextStyle(fontWeight:FontWeight.bold ,fontSize: 20),),
                  TextButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder:(_)=>EventWinnersScreen()));
                  }, child: const Text('See All',style: TextStyle(fontSize: 15),))
                ],),
                _buildWinnerGrid(),
                _buildCategoryBar(),
                _buildEventList(filteredEvents),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget _buildCategoryBar() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Categories',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  selectedCategory='All';
                });

              },
              child: const Text(
                'See All',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (var i = 0; i < categories.length; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = categories[i].name;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: selectedCategory==categories[i].name?Colors.indigo.shade400: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(categories[i].icon,color: selectedCategory==categories[i].name?Colors.white:Colors.black),
                        ),
                        const SizedBox(height: 4),
                         Text(
                          categories[i].name,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
  Widget _buildInitialBar() {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Hi,',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.indigo ,
                  fontSize: 20,
                ),
              ),
              Text(
                '${userdata.name}! 👋',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.indigo,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(height: 3),
          Text(
            'Explore more and participate',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWinnerGrid() {
    return SizedBox(
      height: 300.0, // Set a fixed height for the grid
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), // Grid won't scroll
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          crossAxisSpacing: 10.0, // Space between columns
          mainAxisSpacing: 8.0, // Space between rows
          childAspectRatio: 0.7, // Adjust aspect ratio to control height
        ),
        itemCount: 6, // Number of items in the grid
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners
                    color: Colors.grey[200], // Background color
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/profile.jpeg',
                      fit: BoxFit.cover, // Fit image within the grid item
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5), // Space between image and text
              const Text(
                "Winner Name",
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.center, // Center align text
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEventList( List<Event> Events) {
    return SizedBox(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemExtent: 400,
        primary: false,
        padding: const EdgeInsets.all(8.0),
        itemCount: Events.length,
        itemBuilder: (BuildContext context, index) {
          final event = Events[index];
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
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 200,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: SizedBox(
                          height: 250,
                          width: double.infinity,
                          child: Image.network( event.mainImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      title: Text(
                        event.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8.0),
                          Text('Venue: ${event.venueId}'),
                          Text('Timing: ${event.eventStartTime}'),
                          Text('Organizer: ${event.organizerId}'),
                        ],
                      ),
                      isThreeLine: true,
                      tileColor: Colors.grey[200],

                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }




//   Widget _buildCarouselSlider() {
//     return CarouselSlider(
//       options: CarouselOptions(
//           height: 250.0,
//           autoPlay: true,
//           autoPlayInterval: const Duration(seconds: 5),
//           autoPlayAnimationDuration: const Duration(milliseconds: 800),
//           autoPlayCurve: Curves.decelerate,
//           pauseAutoPlayOnTouch: true,
//           aspectRatio: 2.0,
//           enlargeCenterPage: true,
//           scrollDirection: Axis.horizontal,
//           viewportFraction: 0.8,
//           initialPage: 0,
//           reverse: false,
//           enableInfiniteScroll: true,
//           onPageChanged: (index, reason) {
//           }),
//       items: events.map((event) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Container(
//               margin: const EdgeInsets.symmetric(horizontal: 8.0),
//               decoration:
//               BoxDecoration(borderRadius: BorderRadius.circular(10)),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => EventFormPage(),
//                     ),
//                   );
//                 },
//                 child: Stack(
//                   children: [
//                     SizedBox(
//                       width: double.infinity,
//                       height: 300,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.network(event.mainImage,
//                             fit: BoxFit.cover),
//                       ),
//                     ),
//                     Positioned(
//                       top: 20,
//                       left: 20,
//                       child: Text(
//                         event.name,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w800,
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                         bottom: 30,
//                         left: 20,
//                         child: Row(
//                           children: [
//                             const Icon(Icons.calendar_today,
//                                 color: Colors.white),
//                             const SizedBox(
//                               width: 4,
//                             ),
//                             Text(
//                              ImportantMethods().formatDateString(event.eventStartDate.toString()),
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w800,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 6,
//                             ),
//                             Text(event.eventStartTime.toString(),
//                                 style: const TextStyle(color: Colors.white)),
//                           ],
//                         ))
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       }).toList(),
//     );
//   }
}
