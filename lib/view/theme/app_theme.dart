import 'package:flash_meter/controller/flash_meter_theme_provider.dart';
import 'package:flash_meter/view/theme/color/color_mapping.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final ThemeProvider themeProvider;

  AppTheme({
    required this.themeProvider,
  });

  ColorMapping get color => ColorMapping(themeProvider.isLightMode);

  ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: color.scaffoldBackgroundColor,
      primaryColorLight: color.primaryColorLight,
      primaryColorDark: color.primaryColorDark,
      dividerColor: color.dividerColor,
    );
  }
}
