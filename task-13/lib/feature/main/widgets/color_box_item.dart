import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surf_flutter_courses_template/core/extensions.dart';
import 'package:surf_flutter_courses_template/feature/main/model/color_entity/color_entity.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/pages/color_details_page.dart';
import 'package:surf_flutter_courses_template/uikit/text/app_text_scheme.dart';

class ColorBoxItem extends StatefulWidget {
  const ColorBoxItem({
    super.key,
    required this.color,
  });

  final ColorEntity color;

  @override
  State<ColorBoxItem> createState() => _ColorBoxItemState();
}

class _ColorBoxItemState extends State<ColorBoxItem> {
  void onLongPress() async {
    await Clipboard.setData(ClipboardData(text: widget.color.value!));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        width: 173,
        padding: EdgeInsets.all(24),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        content: Text('Hex  скопирован'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ColorDetailsPage(
            color: widget.color,
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
              color: widget.color.toColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              widget.color.name,
              style: AppTextScheme.of(context).regular12,
            ),
          ),
          Text(
            widget.color.value.toString(),
            style: AppTextScheme.of(context).regular12,
          ),
        ],
      ),
    );
  }
}
