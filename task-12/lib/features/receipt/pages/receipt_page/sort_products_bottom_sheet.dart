import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/text_extension.dart';
import 'package:surf_flutter_courses_template/features/receipt/pages/receipt_page/receipt_page.dart';
import 'package:surf_flutter_courses_template/features/receipt/widgets/cupertino_radio_tile.dart';

class SortProductsBottomSheet extends StatefulWidget {
  const SortProductsBottomSheet({
    super.key,
    required this.currentSortType,
  });

  final SortType currentSortType;

  @override
  State<SortProductsBottomSheet> createState() =>
      _SortProductsBottomSheetState();
}

class _SortProductsBottomSheetState extends State<SortProductsBottomSheet> {
  late SortType currentSortType;

  @override
  void initState() {
    currentSortType = widget.currentSortType;
    super.initState();
  }

  void onSortTypeChanged(SortType? value) {
    setState(() {
      currentSortType = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520,
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
                onTap: () => Navigator.of(context).pop(currentSortType),
                child: const Icon(Icons.close),
              ),
            ],
          ),
          CupertinoRadioTile<SortType>(
            value: SortType.idle,
            groupValue: currentSortType,
            label: SortType.idle.value,
            onChanged: onSortTypeChanged,
          ),
          const Divider(
            thickness: 1,
          ),
          Text(
            'По имени',
            style: AppTextTheme.of(context).regular12,
          ),
          CupertinoRadioTile<SortType>(
            value: SortType.byNameFromAToZ,
            groupValue: currentSortType,
            label: SortType.byNameFromAToZ.value,
            onChanged: onSortTypeChanged,
          ),
          CupertinoRadioTile<SortType>(
            value: SortType.byNameFromZToA,
            groupValue: currentSortType,
            label: SortType.byNameFromZToA.value,
            onChanged: onSortTypeChanged,
          ),
          const Divider(
            thickness: 1,
          ),
          Text(
            'По цене',
            style: AppTextTheme.of(context).regular12,
          ),
          CupertinoRadioTile<SortType>(
            value: SortType.byPriceIncrease,
            groupValue: currentSortType,
            label: SortType.byPriceIncrease.value,
            onChanged: onSortTypeChanged,
          ),
          CupertinoRadioTile<SortType>(
            value: SortType.byPriceDecrease,
            groupValue: currentSortType,
            label: SortType.byPriceDecrease.value,
            onChanged: onSortTypeChanged,
          ),
          const Divider(
            thickness: 1,
          ),
          Text(
            'По типу',
            style: AppTextTheme.of(context).regular12,
          ),
          CupertinoRadioTile<SortType>(
            value: SortType.byTypeFromAToZ,
            groupValue: currentSortType,
            label: SortType.byTypeFromAToZ.value,
            onChanged: onSortTypeChanged,
          ),
          CupertinoRadioTile<SortType>(
            value: SortType.byTypeFromZToA,
            groupValue: currentSortType,
            label: SortType.byTypeFromZToA.value,
            onChanged: onSortTypeChanged,
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
                Navigator.of(context).pop(currentSortType);
              },
              child: const Text('Готово'),
            ),
          ),
        ],
      ),
    );
  }
}
