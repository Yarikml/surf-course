import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/pages/main_page.dart';
import 'package:surf_flutter_courses_template/uikit/themes/app_theme_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.lightTheme,
      home: MainPage(),
    );
  }
}
