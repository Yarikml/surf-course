// ignore_for_file: avoid-non-null-assertion, prefer-correct-callback-field-name
import 'package:flutter/material.dart';

import 'app_text_style.dart';

/// App text style scheme.
class AppTextScheme extends ThemeExtension<AppTextScheme> {
  final TextStyle regular16;

  final TextStyle regular12;

  final TextStyle semiBold24;

  final TextStyle semiBold18;

  const AppTextScheme._({
    required this.regular16,
    required this.regular12,
    required this.semiBold18,
    required this.semiBold24,
  });

  /// Base app text theme.
  AppTextScheme.base()
      : regular16 = AppTextStyle.regular16.value,
        regular12 = AppTextStyle.regular12.value,
        semiBold18 = AppTextStyle.semiBold18.value,
        semiBold24 = AppTextStyle.semiBold24.value;

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
      regular12: TextStyle.lerp(regular12, other.regular12, t)!,
      semiBold18: TextStyle.lerp(semiBold18, other.semiBold18, t)!,
      semiBold24: TextStyle.lerp(semiBold24, other.semiBold24, t)!,
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
    TextStyle? regular12,
    TextStyle? semiBold18,
    TextStyle? semiBold24,
  }) {
    return AppTextScheme._(
      regular16: regular16 ?? this.regular16,
      regular12: regular12 ?? this.regular12,
      semiBold18: semiBold18 ?? this.semiBold18,
      semiBold24: semiBold24 ?? this.semiBold24,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppTextScheme not found in $context');
