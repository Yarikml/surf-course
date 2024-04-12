import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:surf_flutter_courses_template/features/app/app.dart';
import 'package:surf_flutter_courses_template/features/receipt/logic/repositories/receipt_repository.dart';

Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await _runApp();
}

Future<void> _runApp() async {
  runApp(const App());
}
final ReceiptRepository receiptRepository = ReceiptRepositoryImpl();
