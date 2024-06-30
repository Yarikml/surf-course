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
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _lightPalette.onScaffoldBackground,
      labelStyle: _textScheme.regular16.copyWith(
        color: _lightPalette.labelTextColor,
      ),
      floatingLabelStyle: _textScheme.regular12.copyWith(
        color: _lightPalette.labelTextColor,
      ),
      floatingLabelAlignment: FloatingLabelAlignment.start,
      contentPadding: EdgeInsets.all(16),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: _lightPalette.primary,
        textStyle: _textScheme.semiBold18,
        foregroundColor: _lightPalette.onScaffoldBackground,
      ),
    ),
    extensions: [
      _textScheme,
      _lightPalette,
    ],
  );

  static final _textScheme = AppTextScheme.base();
  static const _lightPalette = AppColorScheme.light();
}
