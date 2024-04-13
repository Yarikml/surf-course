import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/widgets/pages/profile_page.dart';

import 'assets/app_text_scheme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textScheme = AppTextScheme.base();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        extensions: [
          textScheme,
        ],
      ),
      home: Scaffold(
        body: ProfilePage(),
      ),
    );
  }
}
