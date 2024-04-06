import 'package:surf_flutter_courses_template/feature/main/data/datasources/mock_datasource.dart';
import 'package:surf_flutter_courses_template/feature/main/model/color_entity/color_entity.dart';

abstract class MainRepository {
  Future<List<ColorEntity>> getColors();
}

class MainRepositoryImpl implements MainRepository {
  final MockDatasource mockDatasource;

  MainRepositoryImpl({
    required this.mockDatasource,
  });

  @override
  Future<List<ColorEntity>> getColors() async {
    try {
      final colors = await mockDatasource.getColors();
      return colors;
    } on Object {
      rethrow;
    }
  }
}
