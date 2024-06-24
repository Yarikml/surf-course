import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../assets/resources/animations.dart';

class LoadingPlaceholder extends StatelessWidget {
  const LoadingPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(Animations.loader),
    );
  }
}
