import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';

/// Class of the app themes data.
abstract class AppThemeData {
  static final lightTheme = ThemeData(
    extensions: [_textScheme],
  );

  static final _textScheme = AppTextScheme.base();
}
