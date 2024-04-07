import 'package:flutter/material.dart';

class ColorPartItem extends StatelessWidget {
  const ColorPartItem({
    super.key,
    required this.text,
    required this.code,
  });

  final String text;
  final String code;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 3,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              Text(code),
            ],
          ),
        ),
      ),
    );
  }
}
