// To parse this JSON data, do
//
//     final getByIdModel = getByIdModelFromJson(jsonString);

import 'dart:convert';

List<GetByIdModel> getByIdModelFromJson(String str) => List<GetByIdModel>.from(
    json.decode(str).map((x) => GetByIdModel.fromJson(x)));

GetByIdModel userModelFromJson(String str) =>
    GetByIdModel.fromJson(json.decode(str));

String getByIdModelToJson(List<GetByIdModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetByIdModel {
  GetByIdModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.userRole,
    required this.avatar,
    required this.ratingAverage,
    required this.rating,
    required this.aboutMe,
    required this.city,
    required this.work,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String surname;
  String email;
  String password;
  int userRole;
  String avatar;
  double ratingAverage;
  List<dynamic> rating;
  String aboutMe;
  String city;
  String work;
  DateTime createdAt;
  DateTime updatedAt;

  factory GetByIdModel.fromJson(Map<String, dynamic> json) => GetByIdModel(
        id: json["id"],
        name: json["name"],
        surname: json["surname"],
        email: json["email"],
        password: json["password"],
        userRole: json["user_role"],
        avatar: json["avatar"],
        ratingAverage: json["ratingAverage"].toDouble(),
        rating: List<dynamic>.from(json["rating"].map((x) => x)),
        aboutMe: json["about_me"],
        city: json["city"],
        work: json["work"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "surname": surname,
        "email": email,
        "password": password,
        "user_role": userRole,
        "avatar": avatar,
        "ratingAverage": ratingAverage,
        "rating": List<dynamic>.from(rating.map((x) => x)),
        "about_me": aboutMe,
        "city": city,
        "work": work,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
