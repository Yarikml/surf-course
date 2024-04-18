import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/assets/resources/resources.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/feature/main/state_manager/buffer_notifier.dart';

class ColorPartItem extends StatelessWidget {
  const ColorPartItem({
    super.key,
    required this.text,
    required this.code,
    required this.onAddValueToBuffer,
  });

  final String text;
  final String code;

  final Function(
    String value, {
    bool needSnackbar,
  }) onAddValueToBuffer;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextScheme.of(context);

    return Expanded(
      child: GestureDetector(
        onTap: () => onAddValueToBuffer(
          code,
          needSnackbar: false,
        ),
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
                      style: textTheme.regular16,
                    ),
                    Text(
                      code,
                      style: textTheme.regular16,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 10,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: context.watch<BufferNotifier>().isTextBuffered(code)
                    ? SvgPicture.asset(
                        SvgIcons.copyIcon,
                      )
                    : Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
