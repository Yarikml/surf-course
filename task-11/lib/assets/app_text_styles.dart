import 'package:flutter/material.dart';

enum AppTextStyles {
  residential700(
    TextStyle(
      fontFamily: 'Residential',
      fontWeight: FontWeight.w700,
    ),
  ),
  healthy400(
    TextStyle(
      fontFamily: 'HealthyFood',
      fontSize: 20,
    ),
  );

  final TextStyle value;

  const AppTextStyles(this.value);
}
