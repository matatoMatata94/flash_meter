import 'package:flash_meter/view/theme/color/color_palette.dart';
import 'package:flutter/material.dart';

class ColorMapping {
  ColorMapping(this._isLightMode)
      : _lightColorPalette = LightColorPalette(),
        _darkColorPalette = DarkColorPalette();

  final bool _isLightMode;
  final ColorPalette _lightColorPalette;
  final ColorPalette _darkColorPalette;

  Color _map(Color light, Color dark) {
    return _isLightMode ? light : dark;
  }

  Color get scaffoldBackgroundColor {
    return _map(
      _lightColorPalette.scaffoldBackgroundColor,
      _darkColorPalette.scaffoldBackgroundColor,
    );
  }

  Color get primaryColorLight {
    return _map(
      _lightColorPalette.primaryColorLight,
      _darkColorPalette.primaryColorLight,
    );
  }

  Color get primaryColorDark {
    return _map(
      _lightColorPalette.primaryColorDark,
      _darkColorPalette.primaryColorDark,
    );
  }

  Color get dividerColor {
    return _map(
      _lightColorPalette.primaryColorDark,
      _darkColorPalette.primaryColorDark,
    );
  }
}
