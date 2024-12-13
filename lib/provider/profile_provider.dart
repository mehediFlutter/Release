import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:release/widget/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider with ChangeNotifier {
  SharedPreferences? preferences;
  List? profileDetails;

  // Get Profile
  Future getProfile() async {
    preferences = await SharedPreferences.getInstance();
    Response response = await http.get(
        Uri.parse('$appApiServerUrl/api/v1/merchant-management/profile'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Accept-Encoding': 'application/gzip',
          'Authorization': 'Bearer ${preferences?.getString('token')}'
        });
    jsonDecode(response.body);


    notifyListeners();
    return jsonDecode(response.body);
  }

  // Get Company
  Future getCompany() async {
    preferences = await SharedPreferences.getInstance();
    Response response = await http.get(
        Uri.parse('$appApiServerUrl/api/v1/merchant-management/companies'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Accept-Encoding': 'application/gzip',
          'Authorization': 'Bearer ${preferences?.getString('token')}'
        });
    jsonDecode(response.body);

  

    notifyListeners();
    return jsonDecode(response.body);
  }

// Get Password
  bool updatePasswordInProgress = false;
  bool get getUpdatePasswordInProgress => updatePasswordInProgress;
  Future updatePassword(
      String currentPassword, password, confirmPassword) async {
    updatePasswordInProgress = true;
    notifyListeners();
    preferences = await SharedPreferences.getInstance();
    Response response = await http.put(
        Uri.parse('$appApiServerUrl/api/v1/merchant-management/password'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Accept-Encoding': 'application/gzip',
          'Authorization': 'Bearer ${preferences?.getString('token')}'
        },
        body: jsonEncode({
          "current_password": currentPassword,
          "password": password,
          "password_confirmation": confirmPassword
        }));

    final decodedBody = jsonDecode(response.body);
    if (kDebugMode) {
      print(decodedBody);
    }
    updatePasswordInProgress = false;
    notifyListeners();
    notifyListeners();
    return jsonDecode(response.body);
  }
}
