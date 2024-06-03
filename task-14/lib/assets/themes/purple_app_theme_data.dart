import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/themes/app_theme_data.dart';

import '../colors/color_scheme.dart';
import '../text/app_text_scheme.dart';

/// Class of the app themes data.
class PurpleAppThemeData implements AppThemeData {
  @override
  final light = ThemeData(
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        foregroundColor: _purpleLightColorScheme.elevatedButtonForegroundColor,
        backgroundColor: _purpleLightColorScheme.elevatedButtonBackgroundColor,
        textStyle: _purpleTextSchemeLight.regular16Error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    extensions: [_purpleLightColorScheme, _purpleTextSchemeLight],
    brightness: Brightness.light,
  );

  @override
  final dark = ThemeData(
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        foregroundColor: _purpleDarkColorScheme.elevatedButtonForegroundColor,
        backgroundColor: _purpleDarkColorScheme.elevatedButtonBackgroundColor,
        textStyle: _purpleTextSchemeDark.regular16Error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    extensions: [_purpleDarkColorScheme, _purpleTextSchemeDark],
    brightness: Brightness.light,
  );

  static final AppColorScheme _purpleLightColorScheme =
      AppColorScheme.purpleLight();
  static final AppColorScheme _purpleDarkColorScheme =
      AppColorScheme.purpleDark();

  static final _purpleTextSchemeLight = AppTextScheme.purpleLight();
  static final _purpleTextSchemeDark = AppTextScheme.purpleDark();
}
