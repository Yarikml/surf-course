import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/utils/validators/field_validator.dart';

class NameValidator extends FieldValidator<TextEditingValue> {
  NameValidator(super.dataSource);

  @override
  String? getValidationError(TextEditingValue? value) {
    final text = value?.text.trim();
    if (text == null || text.isEmpty) {
      return 'Заполните поле';
    }
    if (text.length < 3 || text.length > 20) {
      return 'Укажите имя питомца от 3 до 20 символов';
    }
    return null;
  }
}
