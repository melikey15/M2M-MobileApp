import 'dart:async';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:m2m_flutter_main/config.dart';
import 'package:m2m_flutter_main/model/ConnectRequestModel.dart';
import 'package:m2m_flutter_main/model/ConnectResponseModel.dart';
import 'package:m2m_flutter_main/model/createMeetingRequest_model.dart';
import 'package:m2m_flutter_main/model/getAllTags_model.dart';
import 'package:m2m_flutter_main/model/getById_model.dart';
import 'package:m2m_flutter_main/model/getMyFavorites_model.dart';
import 'package:m2m_flutter_main/model/getMyMentors_model.dart';
import 'package:m2m_flutter_main/model/login_request_model.dart';
import 'package:m2m_flutter_main/model/login_response_model.dart';
import 'package:m2m_flutter_main/model/register_request_model.dart';
import 'package:m2m_flutter_main/model/register_response_model.dart';
import 'package:m2m_flutter_main/model/update_user_request_model.dart';
import 'package:m2m_flutter_main/service/shared_service.dart';
import '../model/createMeetResponse_model.dart';
import '../model/feedbackRequest_model.dart';
import '../model/feedbackResponse_model.dart';
import '../model/getByRole_model.dart';
import '../model/getMeeting_model.dart';
import '../model/getMyMentees_model.dart';
import '../model/getUserByTag_model.dart';
import '../model/update_user_response_model.dart';
import '../model/commentRequest_model.dart';
import '../model/commentResponse_model.dart';

class APIService {
  static var client = http.Client();

  static Future<LoginResponseModel> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseJson(response.body));
    }
    return loginResponseJson(response.body);
  }

  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.registerAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    if (response.statusCode == 201) {
      await SharedService.setLoginDetailsFromRegister(
          registerResponseJson(response.body));
    }
    return registerResponseJson(response.body);
  }

  static Future<GetByIdModel> getCurrentUser() async {
    int? currentUserId = await SharedService.loginDetails();
    Uri url = Uri.http(Config.apiURL, '${Config.getUserAPI}$currentUserId');
    var response = await client.get(url);
    return userModelFromJson(response.body);
  }

  static Future<GetByIdModel> getUser(int id) async {
    Uri url = Uri.http(Config.apiURL, '${Config.getUserAPI}$id');
    var response = await client.get(url);
    return userModelFromJson(response.body);
  }

  static Future<List<GetAllTagsModel>> getAllTags() async {
    var url = Uri.http(Config.apiURL, Config.getAllTags);
    var response = await client.get(url);
    return getAllTagsModelFromJson(response.body);
  }

  static Future<List<GetMyMenteesModel>> getMyMentees() async {
    int? currentUserId = await SharedService.loginDetails();
    Uri url = Uri.http(Config.apiURL, '${Config.getMyMentees}$currentUserId');
    var response = await client.get(url);
    return getMyMenteesModelFromJson(response.body);
  }

  static Future<List<GetMyMentorsModel>> getMyMentors() async {
    int? currentUserId = await SharedService.loginDetails();
    Uri url = Uri.http(Config.apiURL, '${Config.getMyMentors}$currentUserId');
    var response = await client.get(url);
    return getMyMentorsModelFromJson(response.body);
  }

  static Future<ConnectResponseModel> connectUser(
      ConnectRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    int? currentUserId = await SharedService.loginDetails();
    Uri url = Uri.http(Config.apiURL, '${Config.connectAPI}$currentUserId');
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    return connectResponseModelFromJson(response.body);
  }

  static Future<UpdateUserResponseModel> updateUser(
      int userId, UpdateUserRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    Uri url = Uri.http(Config.apiURL, '${Config.updateUserAPI}$userId');
    var response = await client.put(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    return updateUserResponseModelFromJson(response.body);
  }

  static Future<List<GetMeetingModel>> getMeeting() async {
    int? currentUserId = await SharedService.loginDetails();
    Uri url = Uri.http(Config.apiURL, '${Config.getMeetingAPI}$currentUserId');
    var response = await client.get(url);
    return getMeetingModelFromJson(response.body);
  }

  static Future<CreateMeetingResponseModel> createMeeting(
      int userId, CreateMeetingRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    Uri url = Uri.http(Config.apiURL, '${Config.createMeetingAPI}$userId');
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    return createMeetingResponseModelFromJson(response.body);
  }

  static Future<CommentResponseModel> createComment(
      int userId, CommentRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    Uri url = Uri.http(Config.apiURL, Config.commentAddAPI);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    return commentResponseModelFromJson(response.body);
  }

  static Future<FeedBackResponseModel> feedBack(
      FeedBackRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    int? currentUserId = await SharedService.loginDetails();
    Uri url = Uri.http(Config.apiURL, Config.feedBackAPI);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    return feedBackResponseModelFromJson(response.body);
  }

  static Future<List<GetUserByTagModel>> getUserByTag(int tagId) async {
    Uri url = Uri.http(Config.apiURL, '${Config.getByTags}$tagId');
    var response = await client.get(url);
    return getUserByTagModelFromJson(response.body);
  }

  static Future<List<GetByRoleModel>> getAllMentors() async {
    Uri url = Uri.http(Config.apiURL, Config.mentorsAPI);
    var response = await client.get(url);
    return getByRoleModelFromJson(response.body);
  }

  static Future<List<GetByRoleModel>> getAllMentees() async {
    Uri url = Uri.http(Config.apiURL, Config.menteesAPI);
    var response = await client.get(url);
    return getByRoleModelFromJson(response.body);
  }

  static Future<List<GetByRoleModel>> getTop() async {
    Uri url = Uri.http(Config.apiURL, Config.getTop);
    var response = await client.get(url);
    return getByRoleModelFromJson(response.body);
  }

  static Future<List<GetMyFavoritesModel>> getMyFavorites() async {
    int? currentUserId = await SharedService.loginDetails();
    Uri url = Uri.http(Config.apiURL, '${Config.getMyFavorites}$currentUserId');
    var response = await client.get(url);
    return getMyFavoritesModelFromJson(response.body);
  }

  static Future<void> DeleteFavoriteUser(int id) async {
    Uri url = Uri.http(Config.apiURL, '${Config.DeleteFavorite}$id');
    var response = await client.delete(url);
  }
}
