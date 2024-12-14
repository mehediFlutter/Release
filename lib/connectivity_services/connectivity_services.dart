
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:release/widget/alert_dialog.dart';

class ConnectivityService {
  // Singleton pattern
  static final ConnectivityService _instance = ConnectivityService._internal();
  bool isConnected = false;
  bool showPopup = false;

  factory ConnectivityService() {
    return _instance;
  }

  ConnectivityService._internal();

  // Method to listen for connectivity changes
  void monitorConnectivity(BuildContext context) {
    InternetConnectionChecker().onStatusChange.listen((event) {
      if (kDebugMode) {
        print("Connection status changed: $event");
      }

      switch (event) {
        case InternetConnectionStatus.connected:
          isConnected = true;
          if (isConnected == true && showPopup == true) {
            if (context.mounted) {
              Navigator.pop(context);
            }
          }

          if (kDebugMode) {
            print("Internet Connected");
          }

          break;
        case InternetConnectionStatus.disconnected:
          isConnected = false;

          if (kDebugMode) {
            print("No Internet Connection");
          }
          if (isConnected == false) {
            if (context.mounted) {
              CustomAlertDialog().noInternetDialog(
                  context,
                  'No Internet Connection Please Check Your Internet Connection',
                  'Ok', () {
              
              });
              showPopup = true;
            }
          } else {
            if (context.mounted) Navigator.pop(context);
          }

          break;
      }
      if (isConnected == true) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12)), // Border radius of 12
            ),
            backgroundColor: Color(0xFF4ade80),
            content: Text("You Are Online")));
      }
    });
  }
}
