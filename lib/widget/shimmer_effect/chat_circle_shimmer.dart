import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Shimmer circularChat() {
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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
      ),
    ),
  );
}
