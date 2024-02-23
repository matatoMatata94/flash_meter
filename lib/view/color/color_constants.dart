import 'package:flash_meter/controller/flash_meter_theme_controller.dart';
import 'package:flutter/material.dart';

//#1668b4

class ColorConstants {
  final ThemeController themeController;

  ColorConstants({required this.themeController});

  late List<Color> scaffoldBackgroundColor = themeController.isLightMode
      ? [const Color(0xFF1668b4), const Color(0xFF144778)]
      : [Colors.blue.shade500, Colors.white];

  // static List<Color> darkScaffoldBackgroundColor = [
  //   const Color(0xFF1668b4),
  //   const Color(0xFF144778),
  // ];
  // static List<Color> lightScaffoldBackgroundColor = [
  //   Colors.blue.shade500,
  //   Colors.white,
  // ];

  late Color appBarBackgroundColor =
      themeController.isLightMode ? Colors.blue : const Color(0xFF1668b4);

  late Color bottomNavigationBackgroundColor =
      themeController.isLightMode ? Colors.blue : const Color(0xFF0f2742);

  static Color bottomNavigationSelectedItemColor = Colors.white;
  static Color bottomNavigationUnselectedItemColor = Colors.grey;

  static Color customControlButtonForegroundColor = Colors.white;
  static Color customControlButtonBackgroundColor = Colors.blue;

  static Color lightInputBoxColor = Colors.white;
  static Color darkInputBoxColor = Colors.black;

  static Color lightDeleteButtonColor = Colors.white;
  static Color darkDeleteButtonColor = Colors.black;

  static Color lightNumberButtonColor = Colors.black12;
  static Color darkNumberButtonColor = const Color(0xFF2484d3);
  static Color lightNumberButtonTextColor = Colors.white;
  static Color darkNumberButtonTextColor = const Color(0xFF0f2742);
}
