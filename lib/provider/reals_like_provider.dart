import 'package:flutter/material.dart';

class RealsLikeProvider with ChangeNotifier {
  bool isLike = false;
  bool get getIsLike => isLike;

  like() {
    isLike = !isLike;
    notifyListeners();
    return isLike;
  }
}
