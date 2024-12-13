import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../const/const_radio.dart';

class ShimmerEffectForSingleVehicle extends StatelessWidget {
  final bool isShareOption;
  const ShimmerEffectForSingleVehicle({super.key, required this.isShareOption});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            // border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Shimmer.fromColors(
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
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 7),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                shimmerContainer(size, 20, size.width / 2),
                height10,
                shimmerContainer(size, 12, size.width / 2),
                height5,
                shimmerContainer(size, 10, size.width / 2),
                height5,
                shimmerContainer(size, 10, size.width / 2),
                height10
              ],
            ),
          ],
        ),
      ),
    );
  }

  Shimmer shimmerContainer(Size size, double height, double width) {
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

class ShareShimmer extends StatelessWidget {
  final double width;
  const ShareShimmer({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
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
          height: 32,
          width: width,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5.31),
          ),
        ),
      ),
    );
  }
}

class WidthInfinityShimmer extends StatelessWidget {
  const WidthInfinityShimmer({super.key});

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
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5.31),
        ),
      ),
    );
  }
}

class UserSampleReelsShimmer extends StatelessWidget {
  const UserSampleReelsShimmer({super.key});

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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5.31),
        ),
      ),
    );
  }
}
