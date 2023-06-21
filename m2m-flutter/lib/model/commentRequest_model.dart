// To parse this JSON data, do
//
//     final commentRequestModel = commentRequestModelFromJson(jsonString);

import 'dart:convert';

CommentRequestModel commentRequestModelFromJson(String str) =>
    CommentRequestModel.fromJson(json.decode(str));

String commentRequestModelToJson(CommentRequestModel data) =>
    json.encode(data.toJson());

class CommentRequestModel {
  CommentRequestModel({
    required this.commentContent,
    required this.ownerId,
    required this.authorId,
  });

  String commentContent;
  int ownerId;
  int authorId;

  factory CommentRequestModel.fromJson(Map<String, dynamic> json) =>
      CommentRequestModel(
        commentContent: json["comment_content"],
        ownerId: json["owner_id"],
        authorId: json["author_id"],
      );

  Map<String, dynamic> toJson() => {
        "comment_content": commentContent,
        "owner_id": ownerId,
        "author_id": authorId,
      };
}
