import 'package:surf_flutter_courses_template/feature/main/data/datasources/main_remote_datasource.dart';

///Mock repository
abstract interface class IMainRepository {}

class MainRepository implements IMainRepository {
  final IMainRemoteDatasource mainRemoteDatasource;

  MainRepository({
    required this.mainRemoteDatasource,
  });
}
