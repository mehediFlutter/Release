import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthToken {
  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

 //   print(pref.getString('auth_token'));
    return pref.getString('auth_token') ?? '';
  }

  saveToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (kDebugMode) {
      print("save token method");
    }
    await pref.setString('auth_token', token);
  }

  // loadUserInfo(var userInfo) async {
  //   LoginModel user = await AuthUtility.getUserInfo();

  //   userInfo = user.toJson();
  //   print(userInfo.toString());
  // }
}
