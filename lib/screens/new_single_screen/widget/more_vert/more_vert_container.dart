import 'package:flutter/material.dart';

import '../../../../../widget/alert_dialog.dart';

class MoreVertContainer extends StatelessWidget {
  final String text;

  final Function() onTap;
  const MoreVertContainer({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 44,
        decoration: BoxDecoration(
            color: const Color(0xFFf3f4f6),
            border: Border.all(color: const Color(0xFFd1d5db)),
            borderRadius: BorderRadius.circular(8)),
        child: Center(child: Text(text)),
      ),
    );
  }
}

class MoreVertDisableContainer extends StatelessWidget {
  final String text;
  const MoreVertDisableContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CustomAlertDialog().disableTopicDialog(context, 'Ok');
      },
      child: Container(
        height: 44,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 212, 222, 230),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(color: Color(0xFF78716c)),
        )),
      ),
    );
  }
}
