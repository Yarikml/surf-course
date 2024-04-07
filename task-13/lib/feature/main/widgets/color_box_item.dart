import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter_courses_template/assets/svg_icons.dart';
import 'package:surf_flutter_courses_template/core/extensions.dart';
import 'package:surf_flutter_courses_template/feature/main/model/color_entity/color_entity.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/pages/color_details_page.dart';
import 'package:surf_flutter_courses_template/uikit/text/app_text_scheme.dart';

class ColorBoxItem extends StatelessWidget {
  const ColorBoxItem({
    super.key,
    required this.color,
    required this.bufferedColor,
    required this.onAddColorToBuffer,
  });

  final ColorEntity color;
  final ColorEntity? bufferedColor;
  final Function(ColorEntity color) onAddColorToBuffer;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => onAddColorToBuffer(color),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ColorDetailsPage(
            color: color,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: color.toColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              color.name,
              style: AppTextScheme.of(context).regular12,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                color.value.toString(),
                style: AppTextScheme.of(context).regular12,
              ),
              color == bufferedColor
                  ? Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: SvgPicture.asset(
                        SvgIcons.copyIcon,
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
