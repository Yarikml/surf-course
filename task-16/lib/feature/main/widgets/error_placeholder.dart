import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';

class ErrorPlaceholder extends StatelessWidget {
  const ErrorPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);
    final localization = AppLocalizations.of(context)!;
    return Center(
      child: Text(
        localization.error,
        style: textScheme.regular56.copyWith(
          color: colorScheme.errorTextColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
