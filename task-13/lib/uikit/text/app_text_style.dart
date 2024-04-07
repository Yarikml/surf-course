import 'package:flutter/material.dart';

const _double12 = 12.0;
const _double16 = 16.0;

const _double30 = 30.0;

/// App text style.
enum AppTextStyle {
  regular12(TextStyle(
    fontSize: _double12,
    fontWeight: FontWeight.w400,
    color: Color(0xFF252838),
  )),
  regular16(TextStyle(
    fontSize: _double16,
    fontWeight: FontWeight.w400,
    color: Color(0xFF252838),
  )),
  bold30(TextStyle(
    fontSize: _double30,
    fontWeight: FontWeight.w700,
    color: Color(0xFF252838),
  ));

  final TextStyle value;

  const AppTextStyle(this.value);
}
