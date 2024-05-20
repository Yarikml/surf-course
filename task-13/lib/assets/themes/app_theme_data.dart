import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';

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
    ),
    snackBarTheme: const SnackBarThemeData(
      width: 173,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    ),
  );

  static final _textScheme = AppTextScheme.base();
}
