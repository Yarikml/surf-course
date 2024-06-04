import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/themes/app_theme_data.dart';
import 'package:surf_flutter_courses_template/assets/themes/green_app_theme_data.dart';
import 'package:surf_flutter_courses_template/assets/themes/purple_app_theme_data.dart';
import 'package:surf_flutter_courses_template/feature/main/data/repositories/theme_repository.dart';

class ThemeController {
  final IThemeRepository _themeRepository;

  ThemeController({
    required IThemeRepository themeRepository,
  }) : _themeRepository = themeRepository;

  late final ValueNotifier<ThemeMode> _themeMode = ValueNotifier<ThemeMode>(
    _themeRepository.getThemeMode() ?? ThemeMode.system,
  );
  late final ValueNotifier<AppThemeData> _themeData =
      ValueNotifier<AppThemeData>(
          _themeRepository.getThemeData() ?? _greenAppTheme);

  final _greenAppTheme = GreenAppThemeData();
  final _purpleAppTheme = PurpleAppThemeData();

  ValueListenable<ThemeMode> get themeMode => _themeMode;

  ValueListenable<AppThemeData> get themeData => _themeData;

  List<AppThemeData> get appThemes => [
        _greenAppTheme,
        _purpleAppTheme,
      ];

  Future<void> setThemeMode(ThemeMode newThemeMode) async {
    if (newThemeMode == _themeMode.value) return;
    await _themeRepository.setThemeMode(themeMode: newThemeMode);
    _themeMode.value = newThemeMode;
  }

  Future<void> setThemeData(AppThemeData newThemeData) async {
    if (newThemeData == _themeData.value) return;
    await _themeRepository.setThemeData(themeData: newThemeData);
    _themeData.value = newThemeData;
  }
}
