import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../const/path.dart';

class ScreenImage extends StatelessWidget {
  final String imageUrl;
  final String code;
  const ScreenImage({
    super.key,
    required this.imageUrl,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => Shimmer.fromColors(
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
              errorWidget: (context, url, error) => Image.network(
                noImageFound,
                fit: BoxFit.cover,
              ),
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 15,
              left: 230,
              child: Container(
                height: 20,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    'Code :  $code',
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
