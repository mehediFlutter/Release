import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../const/color.dart';
import '../const/const_radio.dart';

class CustomAlertDialog {
  showAlertDialog(BuildContext context, String text, errorText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // contentPadding: EdgeInsets.zero,
          elevation: 50,
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          content: Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Text(
              text,
              style: small14StyleW500.copyWith(fontSize: 15),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text(
                    errorText,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  loginAlertDialog(BuildContext context, String? text, String ok) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,

          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          content: Container(
            padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text ?? 'Something Wrong Please Try Again!!!',
                  style: const TextStyle(fontSize: 16),
                ),
                height20,
                Container(
                  height: 2,
                  width: double.infinity,
                  color: const Color(0xFFE9E9E9),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ok,
                        style: const TextStyle(
                            fontSize: 16, color: Color(0xFF79747E)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // content: Padding(
          //   padding: const EdgeInsets.only(left: 10, top: 20),
          //   child: Text(
          //     text ?? 'Something Wrong Please Try Again!!!',
          //     style: small14StyleW500.copyWith(fontSize: 15),
          //   ),
          // ),
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Center(
          //       child: TextButton(
          //         onPressed: () {
          //           Navigator.of(context).pop(); // Close the dialog
          //         },
          //         child: Container(
          //           width: double.infinity,
          //           height: 44,
          //           decoration: BoxDecoration(
          //             color: Colors.black,
          //             borderRadius: BorderRadius.circular(8),
          //           ),
          //           child: Center(
          //             child: Text(
          //               ok,
          //               style: const TextStyle(color: Colors.white),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ],
        );
      },
    );
  }

  showAlertDialogServer(BuildContext context, String text, errorText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // contentPadding: EdgeInsets.zero,
          elevation: 50,
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          content: Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Text(
              text,
              style: small14StyleW500.copyWith(fontSize: 15),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextButton(
                  onPressed: () async {
                    //   SocketManager();
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text(
                    errorText,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  logOutDialog(
    BuildContext context,
    String content,
    yesText,
    noText,
    Function() logoutFunction,
    // Function() cancelFunction,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // contentPadding: EdgeInsets.zero,
          elevation: 50,
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          content: Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Text(
              content,
              style: small14StyleW500.copyWith(fontSize: 15),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      logoutFunction(); // Close the dialog
                    },
                    child: Text(
                      yesText,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text(
                      noText,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  newLogOutAndDeleteDialog(
    BuildContext context,
    String content,
    yesText,
    noText,
    Function() logoutFunction,
    // Function() cancelFunction,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          content: Container(
            padding: const EdgeInsets.only(top: 20),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      content,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Text(
                      " ?",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )
                  ],
                ),
                height20,
                Container(
                  height: 2,
                  width: double.infinity,
                  color: const Color(0xFFE9E9E9),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        noText,
                        style: const TextStyle(
                            fontSize: 16, color: Color(0xFF79747E)),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 2,
                      color: const Color(0xFFE9E9E9),
                    ),
                    TextButton(
                      onPressed: () {
                        logoutFunction();
                      },
                      child: Text(
                        yesText,
                        style: const TextStyle(
                            fontSize: 16, color: Color(0xFF79747E)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  disableTopicDialog(BuildContext context, String ok) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,

          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          content: Container(
            padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Call For Helpline',
                  style: TextStyle(fontSize: 16),
                ),
                height5,
                InkWell(
                  onTap: () async {
                    Uri phone = Uri.parse('tel:+8801969944400');
                    if (await launchUrl(phone)) {
                    } else {
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("Something went wrong. Please try again."),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 212, 222, 230),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(child: Text("+8801969944400")),
                    ),
                  ),
                ),
                height10,
                Container(
                  height: 2,
                  width: double.infinity,
                  color: const Color(0xFFE9E9E9),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ok,
                        style: const TextStyle(
                            fontSize: 16, color: Color(0xFF79747E)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // content: Padding(
          //   padding: const EdgeInsets.only(left: 10, top: 20),
          //   child: Text(
          //     text ?? 'Something Wrong Please Try Again!!!',
          //     style: small14StyleW500.copyWith(fontSize: 15),
          //   ),
          // ),
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Center(
          //       child: TextButton(
          //         onPressed: () {
          //           Navigator.of(context).pop(); // Close the dialog
          //         },
          //         child: Container(
          //           width: double.infinity,
          //           height: 44,
          //           decoration: BoxDecoration(
          //             color: Colors.black,
          //             borderRadius: BorderRadius.circular(8),
          //           ),
          //           child: Center(
          //             child: Text(
          //               ok,
          //               style: const TextStyle(color: Colors.white),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ],
        );
      },
    );
  }

  noInternetDialog(
      BuildContext context, String text, String ok, Function() onTap) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          content: Container(
            padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: Text(text)),
                height20,
                Container(
                  height: 2,
                  width: double.infinity,
                  color: const Color(0xFFE9E9E9),
                ),
                InkWell(
                  onTap: () {
                    onTap();
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ok,
                        style: const TextStyle(
                            fontSize: 16, color: Color(0xFF79747E)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
