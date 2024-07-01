import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/utils/enums/ill_type.dart';
import 'package:surf_flutter_courses_template/utils/extensions/build_context_x.dart';
import 'custom_checkbox.dart';

typedef IllChangeCallback = Function(bool, IllType);
typedef TextFieldBuilder = Widget Function(BuildContext);

class IllList extends StatelessWidget {
  const IllList({
    super.key,
    required this.currentIllType,
    required this.onChange,
    required this.fieldBuilder,
    required this.isGroupEnabled,
  });

  final IllType? currentIllType;
  final IllChangeCallback onChange;
  final TextFieldBuilder fieldBuilder;
  final bool isGroupEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            context.localization.vaccineFrom,
            style: context.textScheme.semiBold24,
          ),
        ),
        ...IllType.values
            .map(
              (item) => CustomCheckbox(
                isChecked: currentIllType == item,
                label: item.name,
                onChange: (bool value) {
                  onChange(value, item);
                },
                fieldBuilder: fieldBuilder,
                isEnabled: isGroupEnabled,
              ),
            )
            .toList()
      ],
    );
  }
}
