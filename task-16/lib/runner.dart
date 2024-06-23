import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:surf_flutter_courses_template/feature/app/app.dart';
import 'package:surf_flutter_courses_template/feature/main/state_manager/reply_controller.dart';

import 'feature/main/data/datasources/main_remote_datasource.dart';
import 'feature/main/data/repositories/main_repository.dart';

Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final IMainRepository mainRepository = MainRepository(
    mainRemoteDatasource: MainRemoteDatasource(
      client: Dio(),
    ),
  );

  final replyController = ReplyController(
    mainRepository: mainRepository,
  );
  await _runApp(replyController: replyController);
}

Future<void> _runApp({
  required ReplyController replyController,
}) async {
  runApp(App(
    replyController: replyController,
  ));
}
