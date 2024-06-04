import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/themes/app_theme_data.dart';

import '../colors/color_scheme.dart';
import '../text/app_text_scheme.dart';

class OrangeAppThemeData implements AppThemeData {
  /// Light orange theme configuration.
  @override
  final light = ThemeData(
    fontFamily: 'SF-Pro-Display',
    primaryColor: _orangeLightColorScheme.primary,
    scaffoldBackgroundColor: _orangeLightColorScheme.scaffoldBackground,
    highlightColor: _orangeLightColorScheme.schemeSecondPreviewColor,
    focusColor: _orangeLightColorScheme.schemeThirdPreviewColor,
    hintColor: _orangeLightColorScheme.schemeFourthPreviewColor,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: _orangeLightColorScheme.bottomSheetBackground,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: _orangeTextSchemeLight.bold18,
      iconTheme: IconThemeData(
        color: _orangeLightColorScheme.primary,
      ),
      backgroundColor: _orangeLightColorScheme.scaffoldBackground,
    ),
    iconTheme: IconThemeData(
      color: _orangeLightColorScheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        foregroundColor: _orangeLightColorScheme.elevatedButtonForegroundColor,
        backgroundColor: _orangeLightColorScheme.elevatedButtonBackgroundColor,
        textStyle: _orangeTextSchemeLight.regular16Error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        foregroundColor: _orangeLightColorScheme.outlinedButtonForegroundColor,
        textStyle: _orangeTextSchemeLight.regular16Error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    extensions: [_orangeLightColorScheme, _orangeTextSchemeLight],
    brightness: Brightness.light,
  );

  /// Dark orange theme configuration.
  @override
  final dark = ThemeData(
    fontFamily: 'SF-Pro-Display',
    primaryColor: _orangeDarkColorScheme.primary,
    scaffoldBackgroundColor: _orangeDarkColorScheme.scaffoldBackground,
    highlightColor: _orangeDarkColorScheme.schemeSecondPreviewColor,
    focusColor: _orangeDarkColorScheme.schemeThirdPreviewColor,
    hintColor: _orangeDarkColorScheme.schemeFourthPreviewColor,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: _orangeDarkColorScheme.bottomSheetBackground,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: _orangeTextSchemeDark.bold18,
      iconTheme: IconThemeData(
        color: _orangeDarkColorScheme.primary,
      ),
      backgroundColor: _orangeDarkColorScheme.scaffoldBackground,
    ),
    iconTheme: IconThemeData(
      color: _orangeDarkColorScheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        foregroundColor: _orangeDarkColorScheme.elevatedButtonForegroundColor,
        backgroundColor: _orangeDarkColorScheme.elevatedButtonBackgroundColor,
        textStyle: _orangeTextSchemeLight.regular16Error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        foregroundColor: _orangeDarkColorScheme.outlinedButtonForegroundColor,
        textStyle: _orangeTextSchemeDark.regular16Error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    extensions: [_orangeDarkColorScheme, _orangeTextSchemeDark],
  );

  static final AppColorScheme _orangeLightColorScheme =
      AppColorScheme.orangeLight();
  static final AppColorScheme _orangeDarkColorScheme =
      AppColorScheme.orangeDark();

  static final _orangeTextSchemeLight = AppTextScheme.orangeLight();
  static final _orangeTextSchemeDark = AppTextScheme.orangeDark();

  @override
  final name = AppThemeDataName.orange;
}
