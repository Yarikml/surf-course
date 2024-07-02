import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:surf_flutter_courses_template/features/app/app.dart';
import 'package:surf_flutter_courses_template/features/register_pet/state_manager/register_pet_controller.dart';

Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final registerPetController = RegisterPetController();
  await _runApp(registerPetController: registerPetController);
}

Future<void> _runApp({
  required RegisterPetController registerPetController,
}) async {
  runApp(
    App(
      registerPetController: registerPetController,
    ),
  );
}
