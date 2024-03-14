import 'package:flutter/material.dart';

abstract class ThemePalette {
  BottomNavigationBarThemeData get bottomNavigationBarTheme;
  IconButtonThemeData get iconButtonTheme;
  IconThemeData get iconTheme;
  ElevatedButtonThemeData get elevatedButtonTheme;
  AppBarTheme get appBarTheme;
}

class LightThemePalette implements ThemePalette {
  @override
  AppBarTheme get appBarTheme => const AppBarTheme(
        color: Colors.white54,
      );

  @override
  BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      const BottomNavigationBarThemeData(
        backgroundColor: Colors.white54,
      );

  @override
  IconButtonThemeData get iconButtonTheme => const IconButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
          iconColor: MaterialStatePropertyAll<Color>(Colors.black),
        ),
      );

  @override
  IconThemeData get iconTheme => const IconThemeData();

  @override
  ElevatedButtonThemeData get elevatedButtonTheme =>
      const ElevatedButtonThemeData();
}

class DarkThemePalette implements ThemePalette {
  @override
  AppBarTheme get appBarTheme => const AppBarTheme();

  @override
  BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      const BottomNavigationBarThemeData();

  @override
  IconButtonThemeData get iconButtonTheme => const IconButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),
          iconColor: MaterialStatePropertyAll<Color>(Colors.white),
        ),
      );

  @override
  IconThemeData get iconTheme => const IconThemeData();

  @override
  ElevatedButtonThemeData get elevatedButtonTheme =>
      const ElevatedButtonThemeData();
}
