import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:release/widget/tokens.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../DTO/get_all_vehicle_dao.dart';
import '../DTO/json_to_dart_people_dto.dart';
import '../screens/auth/new_login_screen/new_login_screen.dart';
import '../widget/urls.dart';


class SocketMethodProvider extends ChangeNotifier {
  SharedPreferences? preference;
  int count = 0;
  int get getCount => count;
  bool themeModeValue = true;

  List groupChatList = [];
  List<GetAllVehicleDTO> vehicleCollection = [];
  List<PeopleDtoJSONToDart> people = [];
  List userList = [];

  List<PeopleDtoJSONToDart> get getInboxChatListFromProvider => people;
  List<GetAllVehicleDTO> get getVehicleCollection => vehicleCollection;
  List get getUserList => userList;

  bool? isEmptyHome;
  bool get getIsEmptyHome => isEmptyHome ?? false;

  getVehicleCollectionMethod(BuildContext context) async {
    try {
      vehicleCollection.clear();
      getVehicleCollection.clear();
      preference = await SharedPreferences.getInstance();
      Response response = await http.get(
        //v1/vehicle-management/products
        Uri.parse("$appApiServerUrl/api/v1/vehicle-management/products"),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Accept-Encoding': 'application/gzip',
          'Authorization': 'Bearer ${preference?.getString('token')}'
        },
      );

      final decodedBody = jsonDecode(response.body);

      if (response.statusCode == 401) {
       await preference?.clear();
     
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please login again!!"),
          ),
        );
       await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const NewLoginScreen()),
            (route) => false);
      }

      if (decodedBody is! List || decodedBody.isEmpty) {
        isEmptyHome = true;
      } else {
        isEmptyHome = false;
        for (var each in decodedBody) {
          vehicleCollection.add(GetAllVehicleDTO.fromJson(each));
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Catch Method");
      }
      isEmptyHome = true;
    }
  }

  getInbox(String xAppContact) async {
    people.clear();
    Response response =
        await http.get(Uri.parse("$appMessengerUrl/contacts"), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Accept-Encoding': 'application/gzip',
      'Authorization': 'Bearer $messengerAPIToken',
      'x-app-contact': xAppContact
    });

    final jsonData = jsonDecode(response.body);

    for (var each in jsonData) {
      people.add(PeopleDtoJSONToDart.fromJson(each));
      userList.add(each['users']);
    }

    notifyListeners();

    return people;
  }

  Future<List> getGroup(String token) async {
    groupChatList.clear();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Accept-Encoding': 'application/gzip',
      'Authorization': 'Bearer $token'
    };
    Response response = await http.get(
        Uri.parse(
            "https://messenger.pilotbazar.xyz/api/v1/vendor-management/contacts"),
        headers: headers);

    Map? decodeGroupChatBody = jsonDecode(response.body);

    for (var groups in decodeGroupChatBody?['groups']) {
      var group = {
        "id": groups["id"],
        "room": groups["room"],
        "message": groups["message"],

        "datetime": groups["datetime"],
        //  "avatar": groups["avatar"],
        "groups": {
          "id": groups['users'][0]['id'],
          "name": groups['users'][0]['name'],
          "avatar": groups['users'][0]['avatar'],
          "status": groups['users'][0]['status'],
        }
      };
      groupChatList.add(group);
    }
    notifyListeners();

    return groupChatList;
  }

  SocketMethodProvider() {
    _loadPreferences();
  }

  void _loadPreferences() async {
    preference = await SharedPreferences.getInstance();
    themeModeValue = preference?.getBool('themeBool') ?? true;
    notifyListeners();
  }
}
