import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/core/extensions.dart';
import 'package:surf_flutter_courses_template/feature/main/model/color_entity/color_entity.dart';

class ColorBoxItem extends StatelessWidget {
  const ColorBoxItem({
    super.key,
    required this.color,
  });

  final ColorEntity color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          margin: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: HexColor.fromHex(color.value!)),
        ),
        Text(
          color.name,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Text(
          color.value.toString(),
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
