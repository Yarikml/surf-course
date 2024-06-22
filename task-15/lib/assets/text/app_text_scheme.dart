// ignore_for_file: avoid-non-null-assertion, prefer-correct-callback-field-name
import 'package:flutter/material.dart';

import 'app_text_style.dart';

/// App text style scheme.
class AppTextScheme extends ThemeExtension<AppTextScheme> {
  /// Text style with a size of 30/34.
  /// Use headings.
  final TextStyle bold18;
  final TextStyle bold18Accent;

  const AppTextScheme._({
    required this.bold18,
    required this.bold18Accent,
  });

  /// Base app text theme.
  AppTextScheme.base()
      : bold18 = AppTextStyle.bold18.value,
        bold18Accent = AppTextStyle.bold18Accent.value;

  @override
  ThemeExtension<AppTextScheme> lerp(
    ThemeExtension<AppTextScheme>? other,
    double t,
  ) {
    if (other is! AppTextScheme) {
      return this;
    }

    return AppTextScheme._(
      bold18: TextStyle.lerp(bold18, other.bold18, t)!,
      bold18Accent: TextStyle.lerp(bold18Accent, other.bold18Accent, t)!,
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
    TextStyle? bold18,
    TextStyle? bold18Accent,
  }) {
    return AppTextScheme._(
      bold18: bold18 ?? this.bold18,
      bold18Accent: bold18Accent ?? this.bold18Accent,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppTextScheme not found in $context');
