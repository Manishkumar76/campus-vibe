import 'package:campus_vibe/important_methods.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Models/event_model.dart';
import 'EventPage.dart';

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
      description: 'An annual tech festival featuring coding competitions, hackathons, and workshops.',
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
      description: 'A celebration of music, dance, and drama showcasing the diverse cultures of students.',
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
      description: 'A week-long event featuring various sports competitions including athletics, football, and basketball.',
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
      description: 'A hands-on workshop focusing on building and programming robots for various tasks.',
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
      description: 'A showcase of innovative projects by students across various disciplines.',
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
      description: 'A day dedicated to raising awareness about environmental issues through talks and activities.',
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
      description: 'An exhibition showcasing artworks created by students, including paintings, sculptures, and digital art.',
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
      description: 'A guest lecture by an industry expert on the latest trends and advancements in Artificial Intelligence.',
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
      description: 'A 24-hour coding competition where teams develop innovative solutions to real-world problems.',
      eventRegisterStartDate: DateTime(2024, 11, 1),
      eventRegisterEndDate: DateTime(2024, 11, 5),
      eventStartDate: DateTime(2024, 11, 10),
      eventEndDate: DateTime(2024, 11, 11),
      eventStartTime: '10:00 AM',
      totalParticipant: 200,
      departmentId: 109,
      categoryId: 209,
      organizerId: 309,
      venueId: 409,
    ),
    Event(
      id: 10,
      mainImage: 'https://images.unsplash.com/photo-1527280977801-2a3a049526dc',
      photo1: 'https://images.unsplash.com/photo-1496317556649-4babb4a4f2b9',
      photo2: 'https://images.unsplash.com/photo-1507149833265-60c372daea22',
      name: 'Alumni Meet',
      description: 'An event where alumni return to their alma mater to share their experiences and network with current students.',
      eventRegisterStartDate: DateTime(2024, 12, 5),
      eventRegisterEndDate: DateTime(2024, 12, 10),
      eventStartDate: DateTime(2024, 12, 20),
      eventEndDate: DateTime(2024, 12, 20),
      eventStartTime: '05:00 PM',
      totalParticipant: 300,
      departmentId: 110,
      categoryId: 210,
      organizerId: 310,
      venueId: 410,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            _buildCarouselSlider(),
          ],
        ),
      )
    ) ;
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
          height: 250.0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.decelerate,
          pauseAutoPlayOnTouch: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          viewportFraction: 0.8,
          initialPage: 0,
          reverse: false,
          enableInfiniteScroll: true,
          onPageChanged: (index, reason) {
          }),
      items: events.map((event) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventFormPage(),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(event.mainImage,
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Text(
                        event.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 30,
                        left: 20,
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_today,
                                color: Colors.white),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                             ImportantMethods().formatDateString(event.eventStartDate.toString()),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(event.eventStartTime.toString(),
                                style: const TextStyle(color: Colors.white)),
                          ],
                        ))
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
