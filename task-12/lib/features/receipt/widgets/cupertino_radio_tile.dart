import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';

import '../../../assets/text/text_extension.dart';

class CupertinoRadioTile<T> extends StatelessWidget {
  const CupertinoRadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.onChanged,
  });

  final String label;
  final T value;
  final T groupValue;
  final Function(T? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CupertinoRadio<T>(
              activeColor: AppColorScheme.of(context).primary,
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
          ),
          Text(
            label,
            style: AppTextTheme.of(context).regular16,
          )
        ],
      ),
    );
  }
}
