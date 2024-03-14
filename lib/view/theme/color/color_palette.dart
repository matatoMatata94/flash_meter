import 'package:flutter/material.dart';

abstract class ColorPalette {
  Color get scaffoldBackgroundColor;
  Color get primaryColorLight;
  Color get primaryColorDark;
}

class LightColorPalette implements ColorPalette {
  @override
  Color get scaffoldBackgroundColor => Colors.white70;

  @override
  Color get primaryColorLight => Colors.blue;

  @override
  Color get primaryColorDark => Colors.purple;
}

class DarkColorPalette implements ColorPalette {
  @override
  Color get scaffoldBackgroundColor => Colors.black54;

  @override
  Color get primaryColorLight => Colors.grey;

  @override
  Color get primaryColorDark => Colors.yellow;
}
