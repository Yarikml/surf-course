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
import 'package:surf_flutter_courses_template/utils/validators/name_validator.dart';

class RegisterPetPage extends StatefulWidget {
  const RegisterPetPage({super.key});

  @override
  State<RegisterPetPage> createState() => _RegisterPetPageState();
}

class _RegisterPetPageState extends State<RegisterPetPage> {
  PetType petType = PetType.dog;
  IllType? illType;

  final _nameController = TextEditingController();
  late final nameValidator = NameValidator(_nameController);

  void _changePetType(PetType type) {
    setState(() {
      petType = type;
    });
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
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(56),
              ),
              child: Text('Отправить'),
            ),
          ],
        ),
      ),
    );
  }
}
