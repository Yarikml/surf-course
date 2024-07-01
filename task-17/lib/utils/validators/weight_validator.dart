import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/utils/validators/field_validator.dart';

class WeightValidator extends FieldValidator<TextEditingValue> {
  WeightValidator(super.dataSource);

  @override
  String? getValidationError(TextEditingValue? value) {
    final text = value?.text;
    if (text == null || text.isEmpty) {
      return 'Заполните поле';
    }

    final weight = int.tryParse(text.trim());
    if (weight == null || weight <= 0) {
      return 'Укажите вес, больше 0 кг';
    }
    return null;
  }
}
