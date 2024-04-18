import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/themes/theme_data.dart';
import 'package:surf_flutter_courses_template/features/main/widgets/pages/main_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.themeData,
      home: const MainPage(),
    );
  }
}
