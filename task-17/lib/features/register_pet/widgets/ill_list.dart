import 'package:flutter/material.dart';

import '../../../assets/text/app_text_scheme.dart';
import '../../../utils/enums/ill_type.dart';
import 'custom_checkbox.dart';

typedef IllChangeCallback = Function(bool, IllType);

class IllList extends StatelessWidget {
  const IllList({
    super.key,
    required this.currentIllType,
    required this.onChange,
  });

  final IllType? currentIllType;
  final IllChangeCallback onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Сделаны прививки от:',
          style: AppTextScheme.of(context).semiBold24,
        ),
        ...IllType.values
            .map(
              (item) => CustomCheckbox(
                isChecked: currentIllType == item,
                label: item.name,
                onChange: (bool value) {
                  onChange(value, item);
                },
              ),
            )
            .toList()
      ],
    );
  }
}
