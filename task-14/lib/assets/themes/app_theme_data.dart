import 'package:flutter/material.dart';

import '../colors/color_scheme.dart';
import '../text/app_text_scheme.dart';

/// Class of the app themes data.
abstract class AppThemeData {
  /// Light green theme configuration.
  static final greenLightTheme = ThemeData(
    scaffoldBackgroundColor: _greenLightColorScheme.scaffoldBackground,
    appBarTheme: AppBarTheme(
      titleTextStyle: _greenTextSchemeLight.bold18,
      iconTheme: IconThemeData(
        color: _greenLightColorScheme.primary,
      ),
      backgroundColor: _greenLightColorScheme.scaffoldBackground,
    ),
    iconTheme: IconThemeData(
      color: _greenLightColorScheme.primary,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        foregroundColor: _greenLightColorScheme.outlinedButtonForegroundColor,
        textStyle: _greenTextSchemeLight.regular16Error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    extensions: [_greenLightColorScheme, _greenTextSchemeLight],
    brightness: Brightness.light,
  );

  /// Dark green theme configuration.
  static final greenDarkTheme = ThemeData(
    scaffoldBackgroundColor: _greenDarkColorScheme.scaffoldBackground,
    appBarTheme: AppBarTheme(
      titleTextStyle: _greenTextSchemeDark.bold18,
      iconTheme: IconThemeData(
        color: _greenDarkColorScheme.primary,
      ),
      backgroundColor: _greenDarkColorScheme.scaffoldBackground,
    ),
    iconTheme: IconThemeData(
      color: _greenDarkColorScheme.primary,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        foregroundColor: _greenDarkColorScheme.outlinedButtonForegroundColor,
        textStyle: _greenTextSchemeDark.regular16Error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    extensions: [_greenDarkColorScheme, _greenTextSchemeDark],
  );

  static  final AppColorScheme _greenLightColorScheme = AppColorScheme.greenLight();
  static  final AppColorScheme _greenDarkColorScheme = AppColorScheme.greenDark();

  static final _greenTextSchemeLight = AppTextScheme.greenLight();
  static final _greenTextSchemeDark = AppTextScheme.greenDark();
}
