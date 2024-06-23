import 'package:flutter/material.dart';

const _double16 = 16.0;

/// App text style.
enum AppTextStyle {
  regular16(
    TextStyle(
      fontSize: _double16,
      fontWeight: FontWeight.w400,
      color: Color(0xFF727272),
    ),
  );

  final TextStyle value;

  const AppTextStyle(this.value);
}
