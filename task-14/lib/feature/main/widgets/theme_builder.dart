import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/themes/app_theme_data.dart';
import 'package:surf_flutter_courses_template/feature/main/di/theme_inherited.dart';

typedef ThemeWidgetBuilder = Widget Function(
  BuildContext context,
  ThemeMode themeMode,
  AppThemeData themeData,
);

class ThemeBuilder extends StatefulWidget {
  const ThemeBuilder({
    required this.builder,
    super.key,
  });

  final ThemeWidgetBuilder builder;

  @override
  State<ThemeBuilder> createState() => _ThemeBuilderState();
}

class _ThemeBuilderState extends State<ThemeBuilder> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppThemeData>(
        valueListenable: ThemeInherited.of(context).themeData,
        builder: (builderContext, themeData, _) {
          return ValueListenableBuilder<ThemeMode>(
            valueListenable: ThemeInherited.of(context).themeMode,
            builder: (
              builderContext,
              themeMode,
              _,
            ) =>
                widget.builder(
              builderContext,
              themeMode,
              themeData,
            ),
          );
        });
  }
}
