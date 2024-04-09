import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/app/app.dart';
import 'features/receipt/logic/repositories/receipt_repository.dart';

Future<void> run() async {
  /// It must be called so that the orientation does not fall.
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await _runApp();
}

Future<void> _runApp() async {
  runApp(const App());
}
final ReceiptRepository receiptRepository = ReceiptRepositoryImpl();
