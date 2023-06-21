// To parse this JSON data, do
//
//     final getMeetingModel = getMeetingModelFromJson(jsonString);

import 'dart:convert';

List<GetMeetingModel> getMeetingModelFromJson(String str) =>
    List<GetMeetingModel>.from(
        json.decode(str).map((x) => GetMeetingModel.fromJson(x)));

String getMeetingModelToJson(List<GetMeetingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetMeetingModel {
  GetMeetingModel({
    required this.id,
    required this.menteeId,
    required this.meetingDate,
    required this.startTime,
    required this.endTime,
    required this.message,
    required this.createdById,
    required this.createdAt,
    required this.updatedAt,
    required this.userTableId,
    required this.menteesId,
    required this.menteesName,
    required this.menteesSurname,
    required this.menteesUserRole,
    required this.mentorId,
    required this.mentorName,
    required this.mentorSurname,
    required this.mentorUserRole,
  });

  int id;
  int menteeId;
  DateTime meetingDate;
  String startTime;
  String endTime;
  String message;
  int createdById;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic userTableId;
  int menteesId;
  String menteesName;
  String menteesSurname;
  int menteesUserRole;
  int mentorId;
  String mentorName;
  String mentorSurname;
  int mentorUserRole;

  factory GetMeetingModel.fromJson(Map<String, dynamic> json) =>
      GetMeetingModel(
        id: json["id"],
        menteeId: json["mentee_id"],
        meetingDate: DateTime.parse(json["meeting_date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        message: json["message"],
        createdById: json["createdById"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userTableId: json["userTableId"],
        menteesId: json["mentees.id"],
        menteesName: json["mentees.name"],
        menteesSurname: json["mentees.surname"],
        menteesUserRole: json["mentees.user_role"],
        mentorId: json["mentor.id"],
        mentorName: json["mentor.name"],
        mentorSurname: json["mentor.surname"],
        mentorUserRole: json["mentor.user_role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mentee_id": menteeId,
        "meeting_date": meetingDate.toIso8601String(),
        "start_time": startTime,
        "end_time": endTime,
        "message": message,
        "createdById": createdById,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "userTableId": userTableId,
        "mentees.id": menteesId,
        "mentees.name": menteesName,
        "mentees.surname": menteesSurname,
        "mentees.user_role": menteesUserRole,
        "mentor.id": mentorId,
        "mentor.name": mentorName,
        "mentor.surname": mentorSurname,
        "mentor.user_role": mentorUserRole,
      };
}
