import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  bool isLightMode = true;

  void changeThemeMode() {
    isLightMode = !isLightMode;
    notifyListeners();
  }
}
