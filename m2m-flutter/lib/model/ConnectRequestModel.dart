class ConnectRequestModel {
  ConnectRequestModel({required this.userId});
  late final int userId;

  ConnectRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    return _data;
  }
}