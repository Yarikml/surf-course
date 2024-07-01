import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/utils/validators/field_validator.dart';

class EmailValidator extends FieldValidator<TextEditingValue> {
  EmailValidator(
    super.dataSource,
  );

  @override
  String? getValidationError(TextEditingValue? value) {
    final text = value?.text.trim();
    if (text == null || text.isEmpty) {
      return 'Заполните поле';
    }
    const pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regex = RegExp(pattern);
    if (!regex.hasMatch(text)) {
      return 'Введите корректный адрес электронной почты';
    }
    return null;
  }
}
