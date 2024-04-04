import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../assets/colors/color_scheme.dart';
import '../../../assets/res/resources.dart';

class ProductPhotoShimmer extends StatelessWidget {
  const ProductPhotoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColorScheme.of(context).onBackground,
      ),
      width: 68,
      height: 68,
      child: SvgPicture.asset(SvgIcons.forkIcon),
    );
  }
}
