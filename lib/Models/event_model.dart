import 'package:flutter/material.dart';
class Event {

  final int id;
  final String mainImage;

  final String name;
  final String description;
  final String eventRegisterEndDate;
  final String eventStartDate;
  final String eventEndDate;
  final String eventStartTime;
  final int totalParticipant;
  final int departmentId;
  final int categoryId;
  final int organizerId;
  final int venueId;

  Event({
     this.id=0,
     this.mainImage="",
     this.name="",
     this.description="",
     this.eventRegisterEndDate="",
     this.eventStartDate = "",
     this.eventEndDate  = "",
     this.eventStartTime  = "",
     this.totalParticipant  = 0,
     this.departmentId  = 0,
     this.categoryId  = 0,
     this.organizerId = 0,
     this.venueId = 0,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      mainImage: json['main_image'],
      name: json['name'],
      description: json['description'],
      eventRegisterEndDate: json['event_register_end_date'],
      eventStartDate: json['event_start_date'],
      eventEndDate: json['event_end_date'],
      eventStartTime: json['event_start_time'],
      totalParticipant: json['total_participant'],
      departmentId: json['department_id'],
      categoryId: json['category_id'],
      organizerId: json['organizer_id'],
      venueId: json['venue_id'],
    );
  }



  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'main_image': mainImage,

      'name': name,
      'description': description,
      'event_register_end_date': eventRegisterEndDate,
      'event_start_date': eventStartDate,
      'event_end_date': eventEndDate,
      'event_start_time': eventStartTime,
      'total_participant': totalParticipant,
      'department_id': departmentId,
      'category_id': categoryId,
      'organizer_id': organizerId,
      'venue_id': venueId,
    };
  }


}