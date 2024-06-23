import 'package:flutter/material.dart';

const _double16 = 16.0;
const _double56 = 56.0;

/// App text style.
enum AppTextStyle {
  regular16(
    TextStyle(
      fontSize: _double16,
      fontWeight: FontWeight.w400,
    ),
  ),
  regular56(
    TextStyle(
      fontSize: _double56,
      fontWeight: FontWeight.w400,
    ),
  );

  final TextStyle value;

  const AppTextStyle(this.value);
}
