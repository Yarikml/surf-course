import 'package:flutter/material.dart';

import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 128,
        height: 128,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          color: AppColorScheme.of(context).primary,
        ),
      ),
    );
  }
}
