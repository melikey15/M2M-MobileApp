// To parse this JSON data, do
//
//     final createMeetingRequestModel = createMeetingRequestModelFromJson(jsonString);

import 'dart:convert';

CreateMeetingRequestModel createMeetingRequestModelFromJson(String str) =>
    CreateMeetingRequestModel.fromJson(json.decode(str));

String createMeetingRequestModelToJson(CreateMeetingRequestModel data) =>
    json.encode(data.toJson());

class CreateMeetingRequestModel {
  CreateMeetingRequestModel({
    required this.menteeId,
    required this.meetingDate,
    required this.startTime,
    required this.endTime,
    required this.message,
  });

  int menteeId;
  DateTime meetingDate;
  String startTime;
  String endTime;
  String message;

  factory CreateMeetingRequestModel.fromJson(Map<String, dynamic> json) =>
      CreateMeetingRequestModel(
        menteeId: json["mentee_id"],
        meetingDate: json["meeting_date"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "mentee_id": menteeId,
        "meeting_date": meetingDate,
        "start_time": startTime,
        "end_time": endTime,
        "message": message,
      };
}
