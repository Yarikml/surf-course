import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:surf_flutter_courses_template/feature/app/app.dart';

import 'feature/main/data/datasources/main_remote_datasource.dart';
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
  mainRemoteDatasource: MainRemoteDatasource(
    client: Dio(),
  ),
);
