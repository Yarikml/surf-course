import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/feature/main/model/color_entity/color_entity.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/color_part_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:surf_flutter_courses_template/assets/resources/resources.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/feature/main/state_manager/buffer_notifier.dart';

class ColorDetailsPage extends StatelessWidget {
  const ColorDetailsPage({
    super.key,
    required this.color,
    required this.onAddValueToBuffer,
  });

  final Function(
    String value, {
    bool needSnackbar,
  }) onAddValueToBuffer;

  final ColorEntity color;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextScheme.of(context);
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            expandedHeight: 406,
            collapsedHeight: 56,
            backgroundColor: color.toColor,
          ),
        ],
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  color.name,
                  style: textTheme.bold30,
                ),
              ),
              GestureDetector(
                onTap: () => onAddValueToBuffer(
                  color.hexCode,
                  needSnackbar: false,
                ),
                child: Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Text(
                          localization.hex,
                          style: textTheme.regular16,
                        ),
                        const Spacer(),
                        Text(
                          color.hexCode,
                          style: textTheme.regular16,
                        ),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: context
                                  .watch<BufferNotifier>()
                                  .isTextBuffered(color.hexCode)
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: SvgPicture.asset(
                                    SvgIcons.copyIcon,
                                    width: 16,
                                  ),
                                )
                              : Container(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  ColorPartItem(
                    text: localization.red,
                    code: color.toColor.red.toString(),
                    onAddValueToBuffer: onAddValueToBuffer,
                  ),
                  ColorPartItem(
                    text: localization.green,
                    code: color.toColor.green.toString(),
                    onAddValueToBuffer: onAddValueToBuffer,
                  ),
                  ColorPartItem(
                    text: localization.blue,
                    code: color.toColor.blue.toString(),
                    onAddValueToBuffer: onAddValueToBuffer,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
