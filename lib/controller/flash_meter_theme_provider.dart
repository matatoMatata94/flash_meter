import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemeData.dark();
  bool isLightMode = false;

  ThemeData get themeData => _themeData;

  void changeThemeMode(ThemeData themeData) {
    _themeData = themeData;
    print("Before: $isLightMode");
    isLightMode = !isLightMode;
    print("After: $isLightMode");
    notifyListeners();
  }
}
