import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';

import '../text/text_extension.dart';

abstract class AppThemeData {
  static final ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: _colorScheme.primary,
    extensions: [_colorScheme, _textTheme],
  );

  static const _colorScheme = AppColorScheme();
  static final _textTheme = AppTextTheme.base();
}
