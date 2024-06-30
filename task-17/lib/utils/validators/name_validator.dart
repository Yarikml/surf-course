import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/utils/validators/field_validator.dart';

class NameValidator extends FieldValidator<TextEditingValue> {
  NameValidator(super.dataSource);

  @override
  String? validate(TextEditingValue? value) {
    final text = value?.text;
    if (text == null || text.isEmpty) {
      return 'Заполните поле';
    }
    final trimmedText = text.trim();
    if (trimmedText.length < 3 || trimmedText.length > 20) {
      return 'Укажите имя питомца от 3 до 20 символов';
    }
    return null;
  }
}
