import 'package:flutter/material.dart';

import '../../../assets/colors/color_scheme.dart';
import '../../../assets/text/app_text_scheme.dart';

class InfoFieldItem extends StatelessWidget {
  const InfoFieldItem({
    super.key,
    this.hasArrow = false,
    required this.text,
    required this.label,
  });

  final bool hasArrow;
  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          color: AppColorScheme.of(context).onBackground,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextScheme.of(context).regular14Label,
              ),
              Text(
                text,
                style: AppTextScheme.of(context).regular14,
              ),
            ],
          ),
          hasArrow ? const Icon(Icons.chevron_right) : Container(),
        ],
      ),
    );
  }
}
