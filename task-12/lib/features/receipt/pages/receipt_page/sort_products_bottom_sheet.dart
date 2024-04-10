import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/text_extension.dart';

import 'package:surf_flutter_courses_template/features/receipt/pages/receipt_page/receipt_page.dart';

import '../../widgets/cupertino_radio_tile.dart';

class SortProductsBottomSheet extends StatefulWidget {
  const SortProductsBottomSheet({
    super.key,
    required this.currentSortSubType,
  });

  final SortSubType currentSortSubType;

  @override
  State<SortProductsBottomSheet> createState() =>
      _SortProductsBottomSheetState();
}

class _SortProductsBottomSheetState extends State<SortProductsBottomSheet> {
  late SortSubType currentSortSubType;

  @override
  void initState() {
    currentSortSubType = widget.currentSortSubType;
    super.initState();
  }

  void onSortTypeChanged(SortSubType? value) {
    setState(() {
      currentSortSubType = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Сортировка',
                style: AppTextTheme.of(context).bold18,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(currentSortSubType),
                child: const Icon(Icons.close),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final categoryName = SortType.values[index].value;
              final categoryItems = SortSubType.values
                  .where((element) => element.type == SortType.values[index]);
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  index > 0
                      ? Text(
                          categoryName,
                          style: AppTextTheme.of(context).regular12,
                        )
                      : Container(),
                  ...categoryItems
                      .map(
                        (item) => CupertinoRadioTile<SortSubType>(
                          value: item,
                          groupValue: currentSortSubType,
                          label: item.name,
                          onChanged: onSortTypeChanged,
                        ),
                      )
                      .toList(),
                  index < SortType.values.length - 1
                      ? Divider(
                          thickness: 1,
                        )
                      : Container(),
                ],
              );
            },
            itemCount: SortType.values.length,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: AppTextTheme.of(context).bold16,
                backgroundColor: AppColorScheme.of(context).primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size.fromHeight(48),
              ),
              onPressed: () {
                Navigator.of(context).pop(currentSortSubType);
              },
              child: const Text('Готово'),
            ),
          ),
        ],
      ),
    );
  }
}
