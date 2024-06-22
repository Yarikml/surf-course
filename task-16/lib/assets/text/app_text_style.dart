import 'package:flutter/material.dart';

const _double18 = 18.0;

/// App text style.
enum AppTextStyle {
  bold18Accent(
    TextStyle(
      fontSize: _double18,
      fontWeight: FontWeight.bold,
      color: Color(0xFF222222),
    ),
  ),
  bold18(
    TextStyle(
      fontSize: _double18,
      fontWeight: FontWeight.bold,
      color: Color(0xFFBFBFBF),
    ),
  );

  final TextStyle value;

  const AppTextStyle(this.value);
}
