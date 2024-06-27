import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:surf_flutter_courses_template/features/app/app.dart';


Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await _runApp();
}

Future<void> _runApp() async {
  runApp(const App());
}