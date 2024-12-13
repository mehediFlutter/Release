import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinKitFadingCircle extends StatelessWidget {
  final double size;
  final Color color;
  const LoadingSpinKitFadingCircle(
      {super.key, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      size: size,
      color: color,
    );
  }
}
