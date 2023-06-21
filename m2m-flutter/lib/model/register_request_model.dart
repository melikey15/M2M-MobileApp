class RegisterRequestModel {
  RegisterRequestModel({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.userRole,
  });
  late final String name;
  late final String surname;
  late final String email;
  late final String password;
  late final int userRole;

  RegisterRequestModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    surname = json['surname'];
    email = json['email'];
    password = json['password'];
    userRole = json['user_role'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['surname'] = surname;
    _data['email'] = email;
    _data['password'] = password;
    _data['user_role'] = userRole;
    return _data;
  }
}