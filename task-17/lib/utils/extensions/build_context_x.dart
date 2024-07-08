import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextX on BuildContext {
  AppColorScheme get colorScheme => AppColorScheme.of(this);

  AppTextScheme get textScheme => AppTextScheme.of(this);

  AppLocalizations get localization => AppLocalizations.of(this)!;
}
