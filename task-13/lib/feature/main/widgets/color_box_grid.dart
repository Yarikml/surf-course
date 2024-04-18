import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/core/extensions.dart';

import '../model/color_entity/color_entity.dart';
import '../state_manager/buffer_notifier.dart';
import 'color_box_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ColorBoxGrid extends StatefulWidget {
  const ColorBoxGrid({
    super.key,
    required this.colors,
  });

  final List<ColorEntity> colors;

  @override
  State<ColorBoxGrid> createState() => _ColorBoxGridState();
}

class _ColorBoxGridState extends State<ColorBoxGrid> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onResume: onResume,
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 140,
          crossAxisCount: 3,
          mainAxisSpacing: 40,
          crossAxisSpacing: 22,
        ),
        itemBuilder: (context, index) => ColorBoxItem(
          color: widget.colors.filledColors[index],
          onAddColorToBuffer: onAddValueToBuffer,
        ),
        itemCount: widget.colors.filledColors.length,
      ),
    );
  }

  void onResume() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    if (context.mounted) {
      final bufferedValue = context.read<BufferNotifier>().value;
      if (clipboardData != null && clipboardData.text != bufferedValue) {
        context.read<BufferNotifier>().setBufferText(clipboardData.text);
      }
    }
  }

  void onAddValueToBuffer(String value) async {
    await Clipboard.setData(
      ClipboardData(text: value),
    );
    if (context.mounted) {
      context.read<BufferNotifier>().setBufferText(value);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          width: 173,
          padding: const EdgeInsets.all(24),
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          content: Text(AppLocalizations.of(context)!.snackBarTextHexCopied),
        ),
      );
    }
  }
}
