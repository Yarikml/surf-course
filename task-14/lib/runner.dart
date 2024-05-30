import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:surf_flutter_courses_template/feature/app/app.dart';
import 'package:surf_flutter_courses_template/feature/main/data/datasources/theme_local_datasource.dart';
import 'package:surf_flutter_courses_template/feature/main/data/repositories/theme_repository.dart';

import 'feature/main/state_manager/theme_controller.dart';

Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final prefs = await SharedPreferences.getInstance();
  final themeStorage = ThemeLocalDatasource(
    prefs: prefs,
  );
  final themeRepository = ThemeRepository(
    themeLocalDatasource: themeStorage,
  );
  final themeController = ThemeController(
    themeRepository: themeRepository,
  );
  await _runApp(
    themeController: themeController,
  );
}

Future<void> _runApp({
  required ThemeController themeController,
}) async {
  runApp(App(
    themeController: themeController,
  ));
}
