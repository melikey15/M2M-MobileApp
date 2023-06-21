class Config {
  static const String apiURL = "192.168.0.20:5000";
  static const String loginAPI = "/api/login";
  static const String registerAPI = "/api/register";
  static const String getUserAPI = "/api/getById/";
  static const String getMyMentees = "/api/myMentees/";
  static const String getMyMentors = "/api/myMentors/";
  static const String menteesAPI = "/api/getByRole/mentee";
  static const String mentorsAPI = "/api/getByRole/mentor";
  static const String getAllTags = "/api/getAllTag";
  static const String connectAPI = "/api/reqMentor/";

  static const String feedBackAPI = "/api/postFeedBack";
  static const String getByTags = "/api/getTagID/";

  static const String updateUserAPI = "/api/updateUser/";
  static const String getMeetingAPI = "/api/getMeeting/";
  static const String createMeetingAPI = "/api/createMeet/";
  static const String commentAddAPI = "/api/addComment/";

  static const String getTop = "/api/getTopUsers";

  static const String getMyFavorites = "/api/favMentor/";
  static const String FavoriteAPI = "/api/favMentorAdd/";
  static const String DeleteFavorite = "/api/favMentorDelete/";
}
