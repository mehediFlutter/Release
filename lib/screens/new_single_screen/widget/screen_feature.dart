import 'package:flutter/material.dart';

class ScreenFeature extends StatelessWidget {
  final String path;
  final String featureHeader;
  final String featureDetails;
  const ScreenFeature({
    super.key,
    required this.path,
    required this.featureHeader,
    required this.featureDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                Image.asset(path),
                const SizedBox(width: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      featureHeader,
                      style: const TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'inter'),
                    ),
                    //    SizedBox(height: 8),
                    Text(
                      featureDetails,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter'),
                    ),
                  ],
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
