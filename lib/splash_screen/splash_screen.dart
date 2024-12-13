import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../screens/auth/new_login_screen/new_login_screen.dart';
import '../const/const_radio.dart';
import '../screens/bottom_navigation_bar/bottom_navigation_bar.dart';


class SplashScreen extends StatefulWidget {
  final ValueNotifier<ThemeMode> notifier;
  const SplashScreen({super.key, required this.notifier});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool isDoubleScreenSelected;
  // late String mToken;
  var isDeviceConnected = false;
  var isAlertSet = false;
  // var socketMethod = SocketMethod();
   SharedPreferences? preferences;
  // final PusherInstance pusherInstance = PusherInstance();

  isUserLoggedIn() async {
    preferences = await SharedPreferences.getInstance();
    if (mounted) {
      setState(() {});
    }
  }

  loadMessageAuthToken() async {
    // await socketMethod.authorizeChat();
    // await socketMethod.fetchContacts();
    // await socketMethod.postPhoneNumber();
  }

  @override
  void initState() {
    super.initState();
    isUserLoggedIn();
    loadMessageAuthToken();
    navigateToLoginOrHome();
 //   pusherInstance.initializePusher();
  }

  int selectedIndex = 0;
  onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future<void> navigateToLoginOrHome() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {});
    if (kDebugMode) {
      print("Token is : ${preferences?.getString('token')}");
    }

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => (preferences?.getString('token') != null)
                ? const BottomNavBaseScreen()
                : const NewLoginScreen(),
          ),
          (route) => false,
        );
      }
    }

        //  NewLoginScreen
        );
  }

  Future<void> navigateToLoginOrBottomNavBaseScreen() async {
    // Ensure the widget is still mounted before proceeding
    if (!mounted) return;

    setState(() {}); // Call setState only if the widget is mounted

    Future.delayed(const Duration(seconds: 1), () {
      // Check if the widget is still mounted before navigating
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavBaseScreen()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Click ",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "4",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " Details",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          height12,
          const Center(
            child: Text(
              " Do Business with Us",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 200,
              ),
              // Spacer(),
              SpinKitSpinningLines(
                color: Colors.black,
                size: 60.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  showDialogBox() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(
                child: Text(
              'No Internet Connection',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            )),
            content: const Text(
              "Please Check your internet connectivity",
              style: TextStyle(color: Colors.black87, fontSize: 12),
            ),
            actions: [
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    isAlertSet = false;
                    isDeviceConnected =
                        await InternetConnectionChecker().hasConnection;
                    if (!isDeviceConnected) {
                      showDialogBox();

                      isAlertSet = true;
                      setState(() {});
                    }
                  },
                  child: const Center(
                      child: Text(
                    "OK",
                    style: TextStyle(fontSize: 17),
                  )))
            ],
          );
        });
  }
}
