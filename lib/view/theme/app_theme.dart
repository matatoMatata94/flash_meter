import 'package:flash_meter/controller/flash_meter_theme_provider.dart';
import 'package:flash_meter/view/theme/color/color_mapping.dart';
import 'package:flash_meter/view/theme/widget_theme/theme_mapping.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final ThemeProvider themeProvider;

  AppTheme({
    required this.themeProvider,
  });

  ColorMapping get color => ColorMapping(themeProvider.isLightMode);
  ThemeMapping get theme => ThemeMapping(themeProvider.isLightMode);

  ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: color.scaffoldBackgroundColor,
      appBarTheme: theme.appBarTheme,
      bottomNavigationBarTheme: theme.bottomNavigationBarTheme,
      iconButtonTheme: theme.iconButtonTheme,
      iconTheme: theme.iconTheme,
      elevatedButtonTheme: theme.elevatedButtonTheme,
      cardTheme: theme.cardTheme,
      textTheme: TextTheme(),
    );
  }
}
