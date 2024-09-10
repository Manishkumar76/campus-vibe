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
      mainImage: 'https://example.com/images/techfest.jpg',
      photo1: 'https://example.com/images/techfest1.jpg',
      photo2: 'https://example.com/images/techfest2.jpg',
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
      mainImage: 'https://example.com/images/cultural_fest.jpg',
      photo1: 'https://example.com/images/cultural_fest1.jpg',
      photo2: 'https://example.com/images/cultural_fest2.jpg',
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
      mainImage: 'https://example.com/images/sports_meet.jpg',
      photo1: 'https://example.com/images/sports_meet1.jpg',
      photo2: 'https://example.com/images/sports_meet2.jpg',
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
      mainImage: 'https://example.com/images/robotics.jpg',
      photo1: 'https://example.com/images/robotics1.jpg',
      photo2: 'https://example.com/images/robotics2.jpg',
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
      mainImage: 'https://example.com/images/innovation_day.jpg',
      photo1: 'https://example.com/images/innovation_day1.jpg',
      photo2: 'https://example.com/images/innovation_day2.jpg',
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
      mainImage: 'https://example.com/images/environmental_day.jpg',
      photo1: 'https://example.com/images/environmental_day1.jpg',
      photo2: 'https://example.com/images/environmental_day2.jpg',
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
      mainImage: 'https://example.com/images/art_exhibition.jpg',
      photo1: 'https://example.com/images/art_exhibition1.jpg',
      photo2: 'https://example.com/images/art_exhibition2.jpg',
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
      mainImage: 'https://example.com/images/guest_lecture.jpg',
      photo1: 'https://example.com/images/guest_lecture1.jpg',
      photo2: 'https://example.com/images/guest_lecture2.jpg',
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
      mainImage: 'https://example.com/images/hackathon.jpg',
      photo1: 'https://example.com/images/hackathon1.jpg',
      photo2: 'https://example.com/images/hackathon2.jpg',
      name: 'Hackathon 2024',
      description: 'A 24-hour coding competition where teams develop innovative solutions to real-world problems.',
      eventRegisterStartDate: DateTime(2024, 11, 1),
      eventRegisterEndDate: DateTime(2024, 11, 5),
      eventStartDate: DateTime(2024, 11, 10),
      eventEndDate: DateTime(2024, 11, 11),
      eventStartTime: '09:00 AM',
      totalParticipant: 200,
      departmentId: 109,
      categoryId: 209,
      organizerId: 309,
      venueId: 409,
    ),
    Event(
      id: 10,
      mainImage: 'https://example.com/images/startup_pitch.jpg',
      photo1: 'https://example.com/images/startup_pitch1.jpg',
      photo2: 'https://example.com/images/startup_pitch2.jpg',
      name: 'Startup Pitch Event',
      description: 'An event where student entrepreneurs pitch their startup ideas to a panel of judges and potential investors.',
      eventRegisterStartDate: DateTime(2024, 10, 15),
      eventRegisterEndDate: DateTime(2024, 10, 20),
      eventStartDate: DateTime(2024, 10, 25),
      eventEndDate: DateTime(2024, 10, 25),
      eventStartTime: '02:00 PM',
      totalParticipant: 150,
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
