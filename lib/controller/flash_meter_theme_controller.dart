import 'package:flutter/material.dart';

class ThemeController {
  bool isLightMode = true;

  late List<Color> scaffoldBackgroundColor = isLightMode
      ? [const Color(0xFF1668b4), const Color(0xFF144778)]
      : [Colors.blue.shade500, Colors.white];

  late Color inputBoxColor = isLightMode ? Colors.white : Colors.black;

  late Color deleteButtonColor = isLightMode ? Colors.white : Colors.black;

  late Color numberButtonColor =
      isLightMode ? Colors.black12 : const Color(0xFF2484d3);

  late Color numberButtonTextColor =
      isLightMode ? Colors.white : const Color(0xFF0f2742);

  late Color appBarBackgroundColor =
      isLightMode ? Colors.blue : const Color(0xFF1668b4);

  late Color bottomNavigationBackgroundColor =
      isLightMode ? Colors.blue : const Color(0xFF0f2742);

  final Color customControlButtonForegroundColor = Colors.white;
  final Color customControlButtonBackgroundColor = Colors.blue;

  final Color bottomNavigationSelectedItemColor = Colors.white;
  final Color bottomNavigationUnselectedItemColor = Colors.grey;

  void changeThemeMode() {
    isLightMode = !isLightMode;
  }
}
