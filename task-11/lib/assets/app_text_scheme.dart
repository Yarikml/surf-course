// ignore_for_file: avoid-non-null-assertion, prefer-correct-callback-field-name
import 'package:flutter/material.dart';

import 'app_text_styles.dart';

/// App text style scheme.
class AppTextScheme extends ThemeExtension<AppTextScheme> {
  final TextStyle residential700;

  final TextStyle healthy400;

  const AppTextScheme._({
    required this.residential700,
    required this.healthy400,
  });

  /// Base app text theme.
  AppTextScheme.base()
      : residential700 = AppTextStyles.residential700.value,
        healthy400 = AppTextStyles.healthy400.value;

  @override
  ThemeExtension<AppTextScheme> lerp(
    ThemeExtension<AppTextScheme>? other,
    double t,
  ) {
    if (other is! AppTextScheme) {
      return this;
    }

    return AppTextScheme._(
      residential700: TextStyle.lerp(residential700, other.residential700, t)!,
      healthy400: TextStyle.lerp(healthy400, other.healthy400, t)!,
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
    TextStyle? residential700,
    TextStyle? healthy400,
  }) {
    return AppTextScheme._(
      residential700: residential700 ?? this.residential700,
      healthy400: healthy400 ?? this.healthy400,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppTextScheme not found in $context');
