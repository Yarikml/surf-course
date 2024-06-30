import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_pallete.dart';

/// App color schemes
@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color scaffoldBackground;

  final Color onScaffoldBackground;

  final Color primary;

  final Color regularTextColor;

  final Color labelTextColor;

  final Color error;

  /// Base color theme version.
  const AppColorScheme.light()
      : scaffoldBackground = ColorPalette.brightGray,
        primary = ColorPalette.tulip,
        regularTextColor = ColorPalette.outerSpace,
        labelTextColor = ColorPalette.crayola,
        error = ColorPalette.orangeRed,
        onScaffoldBackground = ColorPalette.white;

  const AppColorScheme._({
    required this.scaffoldBackground,
    required this.onScaffoldBackground,
    required this.primary,
    required this.regularTextColor,
    required this.labelTextColor,
    required this.error,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? scaffoldBackground,
    Color? onScaffoldBackground,
    Color? primary,
    Color? regularTextColor,
    Color? labelTextColor,
    Color? error,
  }) {
    return AppColorScheme._(
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      onScaffoldBackground: onScaffoldBackground ?? this.onScaffoldBackground,
      primary: primary ?? this.primary,
      regularTextColor: regularTextColor ?? this.regularTextColor,
      labelTextColor: labelTextColor ?? this.labelTextColor,
      error: error ?? this.error,
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
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      onScaffoldBackground:
          Color.lerp(onScaffoldBackground, other.onScaffoldBackground, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      regularTextColor:
          Color.lerp(regularTextColor, other.regularTextColor, t)!,
      labelTextColor: Color.lerp(labelTextColor, other.labelTextColor, t)!,
      error: Color.lerp(error, other.error, t)!,
    );
  }

  /// Returns [AppColorScheme] from [context].
  static AppColorScheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorScheme>()!;
}
