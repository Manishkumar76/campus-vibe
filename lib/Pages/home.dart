import 'package:campus_vibe/Pages/EventPage.dart';
import 'package:flutter/material.dart';
import '../Models/eventCategory_model.dart';
import '../Models/event_model.dart';
import 'notificationPage.dart';
import 'package:campus_vibe/Pages/EventWinnersScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  List<Event> events = [
    Event(
      id: 1,
      mainImage: 'https://fastly.picsum.photos/id/60/1920/1200.jpg?hmac=fAMNjl4E_sG_WNUjdU39Kald5QAHQMh-_-TsIbbeDNI',
      name: 'TechFest 2024',
      description:
      'An annual tech festival featuring coding competitions, hackathons, and workshops.',
      eventRegisterStartDate: DateTime(2024, 10, 1),
      eventRegisterEndDate: DateTime(2024, 10, 10),
      eventStartDate: DateTime(2024, 10, 15),
      eventEndDate: DateTime(2024, 10, 17),
      eventStartTime: '09:00 AM',
      totalParticipant: 500,
      departmentId: 101,
      categoryId: 1,
      organizerId: 301,
      venueId: 401,
    ),
    Event(
      id: 2,
      mainImage: 'https://fastly.picsum.photos/id/342/2896/1944.jpg?hmac=_2cYDHi2iG1XY53gvXOrhrEWIP5R5OJlP7ySYYCA0QA',

      name: 'Cultural Fest',
      description:
      'A celebration of music, dance, and drama showcasing the diverse cultures of students.',
      eventRegisterStartDate: DateTime(2024, 11, 1),
      eventRegisterEndDate: DateTime(2024, 11, 10),
      eventStartDate: DateTime(2024, 11, 15),
      eventEndDate: DateTime(2024, 11, 18),
      eventStartTime: '10:00 AM',
      totalParticipant: 300,
      departmentId: 102,
      categoryId: 2,
      organizerId: 302,
      venueId: 402,
    ),
    Event(
      id: 3,
      mainImage: 'https://fastly.picsum.photos/id/428/2529/1581.jpg?hmac=FmX3-15B3BDpSiq3wq-eiTuAZ51CdKcJwrDeRICFCIU',

      name: 'Annual Sports Meet',
      description:
      'A week-long event featuring various sports competitions including athletics, football, and basketball.',
      eventRegisterStartDate: DateTime(2024, 12, 1),
      eventRegisterEndDate: DateTime(2024, 12, 10),
      eventStartDate: DateTime(2024, 12, 20),
      eventEndDate: DateTime(2024, 12, 25),
      eventStartTime: '08:00 AM',
      totalParticipant: 400,
      departmentId: 103,
      categoryId: 3,
      organizerId: 303,
      venueId: 403,
    ),
    Event(
      id: 4,
      mainImage: 'https://fastly.picsum.photos/id/341/5000/3337.jpg?hmac=au9Ex3OCaHWkfF3Ttoe4sXkQOsGPGeA1vrRwhmB2aug',

      name: 'Robotics Workshop',
      description:
      'A hands-on workshop focusing on building and programming robots for various tasks.',
      eventRegisterStartDate: DateTime(2024, 9, 1),
      eventRegisterEndDate: DateTime(2024, 9, 5),
      eventStartDate: DateTime(2024, 9, 10),
      eventEndDate: DateTime(2024, 9, 12),
      eventStartTime: '11:00 AM',
      totalParticipant: 100,
      departmentId: 104,
      categoryId: 4,
      organizerId: 304,
      venueId: 404,
    ),
    Event(
      id: 5,
      mainImage: 'https://fastly.picsum.photos/id/178/2592/1936.jpg?hmac=lW1JtHlmevwr41pQSILng2JYKGlX7fLMmptsz45JKZ0',

      name: 'Innovation Day',
      description:
      'A showcase of innovative projects by students across various disciplines.',
      eventRegisterStartDate: DateTime(2024, 9, 15),
      eventRegisterEndDate: DateTime(2024, 9, 25),
      eventStartDate: DateTime(2024, 10, 1),
      eventEndDate: DateTime(2024, 10, 2),
      eventStartTime: '09:30 AM',
      totalParticipant: 200,
      departmentId: 105,
      categoryId: 5,
      organizerId: 305,
      venueId: 405,
    ),
    Event(
      id: 6,
      mainImage: 'https://fastly.picsum.photos/id/159/5000/2460.jpg?hmac=h12oeFVhY4-vOrALaICJ4k4dqemWn1lvaMN8yvnIU1w',

      name: 'Environmental Day',
      description:
      'A day dedicated to raising awareness about environmental issues through talks and activities.',
      eventRegisterStartDate: DateTime(2024, 10, 5),
      eventRegisterEndDate: DateTime(2024, 10, 10),
      eventStartDate: DateTime(2024, 10, 15),
      eventEndDate: DateTime(2024, 10, 15),
      eventStartTime: '10:30 AM',
      totalParticipant: 150,
      departmentId: 106,
      categoryId: 6,
      organizerId: 306,
      venueId: 406,
    ),
    Event(
      id: 7,
      mainImage: 'https://fastly.picsum.photos/id/143/3600/2385.jpg?hmac=gSMmnYrmuP5BJ47kmErfYdYu1L1GLePM1SNm-D2lqiA',

      name: 'Art Exhibition',
      description:
      'An exhibition showcasing artworks created by students, including paintings, sculptures, and digital art.',
      eventRegisterStartDate: DateTime(2024, 11, 5),
      eventRegisterEndDate: DateTime(2024, 11, 10),
      eventStartDate: DateTime(2024, 11, 20),
      eventEndDate: DateTime(2024, 11, 22),
      eventStartTime: '11:00 AM',
      totalParticipant: 100,
      departmentId: 107,
      categoryId: 7,
      organizerId: 307,
      venueId: 407,
    ),
    Event(
      id: 8,
      mainImage: 'https://fastly.picsum.photos/id/160/3200/2119.jpg?hmac=cz68HnnDt3XttIwIFu5ymcvkCp-YbkEBAM-Zgq-4DHE',
      name: 'Guest Lecture on AI',
      description:
      'A guest lecture by an industry expert on the latest trends and advancements in Artificial Intelligence.',
      eventRegisterStartDate: DateTime(2024, 9, 20),
      eventRegisterEndDate: DateTime(2024, 9, 25),
      eventStartDate: DateTime(2024, 9, 30),
      eventEndDate: DateTime(2024, 9, 30),
      eventStartTime: '12:00 PM',
      totalParticipant: 250,
      departmentId: 108,
      categoryId: 4,
      organizerId: 308,
      venueId: 408,
    ),
    Event(
      id: 9,
      mainImage: 'https://fastly.picsum.photos/id/180/2400/1600.jpg?hmac=Ig-CXcpNdmh51k3kXpNqNqcDYTwXCIaonYiBOnLXBb8',
      name: 'Hackathon 2024',
      description:
      'A 24-hour coding competition where teams develop innovative solutions to real-world problems.',
      eventRegisterStartDate: DateTime(2024, 11, 1),
      eventRegisterEndDate: DateTime(2024, 11, 5),
      eventStartDate: DateTime(2024, 11, 10),
      eventEndDate: DateTime(2024, 11, 11),
      eventStartTime: '02:00 PM',
      totalParticipant: 150,
      departmentId: 109,
      categoryId: 1,
      organizerId: 309,
      venueId: 409,
    ),
    Event(
      id: 10,
      mainImage: 'https://fastly.picsum.photos/id/163/2000/1333.jpg?hmac=htdHeSJwlYOxS8b0TTpz2s8tD_QDlmsd3JHYa_HGrg8',
      name: 'Entrepreneurship Summit',
      description:
      'A summit featuring talks and workshops by successful entrepreneurs, aimed at inspiring students to start their own ventures.',
      eventRegisterStartDate: DateTime(2024, 12, 1),
      eventRegisterEndDate: DateTime(2024, 12, 10),
      eventStartDate: DateTime(2024, 12, 15),
      eventEndDate: DateTime(2024, 12, 16),
      eventStartTime: '09:00 AM',
      totalParticipant: 200,
      departmentId: 110,
      categoryId: 5,
      organizerId: 310,
      venueId: 410,
    ),
  ];

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

  int _getCategoryId(String categoryName) {
    return categories.firstWhere((category) => category.name == categoryName).id;
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
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Hi,',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.indigo ,
                  fontSize: 20,
                ),
              ),
              Text(
                'User! 👋',
                style: TextStyle(
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
