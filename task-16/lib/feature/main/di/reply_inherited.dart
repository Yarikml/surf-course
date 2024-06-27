import 'package:flutter/material.dart';

import 'package:surf_flutter_courses_template/feature/main/state_manager/reply_controller.dart';

class ReplyInherited extends InheritedWidget {
  const ReplyInherited({
    super.key,
    required this.themeController,
    required super.child,
  });

  final ReplyController themeController;

  static ReplyController? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ReplyInherited>()
        ?.themeController;
  }

  static ReplyController of(BuildContext context) {
    final ReplyController? result = maybeOf(context);
    assert(result != null, 'No MyThemeInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ReplyInherited oldWidget) {
    return false;
  }
}
