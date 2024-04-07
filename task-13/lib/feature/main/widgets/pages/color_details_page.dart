import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/feature/main/model/color_entity/color_entity.dart';

class ColorDetailsPage extends StatelessWidget {
  const ColorDetailsPage({
    super.key,
    required this.color,
  });

  final ColorEntity color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          expandedHeight: 406,
        )
      ],
    ));
  }
}
