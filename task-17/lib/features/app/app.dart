import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:surf_flutter_courses_template/assets/themes/app_theme_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:surf_flutter_courses_template/features/register_pet/di/register_pet_inherited.dart';

import 'package:surf_flutter_courses_template/features/register_pet/widgets/pages/register_pet_page.dart';

import 'package:surf_flutter_courses_template/features/register_pet/state_manager/register_pet_controller.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.registerPetController,
  });
  final RegisterPetController registerPetController;

  @override
  Widget build(BuildContext context) {
    return RegisterPetInherited(
      registerPetController: registerPetController,
      child: MaterialApp(
        theme: AppThemeData.lightTheme,

        /// Localization.
        locale: _localizations.firstOrNull,
        localizationsDelegates: _localizationsDelegates,
        supportedLocales: _localizations,
        home: const RegisterPetPage(),
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
