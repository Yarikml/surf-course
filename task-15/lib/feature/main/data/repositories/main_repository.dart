import 'package:surf_flutter_courses_template/feature/main/data/datasources/mock_datasource.dart';
import 'package:surf_flutter_courses_template/feature/main/model/photo_entity.dart';

///Mock repository
abstract interface class IMainRepository {
  Future<List<PhotoEntity>> getPhotos();
}

class MainRepository implements IMainRepository {
  final MockDatasource mockDatasource;

  MainRepository({
    required this.mockDatasource,
  });

  @override
  Future<List<PhotoEntity>> getPhotos() async {
    try {
      final photos = await mockDatasource.getPhotos();
      return photos;
    } on Object {
      rethrow;
    }
  }
}
