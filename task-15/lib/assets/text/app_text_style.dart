import 'package:flutter/material.dart';

const _double30 = 30.0;

/// App text style.
enum AppTextStyle {
  bold30(TextStyle(
    fontSize: _double30,
    fontWeight: FontWeight.w700,
    color: Color(0xFF252838),
  ));

  final TextStyle value;

  const AppTextStyle(this.value);
}
