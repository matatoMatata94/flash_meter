import 'package:flash_meter/view/theme/widget_theme/theme_palette.dart';
import 'package:flutter/material.dart';

class ThemeMapping {
  ThemeMapping(this._isLightMode)
      : _lightThemePalette = LightThemePalette(),
        _darkThemePalette = DarkThemePalette();

  final bool _isLightMode;
  final ThemePalette _lightThemePalette;
  final ThemePalette _darkThemePalette;

  AppBarTheme _mapAppBarTheme(var light, var dark) {
    return _isLightMode ? light : dark;
  }

  BottomNavigationBarThemeData _mapBottomNavigationBarTheme(
      var light, var dark) {
    return _isLightMode ? light : dark;
  }

  IconButtonThemeData _mapIconButtonTheme(var light, var dark) {
    return _isLightMode ? light : dark;
  }

  IconThemeData _mapIconTheme(var light, var dark) {
    return _isLightMode ? light : dark;
  }

  ElevatedButtonThemeData _mapElevatedButtonTheme(var light, var dark) {
    return _isLightMode ? light : dark;
  }

  AppBarTheme get appBarTheme {
    return _mapAppBarTheme(
      _lightThemePalette.appBarTheme,
      _darkThemePalette.appBarTheme,
    );
  }

  BottomNavigationBarThemeData get bottomNavigationBarTheme {
    return _mapBottomNavigationBarTheme(
      _lightThemePalette.bottomNavigationBarTheme,
      _darkThemePalette.bottomNavigationBarTheme,
    );
  }

  IconButtonThemeData get iconButtonTheme {
    return _mapIconButtonTheme(
      _lightThemePalette.iconButtonTheme,
      _darkThemePalette.iconButtonTheme,
    );
  }

  IconThemeData get iconTheme {
    return _mapIconTheme(
      _lightThemePalette.iconTheme,
      _darkThemePalette.iconTheme,
    );
  }

  ElevatedButtonThemeData get elevatedButtonTheme {
    return _mapElevatedButtonTheme(
      _lightThemePalette.elevatedButtonTheme,
      _darkThemePalette.elevatedButtonTheme,
    );
  }
}
