import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/features/register_pet/widgets/validatable_text_field.dart';
import 'package:surf_flutter_courses_template/utils/extensions/build_context_x.dart';
import 'package:surf_flutter_courses_template/utils/extensions/date_time_x.dart';
import 'package:surf_flutter_courses_template/utils/validators/field_validator.dart';

import 'package:surf_flutter_courses_template/utils/enums/validation_strategy.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    super.key,
    required this.isChecked,
    required this.label,
    required this.onChange,
    required this.isEnabled,
    required this.controller,
    required this.validator,
    required this.onValidate,
  });

  final bool isChecked;
  final bool isEnabled;
  final String label;
  final TextEditingController controller;
  final FieldValidator validator;
  final Function(bool) onChange;
  final VoidCallback onValidate;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool value = false;

  Future<DateTime?> _showDatePicker(BuildContext context) async {
    final result = await showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(
        const Duration(
          days: 5000,
        ),
      ),
      lastDate: DateTime.now(),
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: widget.isEnabled
                ? () {
                    setState(() {
                      value = !value;
                    });
                    widget.onChange(value);
                  }
                : null,
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: widget.isChecked
                        ? widget.isEnabled
                            ? context.colorScheme.primary
                            : context.colorScheme.primary.withOpacity(0.5)
                        : context.colorScheme.onScaffoldBackground,
                  ),
                  child: widget.isChecked
                      ? Icon(
                          Icons.check,
                          size: 15,
                          weight: 20,
                          color: context.colorScheme.onScaffoldBackground,
                        )
                      : null,
                ),
                Text(
                  widget.label,
                  style: context.textScheme.regular16,
                ),
              ],
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: widget.isChecked
                ? ValidatableTextField(
                    margin: const EdgeInsets.only(top: 8),
                    validationStrategy: ValidationStrategy.onChange,
                    onTap: widget.isEnabled
                        ? () async {
                            final result = await _showDatePicker(context);
                            if (result != null) {
                              widget.controller.text = result.toFormattedString;
                            }
                          }
                        : null,
                    validator: widget.validator,
                    controller: widget.controller,
                    label: context.localization.petLastVaccine,
                    onValidateForm: widget.onValidate,
                    readOnly: true,
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
