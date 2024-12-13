import 'package:flutter/material.dart';

class AppBarBackArrowAndName extends StatelessWidget {
  final String text;
  const AppBarBackArrowAndName({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        const SizedBox()
      ],
    );
  }
}
