// To parse this JSON data, do
//
//     final getUsersAllModel = getUsersAllModelFromJson(jsonString);

import 'dart:convert';

List<GetUsersAllModel> getUsersAllModelFromJson(String str) =>
    List<GetUsersAllModel>.from(
        json.decode(str).map((x) => GetUsersAllModel.fromJson(x)));

String getUsersAllModelToJson(List<GetUsersAllModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetUsersAllModel {
  GetUsersAllModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.userRole,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String surname;
  String email;
  String password;
  int userRole;
  DateTime createdAt;
  DateTime updatedAt;

  factory GetUsersAllModel.fromJson(Map<String, dynamic> json) =>
      GetUsersAllModel(
        id: json["id"],
        name: json["name"],
        surname: json["surname"],
        email: json["email"],
        password: json["password"],
        userRole: json["user_role"],
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
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}