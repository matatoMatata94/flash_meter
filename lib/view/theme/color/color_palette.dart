import 'package:flutter/material.dart';

abstract class ColorPalette {
  Color get scaffoldBackgroundColor;
  Color get primaryColorLight;
  Color get primaryColorDark;
  Color get dividerColor;
}

class LightColorPalette implements ColorPalette {
  @override
  Color get scaffoldBackgroundColor => Colors.white;

  @override
  Color get primaryColorLight => Colors.blue;

  @override
  Color get primaryColorDark => Colors.purple;

  @override
  Color get dividerColor => Colors.black12;
}

class DarkColorPalette implements ColorPalette {
  @override
  Color get scaffoldBackgroundColor => Colors.black;

  @override
  Color get primaryColorLight => Colors.grey;

  @override
  Color get primaryColorDark => Colors.yellow;

  @override
  Color get dividerColor => Colors.red;
}
