import 'dart:convert';

FeedBackResponseModel feedBackResponseModelFromJson(String str) =>
    FeedBackResponseModel.fromJson(json.decode(str));

String feedBackResponseModelToJson(FeedBackResponseModel data) =>
    json.encode(data.toJson());

class FeedBackResponseModel {
  FeedBackResponseModel({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory FeedBackResponseModel.fromJson(Map<String, dynamic> json) =>
      FeedBackResponseModel(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}