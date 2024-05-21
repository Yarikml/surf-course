import 'package:flutter/material.dart';

import '../colors/color_scheme.dart';
import '../text/app_text_scheme.dart';

/// Class of the app themes data.
abstract class AppThemeData {
  /// Light green theme configuration.
  static final greenLightTheme = ThemeData(
    scaffoldBackgroundColor: _greenLightColorScheme.scaffoldBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: _greenLightColorScheme.scaffoldBackground,
    ),
    extensions: [_greenLightColorScheme, _textScheme],
    brightness: Brightness.light,
  );

  /// Dark green theme configuration.
  static final greenDarkTheme = ThemeData(
    scaffoldBackgroundColor: _greenDarkColorScheme.scaffoldBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: _greenDarkColorScheme.scaffoldBackground,
    ),
    extensions: [_greenDarkColorScheme, _textScheme],
    brightness: Brightness.dark,
  );

  static const _greenLightColorScheme = AppColorScheme.greenLight();
  static const _greenDarkColorScheme = AppColorScheme.greenDark();
  static final _textScheme = AppTextScheme.base();
}
