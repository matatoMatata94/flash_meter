import 'package:flash_meter/controller/flash_meter_theme_provider.dart';
import 'package:flutter/material.dart';

class ColorConstants {
  ThemeProvider themeProvider = ThemeProvider();

  ColorConstants();

  late List<Color> scaffoldBackgroundColor = themeProvider.isLightMode
      ? [const Color(0xFF1668b4), const Color(0xFF144778)]
      : [Colors.blue.shade500, Colors.white];

  late Color inputBoxColor =
      themeProvider.isLightMode ? Colors.white : Colors.black;

  late Color deleteButtonColor =
      themeProvider.isLightMode ? Colors.white : Colors.black;

  late Color numberButtonColor =
      themeProvider.isLightMode ? Colors.black12 : const Color(0xFF2484d3);

  late Color numberButtonTextColor =
      themeProvider.isLightMode ? Colors.white : const Color(0xFF0f2742);

  late Color appBarBackgroundColor =
      themeProvider.isLightMode ? Colors.blue : const Color(0xFF1668b4);

  late Color bottomNavigationBackgroundColor =
      themeProvider.isLightMode ? Colors.blue : const Color(0xFF0f2742);

  final Color customControlButtonForegroundColor = Colors.white;
  final Color customControlButtonBackgroundColor = Colors.blue;

  final Color bottomNavigationSelectedItemColor = Colors.white;
  final Color bottomNavigationUnselectedItemColor = Colors.grey;
}
