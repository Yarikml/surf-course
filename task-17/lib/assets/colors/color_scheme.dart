import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_pallete.dart';

/// App color schemes
@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color regulaTextColor;

  final Color accentedTextColor;

  final Color errorTextColor;

  final Color scaffoldGradientStart;

  final Color scaffoldGradientEnd;

  /// Base color theme version.
  const AppColorScheme.dark()
      : regulaTextColor = ColorPalette.nickel,
        accentedTextColor = ColorPalette.white,
        scaffoldGradientStart = ColorPalette.eerieBlack,
        scaffoldGradientEnd = ColorPalette.black,
        errorTextColor = ColorPalette.coralRed;

  const AppColorScheme._({
    required this.regulaTextColor,
    required this.accentedTextColor,
    required this.errorTextColor,
    required this.scaffoldGradientStart,
    required this.scaffoldGradientEnd,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? regulaTextColor,
    Color? accentedTextColor,
    Color? errorTextColor,
    Color? scaffoldGradientStart,
    Color? scaffoldGradientEnd,
  }) {
    return AppColorScheme._(
      regulaTextColor: regulaTextColor ?? this.regulaTextColor,
      accentedTextColor: accentedTextColor ?? this.accentedTextColor,
      errorTextColor: errorTextColor ?? this.errorTextColor,
      scaffoldGradientStart:
          scaffoldGradientStart ?? this.scaffoldGradientStart,
      scaffoldGradientEnd: scaffoldGradientEnd ?? this.scaffoldGradientEnd,
    );
  }

  @override
  ThemeExtension<AppColorScheme> lerp(
    ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) {
      return this;
    }

    return AppColorScheme._(
      regulaTextColor: Color.lerp(regulaTextColor, other.regulaTextColor, t)!,
      accentedTextColor:
          Color.lerp(accentedTextColor, other.accentedTextColor, t)!,
      errorTextColor: Color.lerp(errorTextColor, other.errorTextColor, t)!,
      scaffoldGradientStart:
          Color.lerp(scaffoldGradientStart, other.scaffoldGradientStart, t)!,
      scaffoldGradientEnd:
          Color.lerp(scaffoldGradientEnd, other.scaffoldGradientEnd, t)!,
    );
  }

  /// Returns [AppColorScheme] from [context].
  static AppColorScheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorScheme>()!;
}
