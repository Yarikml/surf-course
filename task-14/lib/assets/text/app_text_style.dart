import 'package:flutter/material.dart';

const _double12 = 12.0;


/// App text style.
enum AppTextStyle {
  regular12(TextStyle(
    fontSize: _double12,
    fontWeight: FontWeight.w400,
    color: Color(0xFF252838),
  ));

  final TextStyle value;

  const AppTextStyle(this.value);
}
