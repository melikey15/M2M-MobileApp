// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

import 'dart:convert';

List<CommentModel> commentModelFromJson(String str) => List<CommentModel>.from(
    json.decode(str).map((x) => CommentModel.fromJson(x)));

String commentModelToJson(List<CommentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentModel {
  CommentModel({
    required this.id,
    required this.commentContent,
    required this.ownerId,
    required this.authorId,
    required this.createdAt,
    required this.updatedAt,
    required this.userTableId,
    required this.authorCommentsId,
    required this.authorCommentsName,
    required this.authorCommentsSurname,
    required this.authorCommentsUserRole,
  });

  int id;
  String commentContent;
  int ownerId;
  int authorId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic userTableId;
  int authorCommentsId;
  String authorCommentsName;
  String authorCommentsSurname;
  int authorCommentsUserRole;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        commentContent: json["comment_content"],
        ownerId: json["owner_id"],
        authorId: json["author_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userTableId: json["userTableId"],
        authorCommentsId: json["author_comments.id"],
        authorCommentsName: json["author_comments.name"],
        authorCommentsSurname: json["author_comments.surname"],
        authorCommentsUserRole: json["author_comments.user_role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment_content": commentContent,
        "owner_id": ownerId,
        "author_id": authorId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "userTableId": userTableId,
        "author_comments.id": authorCommentsId,
        "author_comments.name": authorCommentsName,
        "author_comments.surname": authorCommentsSurname,
        "author_comments.user_role": authorCommentsUserRole,
      };
}
