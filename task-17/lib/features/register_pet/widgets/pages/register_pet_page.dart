import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/features/register_pet/di/register_pet_inherited.dart';
import 'package:surf_flutter_courses_template/features/register_pet/state_manager/register_pet_controller.dart';
import 'package:surf_flutter_courses_template/features/register_pet/widgets/ill_list.dart';
import 'package:surf_flutter_courses_template/features/register_pet/widgets/pet_type_list.dart';
import 'package:surf_flutter_courses_template/features/register_pet/widgets/validatable_text_field.dart';
import 'package:surf_flutter_courses_template/utils/enums/ill_type.dart';
import 'package:surf_flutter_courses_template/utils/enums/pet_type.dart';
import 'package:surf_flutter_courses_template/utils/enums/validation_strategy.dart';
import 'package:surf_flutter_courses_template/utils/extensions/build_context_x.dart';
import 'package:surf_flutter_courses_template/utils/extensions/date_time_x.dart';
import 'package:surf_flutter_courses_template/utils/validators/date_validator.dart';
import 'package:surf_flutter_courses_template/utils/validators/email_validator.dart';
import 'package:surf_flutter_courses_template/utils/validators/field_validator.dart';
import 'package:surf_flutter_courses_template/utils/validators/name_validator.dart';
import 'package:surf_flutter_courses_template/utils/validators/weight_validator.dart';

class RegisterPetPage extends StatefulWidget {
  const RegisterPetPage({super.key});

  @override
  State<RegisterPetPage> createState() => _RegisterPetPageState();
}

class _RegisterPetPageState extends State<RegisterPetPage> {
  PetType petType = PetType.dog;
  IllType? illType;

  final _nameController = TextEditingController();
  final _weightController = TextEditingController();
  final _mailController = TextEditingController();
  final _dateOfBirthController = TextEditingController();


  final _illController = TextEditingController();
  late final nameValidator = NameValidator(_nameController);
  late final weightValidator = WeightValidator(_weightController);
  late final mailValidator = EmailValidator(_mailController);
  late final dateOfBirthValidator = DateValidator(_dateOfBirthController);
  late final illDateValidator = DateValidator(_illController);

  final ValueNotifier isFormValid = ValueNotifier(false);

  late List<FieldValidator> fields = [
    nameValidator,
    weightValidator,
    mailValidator,
    dateOfBirthValidator,
  ];

  void _changePetType(PetType type) {
    setState(() {
      petType = type;
      if ((petType == PetType.parrot || petType == PetType.hamster) &&
          fields.contains(illDateValidator)) {
        fields.remove(illDateValidator);
        illType = null;
        _illController.clear();
        _validateForm();
      }
    });
  }

  void _changeIllType(bool value, IllType type) {
    if (illType == type && !value) {
      setState(() {
        illType = null;
        fields.remove(illDateValidator);
        _illController.clear();
      });
    } else {
      setState(() {
        illType = type;
        if (!fields.contains(illDateValidator)) {
          fields.add(illDateValidator);
        }
      });
    }
    _validateForm();
  }

  void _validateForm() {
    isFormValid.value = fields.every((field) => field.valid);
  }

  Future<DateTime?> _showDatePicker(BuildContext context) async {
    final result = await showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(
        const Duration(
          days: 5000,
        ),
      ),
      lastDate: DateTime.now(),
    );
    return result;
  }

  @override
  void dispose() {
    for (final field in fields) {
      field.dispose();
    }
    isFormValid.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: RegisterPetInherited.of(context).registerState,
          builder: (_, state, __) {
            return SafeArea(
              child: Stack(
                children: [
                  ListView(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: 72,
                    ),
                    children: [
                      PetTypeList(
                        currentType: petType,
                        onPetTypeChange: _changePetType,
                        isGroupEnabled: state != RegisterPetState.loading,
                      ),
                      ValidatableTextField(
                        validator: nameValidator,
                        controller: _nameController,
                        label: context.localization.petName,
                        onValidateForm: _validateForm,
                        readOnly: state == RegisterPetState.loading,
                      ),
                      ValidatableTextField(
                        validationStrategy: ValidationStrategy.onChange,
                        onTap: state != RegisterPetState.loading
                            ? () async {
                                final result = await _showDatePicker(context);
                                if (result != null) {
                                  _dateOfBirthController.text =
                                      result.toFormattedString;
                                }
                              }
                            : null,
                        validator: dateOfBirthValidator,
                        controller: _dateOfBirthController,
                        label: context.localization.petBirthday,
                        onValidateForm: _validateForm,
                        readOnly: true,
                      ),
                      ValidatableTextField(
                        validator: weightValidator,
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        label: context.localization.petWeight,
                        onValidateForm: _validateForm,
                        readOnly: state == RegisterPetState.loading,
                      ),
                      ValidatableTextField(
                        validator: mailValidator,
                        controller: _mailController,
                        label: context.localization.hostMail,
                        onValidateForm: _validateForm,
                        readOnly: state == RegisterPetState.loading,
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: petType == PetType.dog || petType == PetType.cat
                            ? IllList(
                                currentIllType: illType,
                                onChange: _changeIllType,
                                fieldBuilder: (BuildContext context) =>
                                    ValidatableTextField(
                                  margin: const EdgeInsets.only(top: 8),
                                  validationStrategy:
                                      ValidationStrategy.onChange,
                                  onTap: state != RegisterPetState.loading
                                      ? () async {
                                          final result =
                                              await _showDatePicker(context);
                                          if (result != null) {
                                            _illController.text =
                                                result.toFormattedString;
                                          }
                                        }
                                      : null,
                                  validator: illDateValidator,
                                  controller: _illController,
                                  label: context.localization.petLastVaccine,
                                  onValidateForm: _validateForm,
                                  readOnly: true,
                                ),
                                isGroupEnabled:
                                    state != RegisterPetState.loading,
                              )
                            : Container(),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: ValueListenableBuilder(
                      valueListenable: isFormValid,
                      builder: (_, isValid, __) => AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: ElevatedButton(
                          onPressed:
                              isValid && state != RegisterPetState.loading
                                  ? () {
                                      RegisterPetInherited.of(context)
                                          .registerPet();
                                    }
                                  : null,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(56),
                          ),
                          child: state != RegisterPetState.loading
                              ? Text(context.localization.send)
                              : CircularProgressIndicator(
                                  color:
                                      context.colorScheme.onScaffoldBackground,
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
