import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isLightMode = false;

  void changeThemeMode() {
    isLightMode = !isLightMode;
    notifyListeners();
  }
}
