import 'package:flutter/material.dart';

import 'package:surf_flutter_courses_template/assets/resources/resources.dart';
import 'package:surf_flutter_courses_template/feature/main/di/reply_inherited.dart';

class MagicBall extends StatelessWidget {
  const MagicBall({
    super.key,
    required this.scale,
    required this.onBallTap,
  });

  final double scale;

  final VoidCallback onBallTap;

  @override
  Widget build(BuildContext context) {
    final replyInherited = ReplyInherited.of(context);
    return GestureDetector(
      onTap: onBallTap,
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutBack,
        onEnd: () {
          replyInherited.getReply();
        },
        child: Image.asset(Images.ball),
      ),
    );
  }
}
