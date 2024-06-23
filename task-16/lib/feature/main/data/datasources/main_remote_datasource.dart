import 'package:dio/dio.dart';
import 'package:surf_flutter_courses_template/feature/main/model/reply_entity/reply_entity.dart';

abstract interface class IMainRemoteDatasource {
  Future<ReplyEntity> getReply();
}

class MainRemoteDatasource implements IMainRemoteDatasource {
  MainRemoteDatasource({
    required this.client,
  });

  final Dio client;

  @override
  Future<ReplyEntity> getReply() async {
    try {
      final response = await client.get('https://www.eightballapi.com/api');
      return ReplyEntity.fromJson(response.data);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
