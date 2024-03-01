import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isLightMode = true;

  void changeThemeMode() {
    isLightMode = !isLightMode;
    notifyListeners();
  }
}
