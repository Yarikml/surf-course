import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';

import 'package:surf_flutter_courses_template/assets/text/text_extension.dart';

///Тема приложения
abstract class AppThemeData {
  static final ThemeData themeData = ThemeData(
    fontFamily: 'Sora',
    appBarTheme: AppBarTheme(

      titleTextStyle: _textTheme.regular12,
      iconTheme: IconThemeData(
        color: _colorScheme.primary,
      ),
      backgroundColor: _colorScheme.background,
      elevation: 0,
    ),
    dividerColor: _colorScheme.dividerColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: _colorScheme.background,
    primaryColor: _colorScheme.primary,
    extensions: [_colorScheme, _textTheme],
  );

  static const _colorScheme = AppColorScheme();
  static final _textTheme = AppTextTheme.base();
}
