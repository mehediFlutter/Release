import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:release/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'provider/mode_provider.dart';
import 'widget/theme/theme.dart';

class Click4Details extends StatefulWidget {
  final ValueNotifier<ThemeMode> notifier = ValueNotifier(ThemeMode.light);

  Click4Details({super.key});

  @override
  Click4DetailsState createState() => Click4DetailsState();
}

class Click4DetailsState extends State<Click4Details> {
  late SharedPreferences preferences;

  loadUserInfo() async {
    setState(() {});
   // await SocketMethod().authorizeChat();
  }

  @override
  void initState() {
    super.initState();
    //   authChatTokenMethod();

    initSharedPreference();
  //  loadUserInfo();
  }

  // authChatTokenMethod() async {
  //   await SocketMethod().authorizeChat();
  //    SocketManager();
  // }

  @override
  void dispose() {
    super.dispose();
  }

  themeLister() {
    if (mounted) {
      setState(() {});
    }
  }

  initSharedPreference() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {});
    if (preferences.containsKey('notifier')) {
      widget.notifier.value =
          (preferences.getString('notifier') == 'ThemeMode.dark')
              ? ThemeMode.light
              : ThemeMode.dark;
    }
    setState(() {});
  }
  

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.notifier,
      builder: (_, mode, __) {
        return MaterialApp(
          title: 'Click4Details',
          themeMode: Provider.of<ModeProvider>(context).lightModeEnable
              ? ThemeMode.light
              : ThemeMode.dark,
          theme: lightTheme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          home: SplashScreen(
            notifier: widget.notifier,
          ),
        );
      },
    );
  }
}
