import 'package:surf_flutter_courses_template/feature/main/data/datasources/mock_datasource.dart';
import 'package:surf_flutter_courses_template/feature/main/model/color_entity/color_entity.dart';

abstract interface class IMainRepository {
  Future<List<ColorEntity>> getColors();
}

class MainRepository implements IMainRepository {
  final MockDatasource mockDatasource;

  MainRepository({
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
