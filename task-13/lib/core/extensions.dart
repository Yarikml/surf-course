import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/feature/main/model/color_entity/color_entity.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension ColorFilter on List<ColorEntity> {
  List<ColorEntity> get filledColors =>
      where((element) => element.value != null).toList();
}
