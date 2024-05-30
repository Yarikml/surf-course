import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/feature/main/data/repositories/theme_repository.dart';

class ThemeController {
  final IThemeRepository _themeRepository;

  ThemeController({
    required IThemeRepository themeRepository,
  }) : _themeRepository = themeRepository;

  late final ValueNotifier<ThemeMode> _themeMode = ValueNotifier<ThemeMode>(
      ThemeMode.system // _themeRepository.getThemeMode() ?? ThemeMode.system,
      );

  ValueListenable<ThemeMode> get themeMode => _themeMode;

  Future<void> setThemeMode(ThemeMode newThemeMode) async {
    if (newThemeMode == _themeMode.value) return;
    //  await _themeRepository.setThemeMode(newThemeMode);
    _themeMode.value = newThemeMode;
  }

  Future<void> switchThemeMode() async {
    final newThemeMode =
        _themeMode.value != ThemeMode.light ? ThemeMode.light : ThemeMode.dark;
    //   await _themeRepository.setThemeMode(newThemeMode);
    _themeMode.value = newThemeMode;
  }
}
