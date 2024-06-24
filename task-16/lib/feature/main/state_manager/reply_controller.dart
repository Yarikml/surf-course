import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:surf_flutter_courses_template/feature/main/data/repositories/main_repository.dart';
import 'package:surf_flutter_courses_template/feature/main/model/reply_entity/reply_entity.dart';

enum ReplyState {
  idle,
  loading,
  success,
  error,
}

class ReplyController {
  final IMainRepository _mainRepository;

  ReplyController({
    required IMainRepository mainRepository,
  }) : _mainRepository = mainRepository;

  late final ValueNotifier<ReplyEntity?> _reply =
      ValueNotifier<ReplyEntity?>(null);

  late final ValueNotifier<ReplyState> _replyState =
      ValueNotifier<ReplyState>(ReplyState.idle);

  ValueListenable<ReplyEntity?> get reply => _reply;

  ValueListenable<ReplyState> get replyState => _replyState;

  Future<void> getReply() async {
    try {
      _replyState.value = ReplyState.loading;
      final reply = await _mainRepository.getReply();
      _reply.value = reply;
      _replyState.value = ReplyState.success;
    } catch (_, __) {
      _replyState.value = ReplyState.error;
    }
  }
}
