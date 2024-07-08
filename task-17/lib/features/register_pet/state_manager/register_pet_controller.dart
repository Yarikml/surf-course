import 'package:flutter/foundation.dart';

enum RegisterPetState {
  idle,
  loading,
  success,
  error,
}

class RegisterPetController {
  RegisterPetController();

  late final ValueNotifier<RegisterPetState> _registerState =
      ValueNotifier<RegisterPetState>(RegisterPetState.idle);

  ValueListenable<RegisterPetState> get registerState => _registerState;

  Future<void> registerPet() async {
    try {
      if (_registerState.value == RegisterPetState.loading) return;
      _registerState.value = RegisterPetState.loading;
      await Future.delayed(
        const Duration(seconds: 2),
      );
      _registerState.value = RegisterPetState.success;
    } catch (_, __) {
      _registerState.value = RegisterPetState.error;
    }
  }
}
