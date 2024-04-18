import 'package:flutter/material.dart';

class DefaultSnackBar extends SnackBar {
  const DefaultSnackBar({
    super.key,
    required this.text,
    required super.content,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      width: 173,
      padding: const EdgeInsets.all(24),
      behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      content: Text(text),
    );
  }
}
