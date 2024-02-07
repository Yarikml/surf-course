import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/text/text_extension.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'asasdsad',
          style: Theme.of(context).extension<AppTextTheme>()!.regular12,
        ),
      ),
    );
  }
}
