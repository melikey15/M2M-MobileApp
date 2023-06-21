// To parse this JSON data, do
//
//     final commentResponseModel = commentResponseModelFromJson(jsonString);

import 'dart:convert';

CommentResponseModel commentResponseModelFromJson(String str) =>
    CommentResponseModel.fromJson(json.decode(str));

String commentResponseModelToJson(CommentResponseModel data) =>
    json.encode(data.toJson());

class CommentResponseModel {
  CommentResponseModel({
    required this.newComment,
  });

  NewComment newComment;

  factory CommentResponseModel.fromJson(Map<String, dynamic> json) =>
      CommentResponseModel(
        newComment: NewComment.fromJson(json["newComment"]),
      );

  Map<String, dynamic> toJson() => {
        "newComment": newComment.toJson(),
      };
}

class NewComment {
  NewComment({
    required this.id,
    required this.commentContent,
    required this.ownerId,
    required this.authorId,
    required this.updatedAt,
    required this.createdAt,
    required this.userTableId,
  });

  int id;
  String commentContent;
  int ownerId;
  int authorId;
  DateTime updatedAt;
  DateTime createdAt;
  dynamic userTableId;

  factory NewComment.fromJson(Map<String, dynamic> json) => NewComment(
        id: json["id"],
        commentContent: json["comment_content"],
        ownerId: json["owner_id"],
        authorId: json["author_id"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        userTableId: json["userTableId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment_content": commentContent,
        "owner_id": ownerId,
        "author_id": authorId,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "userTableId": userTableId,
      };
}
