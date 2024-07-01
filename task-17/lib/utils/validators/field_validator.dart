import 'package:flutter/foundation.dart';

abstract class FieldValidator<T> {
  final ValueNotifier<T> dataSource;
  final ValueNotifier<String?> _errorNotifier = ValueNotifier(null);
  final bool isRequired;
  var _hasInteracted = false;

  ValueListenable<String?> get error => _errorNotifier;

  FieldValidator(
    this.dataSource, {
    this.isRequired = true,
  });

  bool get valid {
    if (isRequired && !_hasInteracted) return false;
    return _errorNotifier.value == null;
  }

  void validate() {
    _hasInteracted = true;
    _errorNotifier.value = getValidationError(dataSource.value);
  }

  void dispose() {
    _errorNotifier.dispose();
  }

  String? getValidationError(T? value);
}
