import 'package:flutter/foundation.dart';

///Value notifier for holding buffer value
class BufferNotifier extends ValueNotifier<String?> {
  BufferNotifier(super.value);

  void setBufferText(String? text) {
    value = text;
  }

  bool isTextBuffered(String? text) {
    return value == text;
  }
}
