import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surf_flutter_courses_template/uikit/text/app_text_scheme.dart';

/// Class of the app themes data.
abstract class AppThemeData {
  /// Light theme configuration.
  static final lightTheme = ThemeData(
      fontFamily: GoogleFonts.ubuntu().fontFamily,
      scaffoldBackgroundColor: Colors.white,
      extensions: [_textScheme],
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
      ));

  static final _textScheme = AppTextScheme.base();
}
