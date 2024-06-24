import 'package:flutter/material.dart';

import 'package:surf_flutter_courses_template/assets/resources/images.dart';

class MagicBall extends StatelessWidget {
  const MagicBall({
    super.key,
    required this.scale,
    required this.onBallTap,
    required this.onAnimationFinished,
  });

  final double scale;

  final VoidCallback? onBallTap;

  final VoidCallback onAnimationFinished;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBallTap,
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutBack,
        onEnd: onAnimationFinished,
        child: Image.asset(Images.ball),
      ),
    );
  }
}
