import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_courses_template/assets/themes/app_theme_data.dart';
import 'package:surf_flutter_courses_template/assets/themes/green_app_theme_data.dart';
import 'package:surf_flutter_courses_template/assets/themes/purple_app_theme_data.dart';

abstract interface class IThemeLocalDatasource {
  Future<void> setThemeMode({
    required final ThemeMode themeMode,
  });

  ThemeMode? getThemeMode();

  Future<void> setThemeData({
    required final AppThemeData themeData,
  });

  AppThemeData? getThemeData();
}

class ThemeLocalDatasource implements IThemeLocalDatasource {
  ThemeLocalDatasource({
    required this.prefs,
  });

  final SharedPreferences prefs;

  @override
  AppThemeData? getThemeData() {
    try {
      final storedName = prefs.getString(
        ThemeStorageKeys.appTheme.key,
      );
      if (storedName?.isEmpty ?? true) return null;
      return getThemeDataByName(storedName: storedName!);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  ThemeMode? getThemeMode() {
    try {
      final storedThemeMode = prefs.getString(ThemeStorageKeys.mode.key);

      if (storedThemeMode?.isEmpty ?? true) return null;

      return ThemeMode.values.firstWhereOrNull(
        (themeMode) => themeMode.name == storedThemeMode,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<void> setThemeData({
    required AppThemeData themeData,
  }) async {
    try {
      await prefs.setString(
        ThemeStorageKeys.appTheme.key,
        themeData.name,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<void> setThemeMode({
    required ThemeMode themeMode,
  }) async {
    try {
      await prefs.setString(ThemeStorageKeys.mode.key, themeMode.name);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  AppThemeData getThemeDataByName({
    required final String storedName,
  }) {
    final greenTheme = GreenAppThemeData();
    final purpleTheme = PurpleAppThemeData();
    return switch (storedName) {
      'green' => greenTheme,
      'purple' => purpleTheme,
      String() => greenTheme,
    };
  }
}

enum ThemeStorageKeys {
  mode('theme_mode'),
  appTheme('app_theme');

  final String key;

  const ThemeStorageKeys(this.key);
}
