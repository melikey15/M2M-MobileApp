import 'dart:convert';

FeedBackRequestModel feedBackRequestModelFromJson(String str) =>
    FeedBackRequestModel.fromJson(json.decode(str));

String feedBackRequestModelToJson(FeedBackRequestModel data) =>
    json.encode(data.toJson());

class FeedBackRequestModel {
  FeedBackRequestModel({
    required this.name,
    required this.email,
    required this.feedBackCategory,
    required this.message,
  });

  String name;
  String email;
  String feedBackCategory;
  String message;

  factory FeedBackRequestModel.fromJson(Map<String, dynamic> json) =>
      FeedBackRequestModel(
        name: json["name"],
        email: json["email"],
        feedBackCategory: json["feedBackCategory"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "feedBackCategory": feedBackCategory,
    "message": message,
  };
}