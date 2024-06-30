import 'package:flutter/foundation.dart';

abstract class FieldValidator<T> {
  final ValueNotifier<T> dataSource;
  final ValueNotifier<String?> _errorNotifier = ValueNotifier(null);

  ValueListenable<String?> get error => _errorNotifier;

  FieldValidator(
    this.dataSource,
  );

  bool get valid => _errorNotifier.value == null;

  void call() {
    _errorNotifier.value = validate(dataSource.value);
  }

  void dispose() {
    _errorNotifier.dispose();
  }

  String? validate(T? value);
}
