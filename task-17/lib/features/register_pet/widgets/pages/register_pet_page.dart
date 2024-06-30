import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_style.dart';
import 'package:surf_flutter_courses_template/features/register_pet/widgets/custom_checkbox.dart';
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
              child: TextField(
                style: AppTextScheme.of(context).regular16,
                decoration: InputDecoration(
                  isDense: true,
                  label: Text('Имя питомца'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextField(
                style: AppTextScheme.of(context).regular16,
                decoration: InputDecoration(
                  isDense: true,
                  label: Text('День рождения питомца'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextField(
                style: AppTextScheme.of(context).regular16,
                decoration: InputDecoration(
                  isDense: true,
                  label: Text('Вес, кг'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextField(
                style: AppTextScheme.of(context).regular16,
                decoration: InputDecoration(
                  isDense: true,
                  label: Text('Почта хозяина'),
                ),
              ),
            ),
            Text(
              'Сделаны прививки от:',
              style: AppTextScheme.of(context).semiBold24,
            ),
            ...IllType.values
                .map(
                  (item) => CustomCheckbox(
                    isChecked: illType == item,
                    label: item.name,
                    onChange: (bool value) {
                      if (illType == item && !value) {
                        setState(() {
                          illType = null;
                        });
                      } else {
                        setState(() {
                          illType = item;
                        });
                      }
                    },
                  ),
                )
                .toList(),
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
