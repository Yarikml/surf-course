import 'package:flutter/material.dart';

import '../colors/color_scheme.dart';
import '../text/app_text_scheme.dart';

/// Class of the app themes data.
abstract class AppThemeData {
  /// Light green theme configuration.
  static final greenLightTheme = ThemeData(
    scaffoldBackgroundColor: _greenLightColorScheme.scaffoldBackground,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: _greenLightColorScheme.bottomSheetBackground,
    ),
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
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: _greenDarkColorScheme.bottomSheetBackground,
    ),
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

  static final purpleLightTheme = ThemeData(
    scaffoldBackgroundColor: _purpleLightColorScheme.scaffoldBackground,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: _purpleLightColorScheme.bottomSheetBackground,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: _purpleTextSchemeLight.bold18,
      iconTheme: IconThemeData(
        color: _purpleLightColorScheme.primary,
      ),
      backgroundColor: _purpleLightColorScheme.scaffoldBackground,
    ),
    iconTheme: IconThemeData(
      color: _purpleLightColorScheme.primary,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        foregroundColor: _purpleLightColorScheme.outlinedButtonForegroundColor,
        textStyle: _purpleTextSchemeLight.regular16Error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    extensions: [_purpleLightColorScheme, _purpleTextSchemeLight],
    brightness: Brightness.light,
  );

  static final purpleDarkTheme = ThemeData(
    scaffoldBackgroundColor: _purpleDarkColorScheme.scaffoldBackground,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: _purpleDarkColorScheme.bottomSheetBackground,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: _purpleTextSchemeDark.bold18,
      iconTheme: IconThemeData(
        color: _purpleDarkColorScheme.primary,
      ),
      backgroundColor: _purpleDarkColorScheme.scaffoldBackground,
    ),
    iconTheme: IconThemeData(
      color: _purpleDarkColorScheme.primary,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        foregroundColor: _purpleDarkColorScheme.outlinedButtonForegroundColor,
        textStyle: _purpleTextSchemeDark.regular16Error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    extensions: [_purpleDarkColorScheme, _purpleTextSchemeDark],
    brightness: Brightness.light,
  );

  static final AppColorScheme _greenLightColorScheme =
      AppColorScheme.greenLight();
  static final AppColorScheme _greenDarkColorScheme =
      AppColorScheme.greenDark();

  static final AppColorScheme _purpleLightColorScheme =
      AppColorScheme.purpleLight();
  static final AppColorScheme _purpleDarkColorScheme =
      AppColorScheme.purpleDark();

  static final _greenTextSchemeLight = AppTextScheme.greenLight();
  static final _greenTextSchemeDark = AppTextScheme.greenDark();

  static final _purpleTextSchemeLight = AppTextScheme.purpleLight();
  static final _purpleTextSchemeDark = AppTextScheme.purpleDark();
}
