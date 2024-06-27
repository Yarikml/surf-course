import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';

import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';

/// Class of the app themes data.
abstract class AppThemeData {
  static final lightTheme = ThemeData(
    fontFamily: 'SF-Pro-Display',
    textTheme: const TextTheme(),
    scaffoldBackgroundColor: _lightPalette.scaffoldBackground,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.white,
      centerTitle: true,
      backgroundColor: Colors.white,
    ),
    extensions: [_textScheme, _lightPalette],
  );

  static final _textScheme = AppTextScheme.base();
  static const _lightPalette = AppColorScheme.light();
}
