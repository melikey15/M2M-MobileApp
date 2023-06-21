// To parse this JSON data, do
//
//     final getMyFavoritesModel = getMyFavoritesModelFromJson(jsonString);

import 'dart:convert';

List<GetMyFavoritesModel> getMyFavoritesModelFromJson(String str) =>
    List<GetMyFavoritesModel>.from(
        json.decode(str).map((x) => GetMyFavoritesModel.fromJson(x)));

String getMyFavoritesModelToJson(List<GetMyFavoritesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetMyFavoritesModel {
  GetMyFavoritesModel({
    required this.id,
    required this.userId,
    required this.favId,
    required this.createdAt,
    required this.updatedAt,
    required this.userTableId,
    required this.favMentorsId,
    required this.favMentorsName,
    required this.favMentorsSurname,
    required this.favMentorsEmail,
    required this.favMentorsPassword,
    required this.favMentorsUserRole,
    required this.favMentorsAvatar,
    required this.favMentorsRatingAverage,
    required this.favMentorsRating,
    required this.favMentorsAboutMe,
    required this.favMentorsCity,
    required this.favMentorsWork,
    required this.favMentorsCreatedAt,
    required this.favMentorsUpdatedAt,
  });

  int id;
  int userId;
  int favId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic userTableId;
  int favMentorsId;
  String favMentorsName;
  String favMentorsSurname;
  String favMentorsEmail;
  String favMentorsPassword;
  int favMentorsUserRole;
  String favMentorsAvatar;
  int favMentorsRatingAverage;
  List<dynamic> favMentorsRating;
  String favMentorsAboutMe;
  String favMentorsCity;
  String favMentorsWork;
  DateTime favMentorsCreatedAt;
  DateTime favMentorsUpdatedAt;

  factory GetMyFavoritesModel.fromJson(Map<String, dynamic> json) =>
      GetMyFavoritesModel(
        id: json["id"],
        userId: json["user_id"],
        favId: json["fav_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userTableId: json["userTableId"],
        favMentorsId: json["favMentors.id"],
        favMentorsName: json["favMentors.name"],
        favMentorsSurname: json["favMentors.surname"],
        favMentorsEmail: json["favMentors.email"],
        favMentorsPassword: json["favMentors.password"],
        favMentorsUserRole: json["favMentors.user_role"],
        favMentorsAvatar: json["favMentors.avatar"],
        favMentorsRatingAverage: json["favMentors.ratingAverage"].toDouble(),
        favMentorsRating:
            List<dynamic>.from(json["favMentors.rating"].map((x) => x)),
        favMentorsAboutMe: json["favMentors.about_me"],
        favMentorsCity: json["favMentors.city"],
        favMentorsWork: json["favMentors.work"],
        favMentorsCreatedAt: DateTime.parse(json["favMentors.createdAt"]),
        favMentorsUpdatedAt: DateTime.parse(json["favMentors.updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "fav_id": favId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "userTableId": userTableId,
        "favMentors.id": favMentorsId,
        "favMentors.name": favMentorsName,
        "favMentors.surname": favMentorsSurname,
        "favMentors.email": favMentorsEmail,
        "favMentors.password": favMentorsPassword,
        "favMentors.user_role": favMentorsUserRole,
        "favMentors.avatar": favMentorsAvatar,
        "favMentors.ratingAverage": favMentorsRatingAverage,
        "favMentors.rating": List<dynamic>.from(favMentorsRating.map((x) => x)),
        "favMentors.about_me": favMentorsAboutMe,
        "favMentors.city": favMentorsCity,
        "favMentors.work": favMentorsWork,
        "favMentors.createdAt": favMentorsCreatedAt.toIso8601String(),
        "favMentors.updatedAt": favMentorsUpdatedAt.toIso8601String(),
      };
}
