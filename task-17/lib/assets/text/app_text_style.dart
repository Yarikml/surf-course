import 'package:flutter/material.dart';

const _double16 = 16.0;
const _double12 = 12.0;
const _double18 = 18.0;
const _double24 = 24.0;

/// App text style.
enum AppTextStyle {
  regular12(
    TextStyle(
      fontSize: _double12,
      fontWeight: FontWeight.w400,
      height: 1.6,
    ),
  ),
  regular16(
    TextStyle(
      fontSize: _double16,
      fontWeight: FontWeight.w400,
      height: 1.8,
    ),
  ),
  semiBold18(
    TextStyle(
      fontSize: _double18,
      fontWeight: FontWeight.w500,
    ),
  ),
  semiBold24(
    TextStyle(
      fontSize: _double24,
      fontWeight: FontWeight.w500,
    ),
  );

  final TextStyle value;

  const AppTextStyle(this.value);
}
