import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_pallete.dart';

/// App color schemes
@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color scaffoldBackground;

  final Color onScaffoldBackground;

  final Color primary;

  /// Base color theme version.
  const AppColorScheme.light()
      : scaffoldBackground = ColorPalette.brightGray,
        primary = ColorPalette.tulip,
        onScaffoldBackground = ColorPalette.white;

  const AppColorScheme._({
    required this.scaffoldBackground,
    required this.onScaffoldBackground,
    required this.primary,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? scaffoldBackground,
    Color? onScaffoldBackground,
  }) {
    return AppColorScheme._(
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      onScaffoldBackground: onScaffoldBackground ?? this.onScaffoldBackground,
      primary: primary ?? this.primary,
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
    );
  }

  /// Returns [AppColorScheme] from [context].
  static AppColorScheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorScheme>()!;
}
