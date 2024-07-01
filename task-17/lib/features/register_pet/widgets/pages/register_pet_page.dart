import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_style.dart';
import 'package:surf_flutter_courses_template/features/register_pet/widgets/custom_checkbox.dart';
import 'package:surf_flutter_courses_template/features/register_pet/widgets/ill_list.dart';
import 'package:surf_flutter_courses_template/features/register_pet/widgets/pet_type_list.dart';
import 'package:surf_flutter_courses_template/features/register_pet/widgets/validatable_text_field.dart';
import 'package:surf_flutter_courses_template/utils/enums/ill_type.dart';
import 'package:surf_flutter_courses_template/utils/enums/pet_type.dart';
import 'package:surf_flutter_courses_template/utils/enums/validation_strategy.dart';
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
  late final dateOfBirthValidator = DateValidator(_dateOfBirthController, true);
  late final illDateValidator = DateValidator(_illController, false);

  final ValueNotifier isFormValid = ValueNotifier(false);

  List<FieldValidator> get _fields => [
        nameValidator,
        weightValidator,
        mailValidator,
        dateOfBirthValidator,
        illDateValidator,
      ];

  void _changePetType(PetType type) {
    setState(() {
      petType = type;
    });
  }

  void _validateForm() {
    isFormValid.value = _fields.every((field) => field.valid);
  }

  @override
  void dispose() {
    isFormValid.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            PetTypeList(
              currentType: petType,
              onPetTypeChange: _changePetType,
            ),
            ValidatableTextField(
              validator: nameValidator,
              controller: _nameController,
              label: 'Имя питомца',
              onValidateForm: _validateForm,
            ),
            ValidatableTextField(
              validationStrategy: ValidationStrategy.onChange,
              onTap: () async {
                final result = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now().subtract(
                    Duration(
                      days: 5000,
                    ),
                  ),
                  lastDate: DateTime.now(),
                );
                if (result != null) {
                  _dateOfBirthController.text = result.toFormattedString;
                }
              },
              validator: dateOfBirthValidator,
              controller: _dateOfBirthController,
              label: 'День рождения питомца',
              onValidateForm: _validateForm,
            ),
            ValidatableTextField(
              validator: weightValidator,
              controller: _weightController,
              label: 'Вес, кг',
              onValidateForm: _validateForm,
            ),
            ValidatableTextField(
              validator: mailValidator,
              controller: _mailController,
              label: 'Почта хозяина',
              onValidateForm: _validateForm,
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: petType == PetType.dog || petType == PetType.cat
                  ? IllList(
                      currentIllType: illType,
                      onChange: (bool value, IllType type) {
                        if (illType == type && !value) {
                          setState(() {
                            illType = null;
                          });
                        } else {
                          setState(() {
                            illType = type;
                          });
                        }
                      },
                    )
                  : Container(),
            ),
            ValueListenableBuilder(
              valueListenable: isFormValid,
              builder: (_, isValid, __) => ElevatedButton(
                onPressed: isValid ? () {} : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(56),
                ),
                child: Text('Отправить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
