import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:release/screens/auth/new_text_fields/new_phone_number_text_field.dart';
import 'package:release/widget/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../const/const_radio.dart';
import '../../../firebase/demo.dart';
import '../../bottom_navigation_bar/bottom_navigation_bar.dart';
import '../../../widget/alert_dialog.dart';
import '../../../widget/loading_spin_kit_fading_circle.dart';
import '../../../widget/tokens.dart';
import '../new_login_screen/device_info.dart';
import '../new_login_screen/new_login_screen.dart';
import '../new_text_fields/new_name_text_field.dart';
import '../new_text_fields/new_password_text_field.dart';

class NewRegistrationScreen extends StatefulWidget {
  const NewRegistrationScreen({super.key});

  @override
  State<NewRegistrationScreen> createState() => _NewRegistrationScreenState();
}

class _NewRegistrationScreenState extends State<NewRegistrationScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController namerController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  late bool passwordVisible;
  late bool confirmPasswordVisible;

  bool isRegistrationInProgress = false;
  late SharedPreferences preference;
  String? token;
  String? authUserID;

  Future registration() async {
    preference = await SharedPreferences.getInstance();
    isRegistrationInProgress = true;
    if (mounted) {
      setState(() {});
    }
    Map<String, dynamic> body = {
      "name": namerController.text,
      "mobile": phoneNumberController.text,
      "company": companyNameController.text,
      "password": passwordController.text,
      "password_confirmation": confirmPasswordController.text,
      "device": deviceToken,
      "payload": payload
    };
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await preference.clear();
        Response response = await post(
            Uri.parse('$appApiServerUrl/api/v1/merchant-management/register'),
            headers: globalHeader,
            body: jsonEncode(body));

        if (kDebugMode) {
          print("Status Code  : ${response.statusCode.toString()}");
        }

        if (response.statusCode == 200) {
          Map decodedBody = jsonDecode(response.body.toString());

          String token = decodedBody['token'];
          loginToken = decodedBody['token'];
          authUserID = decodedBody['id'];
          String name = decodedBody['name'] ?? 'None';

          // Company Name And ID:
          String companyID = decodedBody['company']['id'] ?? 'None';
          String companyName = decodedBody['company']['name'] ?? 'None';

          String phone = decodedBody['phone'] ?? 'None';
          String role = decodedBody['role'];
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

          if (!mounted) return;
          await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const BottomNavBaseScreen()),
            (route) => false,
          );
        } else {
          isRegistrationInProgress = false;
          if (mounted) {
            setState(() {});
          }
          if (response.statusCode == 422) {
            if (!mounted) return;
            CustomAlertDialog().loginAlertDialog(
              context,
              "The company or Phone number has already been taken or Password field lower then 8 characters. Try Again!",
              "OK",
            );
            return;
          }
          String? errorMessages = "Something is wrong please try again";

          if (!mounted) return;
          CustomAlertDialog().loginAlertDialog(
            context,
            errorMessages,
            "OK",
          );
        }
      } else {
        isRegistrationInProgress = false;
        if (mounted) {
          setState(() {});
        }
        if (!mounted) return;
        CustomAlertDialog().showAlertDialog(context,
            "Password and confirm password are not same try again", "OK");
      }

      isRegistrationInProgress = false;
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      isRegistrationInProgress = false;
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
    confirmPasswordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                      child: Text(
                    "Registration",
                    style: TextStyle(fontSize: 36, color: Colors.black),
                  )),
                  height20,
                  NewPhoneNumberTextFormField(
                    textEditingController: phoneNumberController,
                    labelText: 'Enter Your Phone Number',
                    validatorText: 'Enter Phone Number',
                  ),
                  // TextFieldUpperText(
                  //   text: 'Name',
                  // ),
                  height20,
                  NewNameTextFormField(
                    textEditingController: namerController,
                    labelText: 'Enter Your Name',
                    validatorText: 'Enter Name',
                  ),
                  // TextFieldUpperText(
                  //   text: 'Company Name',
                  // ),
                  height20,
                  NewNameTextFormField(
                    textEditingController: companyNameController,
                    labelText: 'Enter Your Company Name',
                    validatorText: 'Enter Company Name',
                  ),
                  height20,
                  NewPasswordTextFormField(
                    validatorText: 'Enter Password',
                    textEditingController: passwordController,
                    labelText: 'Enter Password',
                    obscureText: !passwordVisible,
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
                  NewPasswordTextFormField(
                    validatorText: 'Enter Password',
                    textEditingController: confirmPasswordController,
                    obscureText: !confirmPasswordVisible,
                    labelText: 'Confirm Password',
                    icon: IconButton(
                        icon: Icon(
                          confirmPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.grey.shade800,
                        ),
                        onPressed: () {
                          setState(() {
                            confirmPasswordVisible = !confirmPasswordVisible;
                          });
                        }),
                  ),
                  height20,
                  isRegistrationInProgress
                      ? const Center(
                          child: LoadingSpinKitFadingCircle(
                              size: 44, color: Colors.black),
                        )
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
                                await registration();
                              },
                              child: const Text(
                                "Registration",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                  height30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      width5,
                      InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NewLoginScreen()),
                              (route) => false);
                        },
                        child: const Text(
                          "Login",
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

Map<String, String> globalHeader = {
  'Accept': 'application/json',
  'Content-Type': 'application/json',
  'Accept-Encoding': 'application/gzip'
};

Map<String, String> uploadHeader = {
  'Accept': 'application/json',
  'Content-Type': 'multipart/form-data',
};

Map<String, dynamic> payload = {
  "brand": deviceBrand,
  "platform": devicePlatform,
  "version": deviceAndroidVersion,
  "model": deviceModel,
  "architecture": deviceArchitecture,
  "mobile": isMobile,
  "device": device
};
