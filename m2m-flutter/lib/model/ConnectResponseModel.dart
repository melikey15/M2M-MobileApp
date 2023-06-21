import 'dart:convert';

ConnectResponseModel connectResponseModelFromJson(String str) =>
    ConnectResponseModel.fromJson(json.decode(str));

String connectResponseModelToJson(ConnectResponseModel data) =>
    json.encode(data.toJson());

class ConnectResponseModel {
  ConnectResponseModel({
    required this.follow,
    required this.msg,
  });

  bool? follow;
  String? msg;

  factory ConnectResponseModel.fromJson(Map<String, dynamic> json) =>
      ConnectResponseModel(
        follow: json["follow"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
    "follow": follow,
    "msg": msg,
  };
}