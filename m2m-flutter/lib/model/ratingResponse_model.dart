// To parse this JSON data, do
//
//     final ratingResponseModel = ratingResponseModelFromJson(jsonString);

import 'dart:convert';

RatingResponseModel ratingResponseModelFromJson(String str) =>
    RatingResponseModel.fromJson(json.decode(str));

String ratingResponseModelToJson(RatingResponseModel data) =>
    json.encode(data.toJson());

class RatingResponseModel {
  RatingResponseModel({
    required this.userWithAverage,
  });

  List<int> userWithAverage;

  factory RatingResponseModel.fromJson(Map<String, dynamic> json) =>
      RatingResponseModel(
        userWithAverage: List<int>.from(json["userWithAverage"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "userWithAverage": List<dynamic>.from(userWithAverage.map((x) => x)),
      };
}
