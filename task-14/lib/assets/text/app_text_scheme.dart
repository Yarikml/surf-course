// ignore_for_file: avoid-non-null-assertion, prefer-correct-callback-field-name
import 'package:flutter/material.dart';

import 'app_text_style.dart';

/// App text style scheme.
class AppTextScheme extends ThemeExtension<AppTextScheme> {
  final TextStyle regular12;
  final TextStyle regular14;
  final TextStyle regular14Label;
  final TextStyle regular14Accent;
  final TextStyle regular16Error;
  final TextStyle bold18;

  const AppTextScheme._({
    required this.regular12,
    required this.regular14,
    required this.regular14Label,
    required this.regular14Accent,
    required this.regular16Error,
    required this.bold18,
  });

  /// Base app text theme.
  AppTextScheme.greenLight()
      : regular12 = GreenTextStyleLight.regular12,
        regular14 = GreenTextStyleLight.regular14,
        regular14Label = GreenTextStyleLight.regular14Label,
        regular14Accent = GreenTextStyleLight.regular14Accent,
        regular16Error = GreenTextStyleLight.regular16Error,
        bold18 = GreenTextStyleLight.bold18;
  AppTextScheme.greenDark()
      : regular12 = GreenTextStyleDark.regular12,
        regular14 = GreenTextStyleDark.regular14,
        regular14Label = GreenTextStyleDark.regular14Label,
        regular14Accent = GreenTextStyleDark.regular14Accent,
        regular16Error = GreenTextStyleDark.regular16Error,
        bold18 = GreenTextStyleDark.bold18;

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
      regular14: TextStyle.lerp(regular14, other.regular14, t)!,
      regular14Label: TextStyle.lerp(regular14Label, other.regular14Label, t)!,
      regular14Accent:
          TextStyle.lerp(regular14Accent, other.regular14Accent, t)!,
      regular16Error: TextStyle.lerp(regular16Error, other.regular16Error, t)!,
      bold18: TextStyle.lerp(bold18, other.bold18, t)!,
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
    TextStyle? regular14,
    TextStyle? regular14Label,
    TextStyle? regular14Accent,
    TextStyle? regular16Error,
    TextStyle? bold18,
  }) {
    return AppTextScheme._(
      regular12: regular12 ?? this.regular12,
      regular14: regular14 ?? this.regular14,
      regular14Label: regular14Label ?? this.regular14Label,
      regular14Accent: regular14Accent ?? this.regular14Accent,
      regular16Error: regular16Error ?? this.regular16Error,
      bold18: bold18 ?? this.bold18,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppTextScheme not found in $context');
