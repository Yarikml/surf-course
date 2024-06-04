import 'package:flutter/material.dart';
///Base class for app theme
abstract class AppThemeData {
  ThemeData get light;
  AppThemeDataName get name;
  ThemeData get dark;
}

enum AppThemeDataName {
  green,
  purple,
  orange,
}
