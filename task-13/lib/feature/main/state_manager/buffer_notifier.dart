import 'package:flutter/foundation.dart';

class BufferNotifier extends ValueNotifier<String?> {
  BufferNotifier(super.value);

  void setBufferText(String? text) {
    value = text;
  }

  bool isTextBuffered(String? text) {
    return value == text;
  }
}
