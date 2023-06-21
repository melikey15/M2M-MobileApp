import 'dart:convert';

import 'package:m2m_flutter_main/model/ratingResponse_model.dart';

RatingRequestModel ratingRequestModelFromJson(String str) =>
    RatingRequestModel.fromJson(json.decode(str));

String ratingRequestModelToJson(RatingRequestModel data) =>
    json.encode(data.toJson());

class RatingRequestModel {
  RatingRequestModel({required this.rating});

  bool rating;

  factory RatingRequestModel.fromJson(Map<String, dynamic> json) =>
      RatingRequestModel(rating: json["rating"]);

  Map<String, dynamic> toJson() => {"rating": rating};
}
