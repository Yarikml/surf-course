import 'package:flutter/material.dart';

enum AppTextStyle {
  regular12(
    TextStyle(fontSize: 12, fontFamily: 'Sora', fontWeight: FontWeight.normal),
  );

  final TextStyle value;

  const AppTextStyle(this.value);
}
