import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:release/click4details.dart';
import 'package:release/firebase/demo.dart';
import 'package:release/provider/mode_provider.dart';
import 'package:release/provider/pbl_shop_provider.dart';
import 'package:release/provider/profile_provider.dart';
import 'package:release/provider/reals_like_provider.dart';
import 'package:release/provider/socket_method_provider.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import 'screens/auth/new_login_screen/device_info.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseDemo().initNotification(); // Make sure Flutter is initialized

  final uaData = await userAgentData();
  deviceBrand = uaData.brand;
  devicePlatform = uaData.platform;
  deviceAndroidVersion = uaData.platformVersion;
  deviceMobile = uaData.model;
  deviceArchitecture = uaData.architecture;
  isMobile = uaData.mobile;
  device = uaData.device;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ModeProvider>(
            create: (context) => ModeProvider()),
        ChangeNotifierProvider<SocketMethodProvider>(
            create: (context) => SocketMethodProvider()),
        // ChangeNotifierProvider<FeatureProvider>(
        //     create: (context) => FeatureProvider()),
        ChangeNotifierProvider<ProfileProvider>(
            create: (context) => ProfileProvider()),
        ChangeNotifierProvider<RealsLikeProvider>(
            create: (context) => RealsLikeProvider()),
        // ChangeNotifierProvider<GroupProvider>(
        //     create: (context) => GroupProvider()),
        // ChangeNotifierProvider<ChatAllImageProvider>(
        //     create: (context) => ChatAllImageProvider()),
        // ChangeNotifierProvider<AddCarValueProvider>(
        //     create: (context) => AddCarValueProvider()),
        // ChangeNotifierProvider<GalleryProvider>(
        //     create: (context) => GalleryProvider()),
        // ChangeNotifierProvider<StockListProvider>(
        //     create: (context) => StockListProvider()),
        // ChangeNotifierProvider<RoomIdProvider>(
        //     create: (context) => RoomIdProvider()),
        ChangeNotifierProvider<PblShopProvider>(
            create: (context) => PblShopProvider()),
        // ChangeNotifierProvider<MemberProvider>(
        //     create: (context) => MemberProvider()),
      ],
      child: Click4Details(),
    ),
  );
}
