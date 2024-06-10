import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/feature/main/data/datasources/theme_local_datasource.dart';
import 'package:surf_flutter_courses_template/assets/themes/app_theme_data.dart';

abstract interface class IThemeRepository {
  Future<void> setThemeMode({
    required final ThemeMode themeMode,
  });

  ThemeMode? getThemeMode();

  Future<void> setThemeData({
    required final AppThemeDataName themeDataName,
  });

  AppThemeDataName? getThemeData();
}

class ThemeRepository implements IThemeRepository {
  final IThemeLocalDatasource themeLocalDatasource;

  ThemeRepository({
    required this.themeLocalDatasource,
  });

  @override
  AppThemeDataName? getThemeData() {
    try {
      final theme = themeLocalDatasource.getThemeData();
      return theme;
    } catch (_, __) {
      rethrow;
    }
  }

  @override
  ThemeMode? getThemeMode() {
    try {
      final mode = themeLocalDatasource.getThemeMode();
      return mode;
    } catch (_, __) {
      rethrow;
    }
  }

  @override
  Future<void> setThemeData({
    required AppThemeDataName themeDataName,
  }) async {
    try {
      await themeLocalDatasource.setThemeData(themeDataName: themeDataName);
    } catch (_, __) {
      rethrow;
    }
  }

  @override
  Future<void> setThemeMode({
    required ThemeMode themeMode,
  }) async {
    try {
      await themeLocalDatasource.setThemeMode(themeMode: themeMode);
    } catch (_, __) {
      rethrow;
    }
  }
}
