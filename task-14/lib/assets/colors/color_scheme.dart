import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_pallete.dart';

/// Цветовая схема приложения
@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  /// Base branding color for the app.
  ///
  /// Can be used as an accent color for buttons, switches, labels, icons, etc.
  final Color primary;

  final Color scaffoldBackground;

  final Color onBackground;

  final Color bottomSheetBackground;

  final Color elevatedButtonBackgroundColor;

  final Color elevatedButtonForegroundColor;

  final Color outlinedButtonBackgroundColor;

  final Color outlinedButtonForegroundColor;

  final Color barrierColor;

  final Color photoFilter;

  /// Base color theme version.
  AppColorScheme.greenLight()
      : primary = GreenColorPaletteLight.alienArmpit,
        scaffoldBackground = GreenColorPaletteLight.white,
        onBackground = GreenColorPaletteLight.lotion,
        bottomSheetBackground = GreenColorPaletteLight.white,
        elevatedButtonBackgroundColor = GreenColorPaletteLight.hanPurple,
        elevatedButtonForegroundColor = GreenColorPaletteLight.white,
        outlinedButtonBackgroundColor = GreenColorPaletteLight.coralRed,
        outlinedButtonForegroundColor = GreenColorPaletteLight.coralRed,
        barrierColor = GreenColorPaletteLight.raisinBlack.withOpacity(0.6),
        photoFilter = GreenColorPaletteLight.raisinBlack.withOpacity(0.4);

  AppColorScheme.greenDark()
      : primary = GreenColorPaletteDark.alienArmpit,
        scaffoldBackground = GreenColorPaletteDark.black,
        onBackground = GreenColorPaletteDark.raisinBlack,
        bottomSheetBackground = GreenColorPaletteDark.raisinBlack,
        elevatedButtonBackgroundColor = GreenColorPaletteDark.hanPurple,
        elevatedButtonForegroundColor = GreenColorPaletteDark.white,
        outlinedButtonBackgroundColor = GreenColorPaletteDark.coralRed,
        outlinedButtonForegroundColor = GreenColorPaletteDark.coralRed,
        barrierColor = GreenColorPaletteDark.black.withOpacity(0.6),
        photoFilter = GreenColorPaletteDark.black.withOpacity(0.4);

  AppColorScheme.purpleLight()
      : primary = PurpleColorPaletteLight.ultramarineBlue,
        scaffoldBackground = PurpleColorPaletteLight.white,
        onBackground = PurpleColorPaletteLight.white,
        bottomSheetBackground = PurpleColorPaletteLight.white,
        elevatedButtonBackgroundColor = PurpleColorPaletteLight.ultramarineBlue,
        elevatedButtonForegroundColor = PurpleColorPaletteLight.white,
        outlinedButtonBackgroundColor = PurpleColorPaletteLight.coralRed,
        outlinedButtonForegroundColor = PurpleColorPaletteLight.coralRed,
        barrierColor = PurpleColorPaletteLight.yankeesBlue.withOpacity(0.6),
        photoFilter = PurpleColorPaletteLight.spaceCadet.withOpacity(0.4);

  AppColorScheme.purpleDark()
      : primary = PurpleColorPaletteDark.ultramarineBlue,
        scaffoldBackground = PurpleColorPaletteDark.yankeesBlue,
        onBackground = PurpleColorPaletteDark.charcoal,
        bottomSheetBackground = PurpleColorPaletteDark.charcoal,
        elevatedButtonBackgroundColor = PurpleColorPaletteDark.ultramarineBlue,
        elevatedButtonForegroundColor = PurpleColorPaletteDark.white,
        outlinedButtonBackgroundColor = PurpleColorPaletteDark.coralRed,
        outlinedButtonForegroundColor = PurpleColorPaletteDark.coralRed,
        barrierColor = PurpleColorPaletteDark.yankeesBlue.withOpacity(0.6),
        photoFilter = PurpleColorPaletteDark.spaceCadet.withOpacity(0.4);

  ///Для чего тут приватный конструктор?
  const AppColorScheme._({
    required this.primary,
    required this.scaffoldBackground,
    required this.onBackground,
    required this.bottomSheetBackground,
    required this.elevatedButtonBackgroundColor,
    required this.elevatedButtonForegroundColor,
    required this.outlinedButtonBackgroundColor,
    required this.outlinedButtonForegroundColor,
    required this.barrierColor,
    required this.photoFilter,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? primary,
    Color? scaffoldBackground,
    Color? onBackground,
    Color? bottomSheetBackground,
    Color? elevatedButtonBackgroundColor,
    Color? elevatedButtonForegroundColor,
    Color? outlinedButtonBackgroundColor,
    Color? outlinedButtonForegroundColor,
    Color? barrierColor,
    Color? photoFilter,
  }) {
    return AppColorScheme._(
      primary: primary ?? this.primary,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      onBackground: onBackground ?? this.onBackground,
      bottomSheetBackground:
          bottomSheetBackground ?? this.bottomSheetBackground,
      elevatedButtonBackgroundColor:
          elevatedButtonBackgroundColor ?? this.elevatedButtonBackgroundColor,
      elevatedButtonForegroundColor:
          elevatedButtonForegroundColor ?? this.elevatedButtonForegroundColor,
      outlinedButtonBackgroundColor:
          outlinedButtonBackgroundColor ?? this.outlinedButtonBackgroundColor,
      outlinedButtonForegroundColor:
          outlinedButtonForegroundColor ?? this.outlinedButtonForegroundColor,
      barrierColor: barrierColor ?? this.barrierColor,
      photoFilter: photoFilter ?? this.photoFilter,
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
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      bottomSheetBackground:
          Color.lerp(bottomSheetBackground, other.bottomSheetBackground, t)!,
      elevatedButtonBackgroundColor: Color.lerp(elevatedButtonBackgroundColor,
          other.elevatedButtonBackgroundColor, t)!,
      elevatedButtonForegroundColor: Color.lerp(elevatedButtonForegroundColor,
          other.elevatedButtonForegroundColor, t)!,
      outlinedButtonBackgroundColor: Color.lerp(outlinedButtonBackgroundColor,
          other.outlinedButtonBackgroundColor, t)!,
      outlinedButtonForegroundColor: Color.lerp(outlinedButtonForegroundColor,
          other.outlinedButtonForegroundColor, t)!,
      barrierColor: Color.lerp(barrierColor, other.barrierColor, t)!,
      photoFilter: Color.lerp(photoFilter, other.photoFilter, t)!,
    );
  }

  /// Returns [AppColorScheme] from [context].
  static AppColorScheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorScheme>()!;
}
