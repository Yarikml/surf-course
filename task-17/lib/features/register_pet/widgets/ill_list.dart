import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/utils/enums/ill_type.dart';
import 'package:surf_flutter_courses_template/utils/extensions/build_context_x.dart';
import 'custom_checkbox.dart';

typedef IllChangeCallback = Function(bool, IllType);

class IllList extends StatelessWidget {
  const IllList({
    super.key,
    required this.illVaccines,
    required this.onChange,
    required this.isGroupEnabled,
    required this.getIllVaccineValidatorByType,
    required this.getIllVaccineControllerByType,
    required this.onValidate,
  });

  final List<IllType> illVaccines;
  final IllChangeCallback onChange;
  final bool isGroupEnabled;
  final Function(IllType) getIllVaccineValidatorByType;
  final Function(IllType) getIllVaccineControllerByType;
  final VoidCallback onValidate;

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
                isChecked: illVaccines.contains(item),
                label: item.name,
                onChange: (bool value) {
                  onChange(value, item);
                },
                isEnabled: isGroupEnabled,
                controller: getIllVaccineControllerByType(item),
                validator: getIllVaccineValidatorByType(item),
                onValidate: onValidate,
              ),
            )
            .toList()
      ],
    );
  }
}
