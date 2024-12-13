import 'package:flutter/material.dart';
import 'package:release/const/const_radio.dart';

class VehicleDetailsBanner extends StatelessWidget {
  final String vehicleName;
  final String code;
  const VehicleDetailsBanner({
    super.key,
    required this.vehicleName,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(children: [
        Row(
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back)),
            width10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vehicleName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    height: 0,
                  ),
                ),
                Text(
                  code,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    height: 0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
