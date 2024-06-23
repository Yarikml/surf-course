// ignore_for_file: avoid-non-null-assertion, prefer-correct-callback-field-name
import 'package:flutter/material.dart';

import 'app_text_style.dart';

/// App text style scheme.
class AppTextScheme extends ThemeExtension<AppTextScheme> {
  final TextStyle regular16;

  final TextStyle regular56;

  const AppTextScheme._({
    required this.regular16,
    required this.regular56,
  });

  /// Base app text theme.
  AppTextScheme.base()
      : regular16 = AppTextStyle.regular16.value,
        regular56 = AppTextStyle.regular56.value;

  @override
  ThemeExtension<AppTextScheme> lerp(
    ThemeExtension<AppTextScheme>? other,
    double t,
  ) {
    if (other is! AppTextScheme) {
      return this;
    }

    return AppTextScheme._(
      regular16: TextStyle.lerp(regular16, other.regular16, t)!,
      regular56: TextStyle.lerp(regular56, other.regular56, t)!,
    );
  }

  /// Return text theme for app from context.
  static AppTextScheme of(BuildContext context) {
    return Theme.of(context).extension<AppTextScheme>() ??
        _throwThemeExceptionFromFunc(context);
  }

  /// @nodoc.
  @override
  AppTextScheme copyWith({
    TextStyle? regular16,
    TextStyle? regular56,
  }) {
    return AppTextScheme._(
      regular16: regular16 ?? this.regular16,
      regular56: regular56 ?? this.regular56,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppTextScheme not found in $context');
