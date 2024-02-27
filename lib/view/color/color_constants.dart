import 'package:flash_meter/controller/flash_meter_theme_controller.dart';
import 'package:flutter/material.dart';

class ColorConstants {
  final ThemeController themeController;

  ColorConstants({required this.themeController});

  late List<Color> scaffoldBackgroundColor = themeController.isLightMode
      ? [const Color(0xFF1668b4), const Color(0xFF144778)]
      : [Colors.blue.shade500, Colors.white];

  late Color inputBoxColor =
      themeController.isLightMode ? Colors.white : Colors.black;

  late Color deleteButtonColor =
      themeController.isLightMode ? Colors.white : Colors.black;

  late Color numberButtonColor =
      themeController.isLightMode ? Colors.black12 : const Color(0xFF2484d3);

  late Color numberButtonTextColor =
      themeController.isLightMode ? Colors.white : const Color(0xFF0f2742);

  late Color appBarBackgroundColor =
      themeController.isLightMode ? Colors.blue : const Color(0xFF1668b4);

  late Color bottomNavigationBackgroundColor =
      themeController.isLightMode ? Colors.blue : const Color(0xFF0f2742);

  final Color customControlButtonForegroundColor = Colors.white;
  final Color customControlButtonBackgroundColor = Colors.blue;

  final Color bottomNavigationSelectedItemColor = Colors.white;
  final Color bottomNavigationUnselectedItemColor = Colors.grey;
}
