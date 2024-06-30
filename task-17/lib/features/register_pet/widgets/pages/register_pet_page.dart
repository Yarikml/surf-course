import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_style.dart';
import 'package:surf_flutter_courses_template/features/register_pet/widgets/custom_checkbox.dart';
import 'package:surf_flutter_courses_template/features/register_pet/widgets/ill_list.dart';
import 'package:surf_flutter_courses_template/features/register_pet/widgets/pet_type_list.dart';
import 'package:surf_flutter_courses_template/utils/enums/ill_type.dart';
import 'package:surf_flutter_courses_template/utils/enums/pet_type.dart';

class RegisterPetPage extends StatefulWidget {
  const RegisterPetPage({super.key});

  @override
  State<RegisterPetPage> createState() => _RegisterPetPageState();
}

class _RegisterPetPageState extends State<RegisterPetPage> {
  PetType petType = PetType.dog;
  IllType? illType;

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
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextFormField(
                validator: (String? value) {
                  if (value == null ||
                      value.trim().length < 3 ||
                      value.trim().length > 20) {
                    return 'Укажите имя питомца от 3 до 20 символов';
                  }
                  return null;
                },
                style: AppTextScheme.of(context).regular16,
                decoration: InputDecoration(
                  isDense: true,
                  label: Text('Имя питомца'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextFormField(
                style: AppTextScheme.of(context).regular16,
                decoration: InputDecoration(
                  isDense: true,
                  label: Text('День рождения питомца'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextFormField(
                keyboardType: TextInputType.number,
                validator: (String? value) {
                  if (value == null) {
                    return 'Укажите вес, больше 0 кг';
                  } else {
                    final intValue = int.tryParse(value.trim());
                    if (intValue != null && intValue < 0) {
                      return 'Укажите вес, больше 0 кг';
                    }
                  }
                  return null;
                },
                style: AppTextScheme.of(context).regular16,
                decoration: InputDecoration(
                  isDense: true,
                  label: Text('Вес, кг'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextFormField(
                validator: (String? value) {
                  if (value == null) {
                    return 'Укажите вес, больше 0 кг';
                  } else {
                    final intValue = int.tryParse(value.trim());
                    if (intValue != null && intValue < 0) {
                      return 'Укажите вес, больше 0 кг';
                    }
                  }
                  return null;
                },
                style: AppTextScheme.of(context).regular16,
                decoration: InputDecoration(
                  isDense: true,
                  label: Text('Почта хозяина'),
                ),
              ),
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
