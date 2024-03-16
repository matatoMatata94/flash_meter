import 'package:flutter/material.dart';

abstract class ColorPalette {
  Color get scaffoldBackgroundColor;
}

class LightColorPalette implements ColorPalette {
  @override
  Color get scaffoldBackgroundColor => Colors.white70;
}

class DarkColorPalette implements ColorPalette {
  @override
  Color get scaffoldBackgroundColor => Colors.blueGrey;
}
