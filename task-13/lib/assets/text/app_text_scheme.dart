// ignore_for_file: avoid-non-null-assertion, prefer-correct-callback-field-name
import 'package:flutter/material.dart';

import 'app_text_style.dart';

/// App text style scheme.
class AppTextScheme extends ThemeExtension<AppTextScheme> {
  /// Text style with a size of 30/34.
  /// Use headings.
  final TextStyle bold30;

  /// Text style with a size of 12/16.
  /// Use for subtitle.
  final TextStyle regular12;

  final TextStyle regular16;

  const AppTextScheme._({
    required this.regular12,
    required this.regular16,
    required this.bold30,
  });

  /// Base app text theme.
  AppTextScheme.base()
      : regular12 = AppTextStyle.regular12.value,
        regular16 = AppTextStyle.regular16.value,
        bold30 = AppTextStyle.bold30.value;

  @override
  ThemeExtension<AppTextScheme> lerp(
    ThemeExtension<AppTextScheme>? other,
    double t,
  ) {
    if (other is! AppTextScheme) {
      return this;
    }

    return AppTextScheme._(
      regular12: TextStyle.lerp(regular12, other.regular12, t)!,
      regular16: TextStyle.lerp(regular16, other.regular16, t)!,
      bold30: TextStyle.lerp(bold30, other.bold30, t)!,
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
    TextStyle? regular12,
    TextStyle? regular16,
    TextStyle? bold30,
  }) {
    return AppTextScheme._(
      regular12: regular12 ?? this.regular12,
      regular16: regular16 ?? this.regular16,
      bold30: bold30 ?? this.bold30,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppTextScheme not found in $context');
