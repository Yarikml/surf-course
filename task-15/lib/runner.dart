import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:surf_flutter_courses_template/feature/app/app.dart';

import 'feature/main/data/datasources/mock_datasource.dart';
import 'feature/main/data/repositories/main_repository.dart';

Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await _runApp();
}

Future<void> _runApp() async {
  runApp(const App());
}

final IMainRepository mainRepository = MainRepository(
  mockDatasource: MockDatasource(),
);
