import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/participant_model.dart';
import '../constant/utils.dart';

class ParticipantServices{

  static String baseUrl = '$Utils.baseUrl';

  Future<List<Participants>> fetchParticipants() async {
    final response = await http.get(Uri.parse('${baseUrl}events/participate'));

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return json.map((e) => Participants.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load participants');
    }
  }
  Future<Participants> addParticipant(int eventId,int userId) async {
    final response = await http.post(
      Uri.parse('${baseUrl}events/events/participate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"eventId": eventId, "userId": userId}),
    );
    if(response.statusCode == 200){
      final json = jsonDecode(response.body);
      return Participants.fromJson(json);}
    else{
      throw Exception('Failed to add participant');
    }
  }

  Future<void> updateParticipant(Participants participant) async {
    // Update data to API
  }

  Future<void> deleteParticipant(int id) async {
    // Delete data from API
  }
}