import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/text/text_style.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle regular12;

  AppTextTheme._({
    required this.regular12,
  });

  /// Base app text theme.
  AppTextTheme.base() : regular12 = AppTextStyle.regular12.value;

  @override
  ThemeExtension<AppTextTheme> lerp(
    ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }

    return AppTextTheme._(
      regular12: TextStyle.lerp(regular12, other.regular12, t)!,
    );
  }

  /// Return text theme for app from context.
  static AppTextTheme of(BuildContext context) {
    return Theme.of(context).extension<AppTextTheme>() ??
        _throwThemeExceptionFromFunc(context);
  }

  /// @nodoc.
  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? regular12,
  }) {
    return AppTextTheme._(
      regular12: regular12 ?? this.regular12,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppTextTheme не найдена в $context');
