import 'package:flutter/material.dart';

const _double12 = 12.0;
const _double16 = 16.0;

const _double30 = 30.0;

/// App text style.
enum AppTextStyle {
  regular12(TextStyle(
    fontSize: _double12,
    fontWeight: FontWeight.w400,
    height: 12 / 16,
  )),
  regular16(TextStyle(
    fontSize: _double16,
    fontWeight: FontWeight.w400,
    height: 12 / 16,
  )),
  bold30(TextStyle(
    fontSize: _double30,
    fontWeight: FontWeight.w700,
    height: 30 / 34,
  ));

  final TextStyle value;

  const AppTextStyle(this.value);
}
