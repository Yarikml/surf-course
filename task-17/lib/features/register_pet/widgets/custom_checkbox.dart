import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/features/register_pet/widgets/ill_list.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    super.key,
    required this.isChecked,
    required this.label,
    required this.onChange,
    required this.fieldBuilder,
  });

  final bool isChecked;
  final String label;
  final Function(bool) onChange;
  final TextFieldBuilder fieldBuilder;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                value = !value;
              });
              widget.onChange(value);
            },
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: widget.isChecked
                        ? AppColorScheme.of(context).primary
                        : AppColorScheme.of(context).onScaffoldBackground,
                  ),
                  child: widget.isChecked
                      ? Icon(
                          Icons.check,
                          size: 15,
                          weight: 20,
                          color:
                              AppColorScheme.of(context).onScaffoldBackground,
                        )
                      : null,
                ),
                Text(
                  widget.label,
                  style: AppTextScheme.of(context).regular16,
                ),
              ],
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child:
                widget.isChecked ? widget.fieldBuilder(context) : Container(),
          ),
        ],
      ),
    );
  }
}
