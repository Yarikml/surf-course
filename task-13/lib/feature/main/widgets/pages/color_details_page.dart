import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/feature/main/model/color_entity/color_entity.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/color_part_item.dart';
import 'package:surf_flutter_courses_template/uikit/text/app_text_scheme.dart';

import '../../../../assets/svg_icons.dart';
import '../../state_manager/buffer_notifier.dart';

class ColorDetailsPage extends StatefulWidget {
  const ColorDetailsPage({
    super.key,
    required this.color,
  });

  final ColorEntity color;

  @override
  State<ColorDetailsPage> createState() => _ColorDetailsPageState();
}

class _ColorDetailsPageState extends State<ColorDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            expandedHeight: 406,
            collapsedHeight: 56,
            backgroundColor: widget.color.toColor,
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
                  widget.color.name,
                  style: AppTextScheme.of(context).bold30,
                ),
              ),
              GestureDetector(
                onTap: () => context
                    .read<BufferNotifier>()
                    .setBufferText(widget.color.hexCode),
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
                        const Text('Hex'),
                        const Spacer(),
                        Text(
                          widget.color.hexCode,
                          style: AppTextScheme.of(context).regular16,
                        ),
                        context
                                .watch<BufferNotifier>()
                                .isTextBuffered(widget.color.hexCode)
                            ? Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: SvgPicture.asset(
                                  SvgIcons.copyIcon,
                                  width: 16,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  ColorPartItem(
                    text: 'Red',
                    code: widget.color.toColor.red.toString(),
                  ),
                  ColorPartItem(
                    text: 'Green',
                    code: widget.color.toColor.green.toString(),
                  ),
                  ColorPartItem(
                    text: 'Blue',
                    code: widget.color.toColor.blue.toString(),
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
