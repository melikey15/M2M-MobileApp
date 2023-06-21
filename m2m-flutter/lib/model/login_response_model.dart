import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.userWithEmail,
    required this.message,
    required this.token,
  });
  late final UserWithEmail? userWithEmail;
  late final String? message;
  late final String? token;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    userWithEmail = json['userWithEmail'] != null
        ? UserWithEmail.fromJson(json['userWithEmail'])
        : null;
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userWithEmail'] = userWithEmail?.toJson();
    _data['message'] = message;
    _data['token'] = token;
    return _data;
  }
}

class UserWithEmail {
  UserWithEmail({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.userRole,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String surname;
  late final String email;
  late final String password;
  late final int userRole;
  late final String createdAt;
  late final String updatedAt;

  UserWithEmail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    email = json['email'];
    password = json['password'];
    userRole = json['user_role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['surname'] = surname;
    _data['email'] = email;
    _data['password'] = password;
    _data['user_role'] = userRole;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}
