import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surf_flutter_courses_template/utils/validators/field_validator.dart';

class DateValidator extends FieldValidator<TextEditingValue> {
  DateValidator(
    super.dataSource,
  );

  @override
  String? getValidationError(TextEditingValue? value) {
    final text = value?.text;
    if (text == null || text.isEmpty) {
      return 'Заполните поле';
    }
    DateFormat format = DateFormat('dd.MM.yyyy');
    try {
      format.parseStrict(text);
    } on FormatException {
      return 'Укажите дату дд/мм/гггг';
    }
    return null;
  }
}
