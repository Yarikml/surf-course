import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/utils/enums/validation_strategy.dart';
import 'package:surf_flutter_courses_template/utils/extensions/build_context_x.dart';
import 'package:surf_flutter_courses_template/utils/validators/field_validator.dart';

class ValidatableTextField extends StatefulWidget {
  const ValidatableTextField({
    super.key,
    required this.validator,
    required this.controller,
    required this.onValidateForm,
    this.validationStrategy = ValidationStrategy.onUnFocus,
    required this.label,
    this.margin,
    this.onTap,
    required this.readOnly,
  });

  final FieldValidator validator;
  final TextEditingController controller;
  final ValidationStrategy? validationStrategy;
  final VoidCallback onValidateForm;
  final EdgeInsets? margin;
  final bool readOnly;
  final String label;
  final VoidCallback? onTap;

  @override
  State<ValidatableTextField> createState() => _ValidatableTextFieldState();
}

class _ValidatableTextFieldState extends State<ValidatableTextField> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.validationStrategy == ValidationStrategy.onUnFocus) {
      _focusNode.addListener(_onFocusChange);
    } else {
      widget.controller.addListener(_onChange);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    widget.controller.removeListener(_onChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      widget.validator.validate();
      widget.onValidateForm();
    }
  }

  void _onChange() {
    if (widget.controller.text.isNotEmpty) {
      widget.validator.validate();
      widget.onValidateForm();
    }
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
                color: context.colorScheme.onScaffoldBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: widget.controller,
                focusNode: _focusNode,
                readOnly: widget.readOnly,
                onTap: widget.onTap,
                cursorHeight: 18,
                style: context.textScheme.regular16.copyWith(
                  color: error != null ? context.colorScheme.error : null,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  labelText: widget.label,
                ),
              ),
            ),
            error != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      error,
                      style: context.textScheme.regular12.copyWith(
                        color: context.colorScheme.error,
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
