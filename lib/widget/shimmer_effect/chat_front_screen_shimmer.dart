import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ChatFrontScreenShimmer extends StatelessWidget {
  final Size size;
  const ChatFrontScreenShimmer({super.key, required this.size});

  @override

  Widget build(BuildContext context) {
    return  ListTile(
      contentPadding: EdgeInsets.zero,
      leading: shimmerContainer(size, 45.05, 50.0, true),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [shimmerContainer(size, 33.0, size.width / 1.2, false)],
      ),
    );
  }
    Shimmer shimmerContainer(Size size, double height, width, isShapeCircular) {
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
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.grey,
            shape: isShapeCircular ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isShapeCircular ? null : BorderRadius.circular(10),
            ),
      ),
    );
  }
}


