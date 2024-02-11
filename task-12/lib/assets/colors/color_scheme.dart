import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_pallete.dart';

@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  /// Base branding color for the app.
  ///
  /// Can be used as an accent color for buttons, switches, labels, icons, etc.
  final Color primary;

  final Color onPrimary;

  final Color secondary;

  final Color background;

  final Color onBackground;

  final Color dividerColor;

  const AppColorScheme()
      : primary = ColorPalette.green,
        onPrimary = ColorPalette.white,
        secondary = ColorPalette.darkBlue,
        onBackground = ColorPalette.afWhite,
        background = ColorPalette.white,
        dividerColor = ColorPalette.afWhite;

  ///Для чего тут приватный конструктор?
  const AppColorScheme._({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.background,
    required this.onBackground,
    required this.dividerColor,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? background,
    Color? onBackground,
    Color? dividerColor,
  }) {
    return AppColorScheme._(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      dividerColor: dividerColor ?? this.dividerColor,
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
        primary: Color.lerp(primary, other.primary, t)!,
        onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
        secondary: Color.lerp(secondary, other.secondary, t)!,
        background: Color.lerp(background, other.background, t)!,
        onBackground: Color.lerp(onBackground, other.onBackground, t)!,
        dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!);
  }

  /// Returns [AppColorScheme] from [context].
  static AppColorScheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorScheme>()!;
}
