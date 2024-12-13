import 'package:flutter/material.dart';

class ModeProvider with ChangeNotifier {
  bool _lightModeEnable = true;

  bool get lightModeEnable => _lightModeEnable;

  void changeMode() {
    _lightModeEnable = !_lightModeEnable;
    notifyListeners();
  }
}
