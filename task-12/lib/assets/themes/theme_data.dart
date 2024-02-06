import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';

abstract class AppThemeData {
  static final ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: _colorScheme.primary,
  );

  static const _colorScheme = AppColorScheme();
}
