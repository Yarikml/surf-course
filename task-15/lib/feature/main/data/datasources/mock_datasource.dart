import 'package:surf_flutter_courses_template/assets/mocks/photos_mock.dart';
import 'package:surf_flutter_courses_template/feature/main/model/photo_entity.dart';

/// Mock client
abstract interface class IMockDatasource {
  Future<List<PhotoEntity>> getPhotos();
}

class MockDatasource implements IMockDatasource {
  MockDatasource();

  @override
  Future<List<PhotoEntity>> getPhotos() async {
    try {
      return Future.value(mockPhotos);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
