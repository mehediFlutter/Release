import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:release/const/path.dart';
import 'package:release/widget/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../connectivity_services/connectivity_services.dart';
import '../screens/auth/new_login_screen/new_login_screen.dart';
import '../const/const_radio.dart';
import '../widget/alert_dialog.dart';
import '../widget/profile_picture.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  SharedPreferences? preferences;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  logOutMethod() async {
    if (kDebugMode) {
      print("Log out method");
    }
    preferences = await SharedPreferences.getInstance();
    Response response = await http.post(
      ///v1/merchant-management/logout
      Uri.parse("$appApiServerUrl/api/v1/merchant-management/logout"),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Accept-Encoding': 'application/gzip',
        'Authorization': 'Bearer ${preferences?.getString('token')}',
      },
    );
    if (kDebugMode) {
      print("Log out body : ${response.body}");
      print("Log out status code : ${response.statusCode}");
    }

    if (response.statusCode == 200) {
      await preferences?.clear();

      if (kDebugMode) {}
      if (mounted) {
        await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const NewLoginScreen()),
            (route) => false);
      }
    }
  }

  deleteMethod() async {
    preferences = await SharedPreferences.getInstance();
    Response response = await http.delete(
      Uri.parse("$appApiServerUrl/api/v1/merchant-management/profile"),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Accept-Encoding': 'application/gzip',
        'Authorization': 'Bearer ${preferences?.getString('token')}',
      },
    );

    if (response.statusCode == 200) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Account Delete Successfully"),
          ),
        );
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const NewLoginScreen()),
            (route) => false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
     ConnectivityService().monitorConnectivity(context);
    printUserInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int currentYear = DateTime.now().year;

  String? name;
  String? companyName;
  String? role;
  bool canAccessMembers = false;
  bool isAdmin = false;
  bool isUploader = false;
  bool isManager = false;
  bool isSupporter = false;
  String? authRole;
  String? authID;

  void printUserInfo() async {
    preferences = await SharedPreferences.getInstance();
    name = preferences?.getString('name');
    companyName = preferences?.getString('companyName');
    role = preferences?.getString('role');
    authID = preferences?.getString('id');
    setState(() {});
    if (role == 'ADMIN') {
      isAdmin = true;
      canAccessMembers = true;
      setState(() {});
    }
    if (role == 'ADMIN'

        //  ||
        //     role == 'MANAGER' ||
        //     role == 'UPLOADER' ||
        //     role == 'EDITOR'

        ) {
      canAccessMembers = true;

      setState(() {});
    } else if (role == 'SUPPORT') {
      await preferences?.remove('role');

      preferences?.setString('role', 'SUPPORT');
      role = 'Customer Care';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // AppBarBackArrowAndName(
            //   text: 'Profile',
            // ),

            const Text("Profile"),
            height20,
            UserProfilePicture(
              preferences: preferences,
              height: 130,
              width: 130,
            ),
            height16,
            // Text(
            //   "${profileName ?? name ?? companyName ?? 'None'} ($role)",
            //   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            // ),

            // Text(
            //   profileName ?? name ?? companyName ?? 'None',
            //   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            // ),

            height12,
            //  Expanded(child: SizedBox()),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // profile

                    // userMethod(
                    //   'Profile',
                    //   'new_person_outline.svg',
                    //   () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => const ProfileScreen()));
                    //   },
                    // ),
                    // height12,

                    //  Company

                    // isAdmin
                    //     ? userMethod(
                    //         'Company',
                    //         'company.svg',
                    //         () async {
                    //           await Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) =>
                    //                       const CompanyScreen()));
                    //         },
                    //       )
                    //     : const DisableUserTopic(
                    //         title: 'Company',
                    //         icon: 'company.svg',
                    //       ),
                    // height12,

                    // // password

                    //   userMethod(
                    //     'Password',
                    //     'updatePassword.svg',
                    //     () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) =>
                    //                   const UpdatePasswordScreen()));
                    //     },
                    //   ),

                    //   height12,

                    // logout

                    userMethod(
                      'Logout',
                      'logout_icon.svg',
                      () {
                        CustomAlertDialog().newLogOutAndDeleteDialog(
                          context,
                          'Confirm Log Out',
                          'Log Out',
                          'Cancel',
                          () async {
                            await logOutMethod();

                            // Explicit mounted check for BuildContext
                            // if (!context.mounted) return;

                            // await Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const NewLoginScreen(),
                            //     ),
                            //     (route) => false);
                          },
                        );
                      },
                    ),

                    // services

                    // height12,
                    // const Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text(
                    //     "Services",
                    //     style: TextStyle(fontSize: 16),
                    //   ),
                    // ),

                    //  height12,

                    // // add vehicle

                    // isCreateVehicle!
                    //     ? userMethod(
                    //         'Vehicles',
                    //         'product.svg',
                    //         () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) =>
                    //                       const GeneralAddCar()));
                    //         },
                    //       )
                    //     : const DisableUserTopic(
                    //         title: 'Vehicle',
                    //         icon: 'product.svg',
                    //       ),
                    // height12,

                    //  // members

                    //   canAccessMembers
                    //       ? userMethod(
                    //           'Members',
                    //           'members.svg',
                    //           () {
                    //             Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                 builder: (context) => Members(
                    //                   isAdmin: isAdmin,
                    //                   role: role ?? '',
                    //                   authId: authID ?? '',
                    //                 ),
                    //               ),
                    //             );
                    //           },
                    //         )
                    //       : const DisableUserTopic(
                    //           title: 'Members',
                    //           icon: 'members.svg',
                    //         ),
                    height12,
                    height12,

                    // const Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text(
                    //     "Danger zone",
                    //     style: TextStyle(color: Colors.red, fontSize: 16),
                    //   ),
                    // ),
                    userMethod(
                      'Delete Account',
                      'trash.svg',
                      () async {
                        CustomAlertDialog().newLogOutAndDeleteDialog(
                          context,
                          'Are you sure want to delete',
                          'Delete',
                          'Cancel',
                          () async {
                            deleteMethod();
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('$iconPath/app_version_icon.svg'),
                const Text(
                  "App Version: 1.0.0",
                  style: TextStyle(color: Color(0xFF79747E)),
                )
              ],
            ),
            Text(
              "Copyright $currentYear | All Rights Reserved",
              style: const TextStyle(color: Color(0xFF79747E)),
            ),
            const Text(
              "Powered By PilotBazar™",
              style: TextStyle(color: Color(0xFF79747E), fontSize: 12),
            ),
          ],
        ),
      ),
    ));
  }

  userMethod(String title, icon, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 1,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFE7E7E7))),
              child: Row(
                children: [
                  SvgPicture.asset(
                    '$iconPath/$icon',
                  ),
                  width15,
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
