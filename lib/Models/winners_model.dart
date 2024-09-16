class Winners{
  late int id;
  late String position;
  late int UserId;
  late int EventId;

  Winners({
    required this.id,
    required this.position,
    required this.UserId,
    required this.EventId
  });

  factory Winners.fromJson(Map<String, dynamic> json) {
    return Winners(
        id: json['id'],
        position: json['position'],
        UserId: json['UserId'],
        EventId: json['EventId']
    );
  }

  Object? toJson() {
    return {
      'id': id,
      'position': position,
      'UserId': UserId,
      'EventId': EventId
    };
  }
}