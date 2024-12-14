import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../connectivity_services/connectivity_services.dart';
import '../../../const/const_radio.dart';
import '../../../const/role.dart';
import '../../../firebase/demo.dart';
import '../../bottom_navigation_bar/bottom_navigation_bar.dart';
import '../../../widget/alert_dialog.dart';
import '../../../widget/loading_spin_kit_fading_circle.dart';
import '../../../widget/tokens.dart';
import '../../../widget/urls.dart';
import '../new_registration_screen/new_registration_screen.dart';
import '../new_text_fields/new_password_text_field.dart';
import '../new_text_fields/new_phone_number_text_field.dart';
import 'device_info.dart';

class NewLoginScreen extends StatefulWidget {
  const NewLoginScreen({super.key});

  @override
  State<NewLoginScreen> createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool passwordVisible;
  @override
  void initState() {
    super.initState();
    ConnectivityService().monitorConnectivity(context);
    passwordVisible = false;
  }

  late SharedPreferences preference;

  String? authUserID;

  initSharedPref() async {
    preference = await SharedPreferences.getInstance();
  }

  bool loginInProgress = false;

  Future login() async {
    loginInProgress = true;
    if (mounted) {
      setState(() {});
    }
    preference = await SharedPreferences.getInstance();
    Map<String, dynamic> body = {
      "mobile": phoneNumberController.text,
      "password": passwordController.text, //01407054411
      "device": deviceToken,
      "payload": {
        "brand": deviceBrand,
        "platform": devicePlatform,
        "version": deviceAndroidVersion,
        "model": deviceModel,
        "architecture": deviceArchitecture,
        "mobile": isMobile,
        "device": device
      }
    };
    Response response = await post(
        Uri.parse('$appApiServerUrl/api/v1/merchant-management/login'),
        headers: globalHeader,
        body: jsonEncode(body));

    //  Map decodedBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      await preference.clear();
      Map decodedBody = jsonDecode(response.body.toString());
      if (decodedBody['message'] == "Account has been deleted!") {
        if (mounted) {
          CustomAlertDialog().loginAlertDialog(
            context,
            "Account has been deleted!",
            "OK",
          );
        }
        loginInProgress = false;
        if (mounted) {
          setState(() {});
        }
        return;
      } else {
        String jsonString = jsonEncode(decodedBody);
        await preference.setString('userInfo', jsonString);
        String token = decodedBody['token'];
        loginToken = decodedBody['token'];
        authUserID = decodedBody['id'];
        String name = decodedBody['name'] ?? 'None';

        // Company Name And ID:
        String companyID = decodedBody['company']['id'] ?? 'None';
        String companyName = decodedBody['company']['name'] ?? 'None';

        String phone = decodedBody['phone'] ?? 'None';
        String role = decodedBody['role'];
        authRoleCatch = decodedBody['role'];
        authRoleUidCatch = decodedBody['id'];
        List<String>? permission =
            (decodedBody['permission'] as List<dynamic>).cast<String>();
        await preference.setString(
            'token',
            decodedBody['token'] ??
                token ??
                loginToken ??
                decodedBody['token']);

        await preference.setString('authUserID', authUserID ?? '');
        await preference.setString('image', decodedBody['image']);

        await preference.setString('name', name);
        await preference.setString('companyName', companyName);
        await preference.setString('companyID', companyID);
        await preference.setString('phone', phone);
        await preference.setString('role', role);
        await preference.setStringList('permission', permission);
        if (mounted) {
          setState(() {});
        }
        if (mounted) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const BottomNavBaseScreen()),
              (route) => false);
        }
      }
    } else {
      if (mounted) {
        loginInProgress = false;
        setState(() {});
        String? errorMessages = 'Something is wrong please try again';

        CustomAlertDialog().loginAlertDialog(
          context,
          errorMessages,
          "OK",
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                      child: Text(
                    "Log In",
                    style: TextStyle(fontSize: 36, color: Colors.black),
                  )),
                  height12,
                  // TextFieldUpperText(
                  //   text: 'Phone Number',
                  // ),
                  height20,
                  NewPhoneNumberTextFormField(
                    textEditingController: phoneNumberController,
                    labelText: 'Enter Your Phone Number',
                    validatorText: 'Enter Phone Number',
                  ),
                  height20,

                  NewPasswordTextFormField(
                    validatorText: 'Enter Password',
                    textEditingController: passwordController,
                    obscureText: !passwordVisible,
                    labelText: 'Enter Password',
                    icon: IconButton(
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.grey.shade800,
                        ),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        }),
                  ),
                  height20,
                  loginInProgress
                      ? const LoadingSpinKitFadingCircle(
                          size: 44, color: Colors.black)
                      : SizedBox(
                          height: 44,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () async {
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }

                                await login();
                              },
                              child: 
                                   Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    )
                               ),
                        ),
                  height30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      width5,
                      InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NewRegistrationScreen()),
                              (route) => false);
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
