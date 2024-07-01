import 'package:flutter/cupertino.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';

extension BuildContextColorScheme on BuildContext {
  AppColorScheme get colorScheme => AppColorScheme.of(this);
}
