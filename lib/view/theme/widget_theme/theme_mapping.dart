import 'package:flash_meter/view/theme/widget_theme/theme_palette.dart';
import 'package:flutter/material.dart';

class ThemeMapping {
  ThemeMapping(this._isLightMode)
      : _lightThemePalette = LightThemePalette(),
        _darkThemePalette = DarkThemePalette();

  final bool _isLightMode;
  final ThemePalette _lightThemePalette;
  final ThemePalette _darkThemePalette;

  BottomNavigationBarThemeData _map(var light, var dark) {
    return _isLightMode ? light : dark;
  }

  //TODO: Add more mapping (iconButton, icon, elevatedButton)

  BottomNavigationBarThemeData get bottomNavigationBarTheme {
    return _map(
      _lightThemePalette.bottomNavigationBarTheme,
      _darkThemePalette.bottomNavigationBarTheme,
    );
  }
}
