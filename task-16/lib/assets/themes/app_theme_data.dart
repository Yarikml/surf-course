import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';

/// Class of the app themes data.
abstract class AppThemeData {
  static final lightTheme = ThemeData(
    fontFamily: 'SF-Pro-Display',
    textTheme: const TextTheme().apply(bodyColor: Color(0xFF727272)),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.white,
      centerTitle: true,
      backgroundColor: Colors.white,
    ),
    extensions: [_textScheme],
  );

  static final _textScheme = AppTextScheme.base();
}
