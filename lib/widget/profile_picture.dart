import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfilePicture extends StatelessWidget {
    final SharedPreferences? preferences;
  final double height;
  final double width;
  const UserProfilePicture({
    super.key,
    required this.preferences, required this.height, required this.width,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFF0093E9), Color(0xFF80D0C7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: Image.network(
            preferences?.getString('image') ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk8RLjeIEybu1xwZigumVersvGJXzhmG8-0Q&s',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
