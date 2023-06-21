// To parse this JSON data, do
//
//     final createMeetingResponseModel = createMeetingResponseModelFromJson(jsonString);

import 'dart:convert';

CreateMeetingResponseModel createMeetingResponseModelFromJson(String str) =>
    CreateMeetingResponseModel.fromJson(json.decode(str));

String createMeetingResponseModelToJson(CreateMeetingResponseModel data) =>
    json.encode(data.toJson());

class CreateMeetingResponseModel {
  CreateMeetingResponseModel({
    required this.newMeeting,
  });

  NewMeeting newMeeting;

  factory CreateMeetingResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateMeetingResponseModel(
        newMeeting: NewMeeting.fromJson(json["newMeeting"]),
      );

  Map<String, dynamic> toJson() => {
        "newMeeting": newMeeting.toJson(),
      };
}

class NewMeeting {
  NewMeeting({
    required this.id,
    required this.menteeId,
    required this.meetingDate,
    required this.startTime,
    required this.endTime,
    required this.message,
    required this.createdById,
    required this.updatedAt,
    required this.createdAt,
    required this.userTableId,
  });

  int id;
  int menteeId;
  DateTime meetingDate;
  String startTime;
  String endTime;
  String message;
  int createdById;
  DateTime updatedAt;
  DateTime createdAt;
  dynamic userTableId;

  factory NewMeeting.fromJson(Map<String, dynamic> json) => NewMeeting(
        id: json["id"],
        menteeId: json["mentee_id"],
        meetingDate: DateTime.parse(json["meeting_date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        message: json["message"],
        createdById: json["createdById"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        userTableId: json["userTableId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mentee_id": menteeId,
        "meeting_date": meetingDate.toIso8601String(),
        "start_time": startTime,
        "end_time": endTime,
        "message": message,
        "createdById": createdById,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "userTableId": userTableId,
      };
}
