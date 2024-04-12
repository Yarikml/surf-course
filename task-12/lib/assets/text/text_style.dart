import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_pallete.dart';

/// Перечисление текстовых стилей приложения
enum AppTextStyle {
  regular10(
    TextStyle(
      fontSize: 10,
      height: 1.6,
      fontWeight: FontWeight.normal,
      color: ColorPalette.darkBlue,
    ),
  ),
  regular12(
    TextStyle(
      fontSize: 12,
      color: ColorPalette.spaceCadet,
      height: 1.6,
      fontWeight: FontWeight.normal,
    ),
  ),
  regular12SaleOldPrice(
    TextStyle(
      fontSize: 12,
      color: ColorPalette.philippineSilver,
      decoration: TextDecoration.lineThrough,
      fontWeight: FontWeight.normal,
    ),
  ),
  regular16(
    TextStyle(
      fontSize: 16,
      color: ColorPalette.spaceCadet,
      fontWeight: FontWeight.normal,
    ),
  ),
  semiBold10(
    TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      color: ColorPalette.darkBlue,
    ),
  ),
  semiBold10Accent(
    TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      color: ColorPalette.green,
    ),
  ),
  bold10(
    TextStyle(
      fontSize: 10,
      height: 1.6,
      fontWeight: FontWeight.bold,
      color: ColorPalette.darkBlue,
    ),
  ),
  bold12SaleNewPrice(
    TextStyle(
      fontSize: 12,
      color: ColorPalette.red,
      fontWeight: FontWeight.bold,
    ),
  ),
  bold12(
    TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: ColorPalette.spaceCadet,
    ),
  ),
  bold16(
    TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: ColorPalette.spaceCadet,
    ),
  ),
  bold18(
    TextStyle(
      fontSize: 18,
      height: 2.4,
      color: ColorPalette.spaceCadet,
      fontWeight: FontWeight.bold,
    ),
  );

  final TextStyle value;

  const AppTextStyle(this.value);
}
