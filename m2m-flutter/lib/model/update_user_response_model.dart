
import 'dart:convert';

UpdateUserResponseModel updateUserResponseModelFromJson(String str) =>
    UpdateUserResponseModel.fromJson(json.decode(str));


class UpdateUserResponseModel {
  UpdateUserResponseModel({
    this.message,
  });
  String? message;

  UpdateUserResponseModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    return _data;
  }
}