import 'package:flutter/material.dart';

import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';

class PhotoListAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PhotoListAppbar({
    super.key,
    required this.index,
    required this.maxIndex,
  });

  final double index;
  final int maxIndex;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: RichText(
            text: TextSpan(
              text: index.toStringAsFixed(0),
              style: AppTextScheme.of(context).bold18Accent,
              children: [
                TextSpan(
                  text: '/$maxIndex',
                  style: AppTextScheme.of(context).bold18,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
