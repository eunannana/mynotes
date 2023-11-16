// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Reminder {
  int id;
  String title;
  String dateTime;

  Reminder({
    required this.id,
    required this.title,
    required this.dateTime,
  });

  Reminder copyWith({
    int? id,
    String? title,
    String? dateTime,
  }) {
    return Reminder(
      id: id ?? this.id,
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'dateTime': dateTime,
    };
  }

  factory Reminder.fromMap(Map<String, dynamic> map) {
    return Reminder(
      id: map['id'] as int,
      title: map['title'] as String,
      dateTime: map['dateTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reminder.fromJson(String source) => Reminder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Reminder(id: $id, title: $title, dateTime: $dateTime)';

  @override
  bool operator ==(covariant Reminder other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.dateTime == dateTime;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ dateTime.hashCode;
}
