import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../const/path.dart';

class Location extends StatelessWidget {
  final String available;
  const Location({
    super.key,
    required this.available,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          '$iconPath/location.svg',
          width: 14,
        ),
        Text(
          available,
          style: const TextStyle(fontSize: 12, height: 0),
        ),
      ],
    );
  }
}
