import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/themes/app_theme_data.dart';
import 'package:surf_flutter_courses_template/assets/themes/green_app_theme_data.dart';
import 'package:surf_flutter_courses_template/assets/themes/purple_app_theme_data.dart';
import 'package:surf_flutter_courses_template/feature/main/data/repositories/theme_repository.dart';
import 'package:surf_flutter_courses_template/assets/themes/orange_app_theme_data.dart';

class ThemeController {
  final IThemeRepository _themeRepository;

  ThemeController({
    required IThemeRepository themeRepository,
  }) : _themeRepository = themeRepository;

  late final ValueNotifier<ThemeMode> _themeMode = ValueNotifier<ThemeMode>(
    _themeRepository.getThemeMode() ?? ThemeMode.system,
  );
  late final ValueNotifier<AppThemeData> _themeData =
      ValueNotifier<AppThemeData>(_getStoredThemeData() ?? _greenAppTheme);

  final _greenAppTheme = GreenAppThemeData();
  final _purpleAppTheme = PurpleAppThemeData();
  final _orangeAppTheme = OrangeAppThemeData();

  ValueListenable<ThemeMode> get themeMode => _themeMode;

  ValueListenable<AppThemeData> get themeData => _themeData;

  List<AppThemeData> get appThemes => [
        _greenAppTheme,
        _purpleAppTheme,
        _orangeAppTheme,
      ];

  AppThemeData? _getStoredThemeData() {
    final themeData = _themeRepository.getThemeData();
    return switch (themeData) {
      AppThemeDataName.green => _greenAppTheme,
      AppThemeDataName.purple => _purpleAppTheme,
      AppThemeDataName.orange => _orangeAppTheme,
      null => null,
    };
  }

  Future<void> setThemeMode(ThemeMode newThemeMode) async {
    if (newThemeMode == _themeMode.value) return;
    await _themeRepository.setThemeMode(themeMode: newThemeMode);
    _themeMode.value = newThemeMode;
  }

  Future<void> setThemeData(AppThemeData newThemeData) async {
    if (newThemeData == _themeData.value) return;
    await _themeRepository.setThemeData(themeDataName: newThemeData.name);
    _themeData.value = newThemeData;
  }
}
