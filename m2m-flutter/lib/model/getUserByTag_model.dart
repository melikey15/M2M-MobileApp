// To parse this JSON data, do
//
//     final getUserByTagModel = getUserByTagModelFromJson(jsonString);

import 'dart:convert';

List<GetUserByTagModel> getUserByTagModelFromJson(String str) =>
    List<GetUserByTagModel>.from(
        json.decode(str).map((x) => GetUserByTagModel.fromJson(x)));

String getUserByTagModelToJson(List<GetUserByTagModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetUserByTagModel {
  GetUserByTagModel({
    required this.id,
    required this.userId,
    required this.tagId,
    required this.createdAt,
    required this.updatedAt,
    required this.userTableId,
    required this.tagTableId,
    required this.tagTagId,
    required this.tagTagTagName,
    required this.tagTagCreatedAt,
    required this.tagTagUpdatedAt,
    required this.userTagId,
    required this.userTagName,
    required this.userTagSurname,
    required this.userTagEmail,
    required this.userTagPassword,
    required this.userTagUserRole,
    required this.userTagAvatar,
    required this.userTagRatingAverage,
    required this.userTagRating,
    required this.userTagAboutMe,
    required this.userTagCity,
    required this.userTagWork,
    required this.userTagCreatedAt,
    required this.userTagUpdatedAt,
  });

  int id;
  int userId;
  int tagId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic userTableId;
  dynamic tagTableId;
  int tagTagId;
  String tagTagTagName;
  DateTime tagTagCreatedAt;
  DateTime tagTagUpdatedAt;
  int userTagId;
  String userTagName;
  String userTagSurname;
  String userTagEmail;
  String userTagPassword;
  int userTagUserRole;
  String userTagAvatar;
  int userTagRatingAverage;
  List<int> userTagRating;
  String userTagAboutMe;
  String userTagCity;
  String userTagWork;
  DateTime userTagCreatedAt;
  DateTime userTagUpdatedAt;

  factory GetUserByTagModel.fromJson(Map<String, dynamic> json) =>
      GetUserByTagModel(
        id: json["id"],
        userId: json["user_id"],
        tagId: json["tag_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userTableId: json["userTableId"],
        tagTableId: json["tagTableId"],
        tagTagId: json["tag_tag.id"],
        tagTagTagName: json["tag_tag.tag_name"],
        tagTagCreatedAt: DateTime.parse(json["tag_tag.createdAt"]),
        tagTagUpdatedAt: DateTime.parse(json["tag_tag.updatedAt"]),
        userTagId: json["user_tag.id"],
        userTagName: json["user_tag.name"],
        userTagSurname: json["user_tag.surname"],
        userTagEmail: json["user_tag.email"],
        userTagPassword: json["user_tag.password"],
        userTagUserRole: json["user_tag.user_role"],
        userTagAvatar: json["user_tag.avatar"],
        userTagRatingAverage: json["user_tag.ratingAverage"],
        userTagRating: List<int>.from(json["user_tag.rating"].map((x) => x)),
        userTagAboutMe: json["user_tag.about_me"],
        userTagCity: json["user_tag.city"],
        userTagWork: json["user_tag.work"],
        userTagCreatedAt: DateTime.parse(json["user_tag.createdAt"]),
        userTagUpdatedAt: DateTime.parse(json["user_tag.updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "tag_id": tagId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "userTableId": userTableId,
    "tagTableId": tagTableId,
    "tag_tag.id": tagTagId,
    "tag_tag.tag_name": tagTagTagName,
    "tag_tag.createdAt": tagTagCreatedAt.toIso8601String(),
    "tag_tag.updatedAt": tagTagUpdatedAt.toIso8601String(),
    "user_tag.id": userTagId,
    "user_tag.name": userTagName,
    "user_tag.surname": userTagSurname,
    "user_tag.email": userTagEmail,
    "user_tag.password": userTagPassword,
    "user_tag.user_role": userTagUserRole,
    "user_tag.avatar": userTagAvatar,
    "user_tag.ratingAverage": userTagRatingAverage,
    "user_tag.rating": List<dynamic>.from(userTagRating.map((x) => x)),
    "user_tag.about_me": userTagAboutMe,
    "user_tag.city": userTagCity,
    "user_tag.work": userTagWork,
    "user_tag.createdAt": userTagCreatedAt.toIso8601String(),
    "user_tag.updatedAt": userTagUpdatedAt.toIso8601String(),
  };
}
