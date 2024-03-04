import 'package:flutter/material.dart';

abstract class ColorPalette {
  List<Color> get scaffoldBackgroundColor;
  Color get inputBoxColor;
  Color get deleteButtonColor;
  Color get numberButtonColor;
  Color get numberButtonTextColor;
  Color get appBarBackgroundColor;
  Color get bottomNavigationBackgroundColor;
  Color get customControlButtonForegroundColor;
  Color get customControlButtonBackgroundColor;
  Color get bottomNavigationSelectedItemColor;
  Color get bottomNavigationUnselectedItemColor;
}

class LightColorPalette implements ColorPalette {
  @override
  List<Color> get scaffoldBackgroundColor =>
      [Colors.blue.shade500, Colors.white];

  @override
  Color get inputBoxColor => Colors.white;

  @override
  Color get deleteButtonColor => Colors.white;

  @override
  Color get numberButtonColor => Colors.black12;

  @override
  Color get numberButtonTextColor => Colors.white;

  @override
  Color get appBarBackgroundColor => Colors.blue;

  @override
  Color get bottomNavigationBackgroundColor => Colors.blue;

  @override
  Color get customControlButtonForegroundColor => Colors.white;

  @override
  Color get customControlButtonBackgroundColor => Colors.blue;

  @override
  Color get bottomNavigationSelectedItemColor => Colors.white;

  @override
  Color get bottomNavigationUnselectedItemColor => Colors.grey;
}

class DarkColorPalette implements ColorPalette {
  @override
  List<Color> get scaffoldBackgroundColor =>
      [const Color(0xFF1668b4), const Color(0xFF144778)];

  @override
  Color get inputBoxColor => Colors.black;

  @override
  Color get deleteButtonColor => Colors.black;

  @override
  Color get numberButtonColor => const Color(0xFF2484d3);

  @override
  Color get numberButtonTextColor => const Color(0xFF0f2742);

  @override
  Color get appBarBackgroundColor => const Color(0xFF1668b4);

  @override
  Color get bottomNavigationBackgroundColor => const Color(0xFF0f2742);

  @override
  Color get customControlButtonForegroundColor => Colors.white;

  @override
  Color get customControlButtonBackgroundColor => Colors.blue;

  @override
  Color get bottomNavigationSelectedItemColor => Colors.white;

  @override
  Color get bottomNavigationUnselectedItemColor => Colors.grey;
}
