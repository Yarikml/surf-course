import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/feature/main/state_manager/buffer_notifier.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/pages/main_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:surf_flutter_courses_template/assets/themes/app_theme_data.dart';
import 'package:surf_flutter_courses_template/feature/main/data/datasources/mock_datasource.dart';
import 'package:surf_flutter_courses_template/feature/main/data/repositories/main_repository.dart';

void main() {
  runApp(const MainApp());
}

final IMainRepository mainRepository =
    MainRepository(mockDatasource: MockDatasource());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BufferNotifier(''),
      child: MaterialApp(
        theme: AppThemeData.lightTheme,

        /// Localization.
        locale: _localizations.firstOrNull,
        localizationsDelegates: _localizationsDelegates,
        supportedLocales: _localizations,
        home: const MainPage(),
      ),
    );
  }
}

const _localizations = [
  Locale('ru', 'RU'),
];

const _localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
