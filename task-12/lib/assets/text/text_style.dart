import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_pallete.dart';

enum AppTextStyle {
  regular10(
    TextStyle(
      fontSize: 10,
      height: 1.6,
      fontFamily: 'Sora',
      fontWeight: FontWeight.normal,
      color: Color(0xFF60607B),
    ),
  ),
  regular12(
    TextStyle(
      fontSize: 12,
      fontFamily: 'Sora',
      color: Color(0xFF252849),
      height: 1.6,
      fontWeight: FontWeight.normal,
    ),
  ),
  regular12SaleOldPrice(
    TextStyle(
      fontSize: 12,
      fontFamily: 'Sora',
      color: Color(0xFFB5B5B5),
      decoration: TextDecoration.lineThrough,
      fontWeight: FontWeight.normal,
    ),
  ),
  regular16(
    TextStyle(
      fontSize: 16,
      fontFamily: 'Sora',
      color: Color(0xFF252849),
      fontWeight: FontWeight.normal,
    ),
  ),
  semiBold10(
    TextStyle(
      fontSize: 10,
      fontFamily: 'Sora',
      fontWeight: FontWeight.w600,
      color: Color(0xFF60607B),
    ),
  ),
  semiBold10Accent(
    TextStyle(
      fontSize: 10,
      fontFamily: 'Sora',
      fontWeight: FontWeight.w600,
      color: ColorPalette.green,
    ),
  ),
  bold10(
    TextStyle(
      fontSize: 10,
      height: 1.6,
      fontFamily: 'Sora',
      fontWeight: FontWeight.bold,
      color: Color(0xFF60607B),
    ),
  ),
  bold12SaleNewPrice(
    TextStyle(
      fontSize: 12,
      fontFamily: 'Sora',
      color: Color(0xFFFF0000),
      fontWeight: FontWeight.bold,
    ),
  ),
  bold12(
    TextStyle(
      fontSize: 12,
      fontFamily: 'Sora',
      fontWeight: FontWeight.bold,
      color: Color(0xFF252849),
    ),
  ),
  bold16(
    TextStyle(
      fontSize: 16,
      fontFamily: 'Sora',
      fontWeight: FontWeight.bold,
      color: Color(0xFF252849),
    ),
  ),
  bold18(
    TextStyle(
      fontSize: 18,
      height: 2.4,
      fontFamily: 'Sora',
      color: Color(0xFF252849),
      fontWeight: FontWeight.bold,
    ),
  );

  final TextStyle value;

  const AppTextStyle(this.value);
}
