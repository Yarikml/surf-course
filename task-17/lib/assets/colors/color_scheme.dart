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

  final Color disabledColor;

  final Color onDisabledColor;

  /// Base color theme version.
  const AppColorScheme.light()
      : scaffoldBackground = ColorPalette.brightGray,
        primary = ColorPalette.tulip,
        regularTextColor = ColorPalette.outerSpace,
        labelTextColor = ColorPalette.crayola,
        error = ColorPalette.orangeRed,
        disabledColor = ColorPalette.lightGray,
        onDisabledColor = ColorPalette.brightGray,
        onScaffoldBackground = ColorPalette.white;

  const AppColorScheme._({
    required this.scaffoldBackground,
    required this.onScaffoldBackground,
    required this.primary,
    required this.regularTextColor,
    required this.labelTextColor,
    required this.error,
    required this.disabledColor,
    required this.onDisabledColor,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? scaffoldBackground,
    Color? onScaffoldBackground,
    Color? primary,
    Color? regularTextColor,
    Color? labelTextColor,
    Color? error,
    Color? disabledColor,
    Color? onDisabledColor,
  }) {
    return AppColorScheme._(
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      onScaffoldBackground: onScaffoldBackground ?? this.onScaffoldBackground,
      primary: primary ?? this.primary,
      regularTextColor: regularTextColor ?? this.regularTextColor,
      labelTextColor: labelTextColor ?? this.labelTextColor,
      error: error ?? this.error,
      disabledColor: disabledColor ?? this.disabledColor,
      onDisabledColor: onDisabledColor ?? this.onDisabledColor,
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
      disabledColor: Color.lerp(disabledColor, other.disabledColor, t)!,
      onDisabledColor: Color.lerp(onDisabledColor, other.onDisabledColor, t)!,
    );
  }

  /// Returns [AppColorScheme] from [context].
  static AppColorScheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorScheme>()!;
}
