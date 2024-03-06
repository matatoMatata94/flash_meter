import 'package:flutter/material.dart';

import 'color/color_mapping.dart';

class AppTheme {
  final bool isLightMode;

  AppTheme({required this.isLightMode});

  ColorMapping get color => ColorMapping(isLightMode);

  ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: color.scaffoldBackgroundColor,
      primaryColorLight: color.primaryColorLight,
      primaryColorDark: color.primaryColorDark,
      dividerColor: color.dividerColor,
    );
  }
}
