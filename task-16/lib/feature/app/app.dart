import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:surf_flutter_courses_template/assets/themes/app_theme_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:surf_flutter_courses_template/feature/main/di/reply_inherited.dart';
import 'package:surf_flutter_courses_template/feature/main/state_manager/reply_controller.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/pages/main_page.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.replyController,
  });

  final ReplyController replyController;

  @override
  Widget build(BuildContext context) {
    return ReplyInherited(
      themeController: replyController,
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
