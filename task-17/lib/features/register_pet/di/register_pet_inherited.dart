import 'package:flutter/material.dart';

import 'package:surf_flutter_courses_template/features/register_pet/state_manager/register_pet_controller.dart';

class RegisterPetInherited extends InheritedWidget {
  const RegisterPetInherited({
    super.key,
    required this.registerPetController,
    required super.child,
  });

  final RegisterPetController registerPetController;

  static RegisterPetController? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<RegisterPetInherited>()
        ?.registerPetController;
  }

  static RegisterPetController of(BuildContext context) {
    final RegisterPetController? result = maybeOf(context);
    assert(result != null, 'No MyThemeInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(RegisterPetInherited oldWidget) {
    return false;
  }
}
