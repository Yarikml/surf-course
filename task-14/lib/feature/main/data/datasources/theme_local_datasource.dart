import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_courses_template/assets/mocks/colors_mock.dart';
import 'package:surf_flutter_courses_template/feature/main/model/color_entity/color_entity.dart';

/// Mock client
abstract interface class IThemeLocalDatasource {
}

class ThemeLocalDatasource implements IThemeLocalDatasource {
  ThemeLocalDatasource({
    required this.prefs,
});

  final SharedPreferences prefs;

}
