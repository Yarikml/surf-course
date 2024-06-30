import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/utils/validators/field_validator.dart';

class ValidatableTextField extends StatefulWidget {
  const ValidatableTextField({
    super.key,
    required this.validator,
    required this.controller,
    required this.label,
    this.margin,
  });

  final FieldValidator validator;
  final TextEditingController controller;
  final EdgeInsets? margin;
  final String label;

  @override
  State<ValidatableTextField> createState() => _ValidatableTextFieldState();
}

class _ValidatableTextFieldState extends State<ValidatableTextField> {
  late final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void onFocusChange() {
    if (!_focusNode.hasFocus) {
      widget.validator();
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.validator.error,
      builder: (_, error, __) => Padding(
        padding: widget.margin ?? const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 56,
              decoration: BoxDecoration(
                color: AppColorScheme.of(context).onScaffoldBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: widget.controller,
                focusNode: _focusNode,
                cursorHeight: 18,
                style: AppTextScheme.of(context).regular16.copyWith(
                      color: error != null
                          ? AppColorScheme.of(context).error
                          : null,
                    ),
                decoration: InputDecoration(
                  labelText: widget.label,
                ),
              ),
            ),
            error != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      error,
                      style: AppTextScheme.of(context).regular12.copyWith(
                            color: AppColorScheme.of(context).error,
                          ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
