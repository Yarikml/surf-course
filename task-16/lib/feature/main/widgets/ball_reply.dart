import 'package:flutter/material.dart';

import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/feature/main/di/reply_inherited.dart';

class BallReply extends StatelessWidget {
  const BallReply({
    super.key,
    required this.onAnimationReset,
  });

  final VoidCallback onAnimationReset;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);
    final replyInherited = ReplyInherited.of(context);
    return GestureDetector(
      onTap: onAnimationReset,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.scaffoldGradientEnd.withOpacity(0.7),
        ),
        child: Center(
          child: Text(
            replyInherited.reply.value!.reading,
            style: textScheme.regular56.copyWith(
              color: colorScheme.accentedTextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
