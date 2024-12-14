import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:release/screens/auth/new_login_screen/new_login_screen.dart';
import 'package:release/widget/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../DTO/pbl_shop_dto.dart';

class PblShopProvider with ChangeNotifier {
  SharedPreferences? preferences;
  List<PBLShopDTO> pblShopList = []; // Initialize the list
  List<PBLShopDTO> get getPBLShopList => pblShopList;

  getPBLShop(BuildContext context) async {
    pblShopList.clear();
    preferences = await SharedPreferences.getInstance();
    Response response = await http.get(
      Uri.parse('$appApiServerUrl/api/v1/retail-management/products'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Accept-Encoding': 'application/gzip',
        'Authorization': 'Bearer ${preferences?.getString('token')}'
      },
    );

   
    if (response.statusCode == 200) {
      final decodeBody = jsonDecode(response.body);

      // Clear the list to avoid duplicate data
      for (var each in decodeBody) {
        pblShopList.add(PBLShopDTO.fromJson(each));
      }
      notifyListeners();
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Please Login Again")));
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => NewLoginScreen()),
            (route) => false);
      }

      if (kDebugMode) {
        print("Failed to load data. Status code: ${response.statusCode}");
      }
    }
  }
}
