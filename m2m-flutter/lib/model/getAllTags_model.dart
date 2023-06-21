// To parse this JSON data, do
//
//     final getAllTagsModel = getAllTagsModelFromJson(jsonString);

import 'dart:convert';

List<GetAllTagsModel> getAllTagsModelFromJson(String str) =>
    List<GetAllTagsModel>.from(
        json.decode(str).map((x) => GetAllTagsModel.fromJson(x)));

String getAllTagsModelToJson(List<GetAllTagsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllTagsModel {
  GetAllTagsModel({
    required this.id,
    required this.tagName,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String tagName;
  DateTime createdAt;
  DateTime updatedAt;

  factory GetAllTagsModel.fromJson(Map<String, dynamic> json) =>
      GetAllTagsModel(
        id: json["id"],
        tagName: json["tag_name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tag_name": tagName,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
