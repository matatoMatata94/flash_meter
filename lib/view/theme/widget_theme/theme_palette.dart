import 'package:flutter/material.dart';

abstract class ThemePalette {
  BottomNavigationBarThemeData get bottomNavigationBarTheme;
  IconButtonThemeData get iconButtonTheme;
}

class LightThemePalette implements ThemePalette {
  @override
  BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      const BottomNavigationBarThemeData();

  @override
  IconButtonThemeData get iconButtonTheme => const IconButtonThemeData();
}

class DarkThemePalette implements ThemePalette {
  @override
  BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      const BottomNavigationBarThemeData();

  @override
  IconButtonThemeData get iconButtonTheme => const IconButtonThemeData();
}
