import 'package:campus_vibe/Pages/EventListPage.dart';
import 'package:flutter/material.dart';
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
      mainImage: 'https://images.unsplash.com/photo-1557804506-669a67965ba0',
      photo1: 'https://images.unsplash.com/photo-1563122871-a7f66e98d4d3',
      photo2: 'https://images.unsplash.com/photo-1506784983877-45594efa4cbe',
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
      categoryId: 201,
      organizerId: 301,
      venueId: 401,
    ),
    Event(
      id: 2,
      mainImage: 'https://images.unsplash.com/photo-1576186726115-4d6a16e918a2',
      photo1: 'https://images.unsplash.com/photo-1576186726115-4d6a16e918a2',
      photo2: 'https://images.unsplash.com/photo-1580489944761-15a19d654956',
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
      categoryId: 202,
      organizerId: 302,
      venueId: 402,
    ),
    Event(
      id: 3,
      mainImage: 'https://images.unsplash.com/photo-1571631649249-74bcb80826d7',
      photo1: 'https://images.unsplash.com/photo-1608897013037-4e0274c19e8a',
      photo2: 'https://images.unsplash.com/photo-1553531580-3506c60f1822',
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
      categoryId: 203,
      organizerId: 303,
      venueId: 403,
    ),
    Event(
      id: 4,
      mainImage: 'https://images.unsplash.com/photo-1542718619-4b31a1b1e3e3',
      photo1: 'https://images.unsplash.com/photo-1542718619-4b31a1b1e3e3',
      photo2: 'https://images.unsplash.com/photo-1567767292225-10e2dcf3ea10',
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
      categoryId: 204,
      organizerId: 304,
      venueId: 404,
    ),
    Event(
      id: 5,
      mainImage: 'https://images.unsplash.com/photo-1581090700227-5e07a4b7a2b2',
      photo1: 'https://images.unsplash.com/photo-1542145936-f758a8d9b79b',
      photo2: 'https://images.unsplash.com/photo-1542145936-f758a8d9b79b',
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
      categoryId: 205,
      organizerId: 305,
      venueId: 405,
    ),
    Event(
      id: 6,
      mainImage: 'https://images.unsplash.com/photo-1569693139405-7ce81e43484b',
      photo1: 'https://images.unsplash.com/photo-1569693139405-7ce81e43484b',
      photo2: 'https://images.unsplash.com/photo-1529612700005-f77199c78f62',
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
      categoryId: 206,
      organizerId: 306,
      venueId: 406,
    ),
    Event(
      id: 7,
      mainImage: 'https://images.unsplash.com/photo-1565373058210-3c87ecf312e5',
      photo1: 'https://images.unsplash.com/photo-1565373058210-3c87ecf312e5',
      photo2: 'https://images.unsplash.com/photo-1501785888041-af3ef285b470',
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
      categoryId: 207,
      organizerId: 307,
      venueId: 407,
    ),
    Event(
      id: 8,
      mainImage: 'https://images.unsplash.com/photo-1518460279809-42e5a4a7f8aa',
      photo1: 'https://images.unsplash.com/photo-1555685812-4b74332f563e',
      photo2: 'https://images.unsplash.com/photo-1517059224940-d4af9eec41e4',
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
      categoryId: 208,
      organizerId: 308,
      venueId: 408,
    ),
    Event(
      id: 9,
      mainImage: 'https://images.unsplash.com/photo-1556485688-52f9f6832f27',
      photo1: 'https://images.unsplash.com/photo-1542728918-8b5119af80e8',
      photo2: 'https://images.unsplash.com/photo-1557426272-fc759fdf7a8d',
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
      categoryId: 209,
      organizerId: 309,
      venueId: 409,
    ),
    Event(
      id: 10,
      mainImage: 'https://images.unsplash.com/photo-1494173853739-c21f58b16055',
      photo1: 'https://images.unsplash.com/photo-1494173853739-c21f58b16055',
      photo2: 'https://images.unsplash.com/photo-1494173853739-c21f58b16055',
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
      categoryId: 210,
      organizerId: 310,
      venueId: 410,
    ),
  ];

// Default icon color
  final Color defaultIconColor = Colors.grey;
  // Highlighted icon color
  final Color highlightedIconColor=Colors.indigo;
  @override
  Widget build(BuildContext context) {
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
                _buildEventList(),
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
              onPressed: () {},
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
              for (var i = 0; i < 6; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.category),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Category',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
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
      height: 400.0, // Set a fixed height for the grid
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

  Widget _buildEventList() {
    return SizedBox(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemExtent: 400,
        primary: false,
        padding: const EdgeInsets.all(8.0),
        itemCount: events.length,
        itemBuilder: (BuildContext context, index) {
          final event = events[index];
          return Card(
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
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(event.mainImage,fit: BoxFit.fill,)),
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventListPage(),
                        ),
                      );
                    },
                  ),
                ],
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
