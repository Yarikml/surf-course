import 'package:surf_flutter_courses_template/feature/main/data/datasources/main_remote_datasource.dart';
import 'package:surf_flutter_courses_template/feature/main/entity/reply_entity/reply_entity.dart';

abstract interface class IMainRepository {
  Future<ReplyEntity> getReply();
}

class MainRepository implements IMainRepository {
  final IMainRemoteDatasource mainRemoteDatasource;

  MainRepository({
    required this.mainRemoteDatasource,
  });

  @override
  Future<ReplyEntity> getReply() async {
    try {
      final reply = await mainRemoteDatasource.getReply();
      return reply;
    } catch (_, __) {
      rethrow;
    }
  }
}
