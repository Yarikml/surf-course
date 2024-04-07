import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/feature/main/model/color_entity/color_entity.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/color_part_item.dart';
import 'package:surf_flutter_courses_template/uikit/text/app_text_scheme.dart';

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
            pinned: true,
            elevation: 0,
            expandedHeight: 406,
            collapsedHeight: 56,
            backgroundColor: color.toColor,
          ),
        ],
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  color.name,
                  style: AppTextScheme.of(context).bold30,
                ),
              ),
              Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Hex'),
                      Text(color.hexCode),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  ColorPartItem(
                    text: 'Red',
                    code: color.toColor.red.toString(),
                  ),
                  ColorPartItem(
                    text: 'Green',
                    code: color.toColor.green.toString(),
                  ),
                  ColorPartItem(
                    text: 'Blue',
                    code: color.toColor.blue.toString(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
