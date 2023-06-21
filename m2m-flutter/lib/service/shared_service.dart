import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:m2m_flutter_main/model/register_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login_response_model.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getInt("login_details") != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<int?> loginDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? user = preferences.getInt("login_details");
    if (user != null) {
      return user;
    } else {
      return null;
    }
  }

  static Future<void> setLoginDetails(
    LoginResponseModel model,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (model.userWithEmail?.id != null) {
      preferences.setInt("login_details", model.userWithEmail!.id);
    }
  }

  static Future<void> setLoginDetailsFromRegister(
    RegisterResponseModel model,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (model.newUser?.id != null) {
      preferences.setInt("login_details", model.newUser!.id);
    }
  }

  static Future<void> logout(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("login_details");
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
