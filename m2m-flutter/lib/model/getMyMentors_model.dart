import 'dart:convert';

List<GetMyMentorsModel> getMyMentorsModelFromJson(String str) =>
    List<GetMyMentorsModel>.from(
        json.decode(str).map((x) => GetMyMentorsModel.fromJson(x)));

String getMyMentorsModelToJson(List<GetMyMentorsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetMyMentorsModel {
  GetMyMentorsModel({
    required this.id,
    required this.userId,
    required this.relId,
    required this.createdAt,
    required this.updatedAt,
    required this.userTableId,
    required this.myMentorsId,
    required this.myMentorsName,
    required this.myMentorsSurname,
    required this.myMentorsEmail,
    required this.myMentorsPassword,
    required this.myMentorsUserRole,
    required this.myMentorsAvatar,
    required this.myMentorsRatingAverage,
    required this.myMentorsRating,
    required this.myMentorsAboutMe,
    required this.myMentorsCity,
    required this.myMentorsWork,
    required this.myMentorsCreatedAt,
    required this.myMentorsUpdatedAt,
  });

  int id;
  int userId;
  int relId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic userTableId;
  int myMentorsId;
  String myMentorsName;
  String myMentorsSurname;
  String myMentorsEmail;
  String myMentorsPassword;
  int myMentorsUserRole;
  String myMentorsAvatar;
  double myMentorsRatingAverage;
  List<int> myMentorsRating;
  String myMentorsAboutMe;
  String myMentorsCity;
  String myMentorsWork;
  DateTime myMentorsCreatedAt;
  DateTime myMentorsUpdatedAt;

  factory GetMyMentorsModel.fromJson(Map<String, dynamic> json) =>
      GetMyMentorsModel(
        id: json["id"],
        userId: json["user_id"],
        relId: json["rel_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userTableId: json["userTableId"],
        myMentorsId: json["myMentors.id"],
        myMentorsName: json["myMentors.name"],
        myMentorsSurname: json["myMentors.surname"],
        myMentorsEmail: json["myMentors.email"],
        myMentorsPassword: json["myMentors.password"],
        myMentorsUserRole: json["myMentors.user_role"],
        myMentorsAvatar: json["myMentors.avatar"],
        myMentorsRatingAverage: json["myMentors.ratingAverage"].toDouble(),
        myMentorsRating: List<int>.from(json["myMentors.rating"].map((x) => x)),
        myMentorsAboutMe: json["myMentors.about_me"],
        myMentorsCity: json["myMentors.city"],
        myMentorsWork: json["myMentors.work"],
        myMentorsCreatedAt: DateTime.parse(json["myMentors.createdAt"]),
        myMentorsUpdatedAt: DateTime.parse(json["myMentors.updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "rel_id": relId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "userTableId": userTableId,
    "myMentors.id": myMentorsId,
    "myMentors.name": myMentorsName,
    "myMentors.surname": myMentorsSurname,
    "myMentors.email": myMentorsEmail,
    "myMentors.password": myMentorsPassword,
    "myMentors.user_role": myMentorsUserRole,
    "myMentors.avatar": myMentorsAvatar,
    "myMentors.ratingAverage": myMentorsRatingAverage,
    "myMentors.rating": List<dynamic>.from(myMentorsRating.map((x) => x)),
    "myMentors.about_me": myMentorsAboutMe,
    "myMentors.city": myMentorsCity,
    "myMentors.work": myMentorsWork,
    "myMentors.createdAt": myMentorsCreatedAt.toIso8601String(),
    "myMentors.updatedAt": myMentorsUpdatedAt.toIso8601String(),
  };
}