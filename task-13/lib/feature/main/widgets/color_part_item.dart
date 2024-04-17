import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/uikit/text/app_text_scheme.dart';

import '../../../assets/svg_icons.dart';
import '../state_manager/buffer_notifier.dart';

class ColorPartItem extends StatelessWidget {
  const ColorPartItem({
    super.key,
    required this.text,
    required this.code,
  });

  final String text;
  final String code;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => context.read<BufferNotifier>().setBufferText(code),
        child: Stack(
          children: [
            Card(
              elevation: 3,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      text,
                      style: AppTextScheme.of(context).regular16,
                    ),
                    Text(
                      code,
                      style: AppTextScheme.of(context).regular16,
                    ),
                  ],
                ),
              ),
            ),
            context.watch<BufferNotifier>().isTextBuffered(code)
                ? Positioned(
                    bottom: 8,
                    right: 10,
                    child: SvgPicture.asset(
                      SvgIcons.copyIcon,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
