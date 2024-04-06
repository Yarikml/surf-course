import 'dart:convert';

import 'package:surf_flutter_courses_template/assets/mocks/colors_mock.dart';
import 'package:surf_flutter_courses_template/feature/main/model/color_entity/color_entity.dart';

abstract class MockDatasource {
  Future<List<ColorEntity>> getColors();
}

class MockDatasourceImpl implements MockDatasource {
  MockDatasourceImpl();

  @override
  Future<List<ColorEntity>> getColors() async {
    try {
      final response = await Future.value(ColorsMock.data);
      final jsonResponse = jsonDecode(response);
      return (jsonResponse['colors'] as List<dynamic>)
          .map((item) => ColorEntity.fromJson(item))
          .toList();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
