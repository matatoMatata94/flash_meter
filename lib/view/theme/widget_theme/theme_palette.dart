import 'package:flutter/material.dart';

abstract class ThemePalette {
  BottomNavigationBarThemeData get bottomNavigationBarTheme;
  IconButtonThemeData get iconButtonTheme;
  IconThemeData get iconTheme;
  ElevatedButtonThemeData get elevatedButtonTheme;
  AppBarTheme get appBarTheme;
  CardTheme get cardTheme;
}

class LightThemePalette implements ThemePalette {
  @override
  AppBarTheme get appBarTheme => const AppBarTheme(
        color: Colors.white54,
      );

  @override
  BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      BottomNavigationBarThemeData(
        backgroundColor: Colors.white54,
        selectedIconTheme: const IconThemeData(color: Colors.black),
        selectedItemColor: Colors.black,
        unselectedIconTheme: IconThemeData(color: Colors.grey.shade600),
        unselectedItemColor: Colors.grey.shade600,
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
      const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
        ),
      );

  @override
  CardTheme get cardTheme => const CardTheme(
        color: Colors.white,
      );
}

class DarkThemePalette implements ThemePalette {
  @override
  AppBarTheme get appBarTheme => const AppBarTheme(
        color: Colors.black54,
      );

  @override
  BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      const BottomNavigationBarThemeData(
        backgroundColor: Colors.black54,
        selectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: Colors.white,
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        unselectedItemColor: Colors.grey,
      );

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
      const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),
          foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
        ),
      );

  @override
  CardTheme get cardTheme => const CardTheme(
        color: Colors.black,
      );
}
