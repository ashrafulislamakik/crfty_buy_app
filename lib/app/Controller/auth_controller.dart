import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/models/user_model.dart';

class AuthController {

  static UserModel? userModel;
  static String? token;

  static const String _tokenkey = "token";
  static const String _userkey = "user";

  static Future<void> saveUserData(
      String? newToken,
      UserModel? newUserData,
      ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenkey, newToken!);
    await prefs.setString(_userkey, jsonEncode(newUserData?.toJson()));

    token = newToken;
    userModel = newUserData;
  }

  static Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userModel = UserModel.fromJson(jsonDecode(prefs.getString(_userkey)!));
    token = prefs.getString(_tokenkey);
  }

  Future<bool> isIfUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_tokenkey);
  }

  static Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenkey);
    await prefs.remove(_userkey);

  }
}