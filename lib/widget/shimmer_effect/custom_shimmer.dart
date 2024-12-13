import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final Size size;
  final double height;
  final double width;
  const CustomShimmer(
      {super.key,
      required this.size,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
  baseColor:  Color.fromARGB(
    (0.25 * 255).toInt(), // Alpha for 25% opacity
    128, // Grey color component
    128,
    128,
  ),
  highlightColor:  Color.fromARGB(
    (0.5 * 255).toInt(), // Alpha for 50% opacity
    69, // RGB values of the original color
    55,
    55,
  ),
      period: const Duration(seconds: 1),
      direction: ShimmerDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.only(left: 2, right: 20),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
