import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/info_field_item.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/pages/theme_settings_bottom_sheet.dart';
import 'package:surf_flutter_courses_template/assets/resources/resources.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextScheme.of(context);
    final colorScheme = AppColorScheme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Профиль'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              'Сохранить',
              style: textTheme.regular14Accent,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(Images.person),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColorScheme.of(context).photoFilter,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Edit',
                        style: textTheme.regular12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                'Мои награды',
                style: textTheme.regular14Label,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Image.asset(Images.firstPlace),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Image.asset(Images.firstPlace),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Image.asset(Images.thirdPlace),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Image.asset(Images.secondPlace),
                  ),
                  Image.asset(Images.thirdPlace),
                ],
              ),
            ),
            const InfoFieldItem(
              text: 'Маркус Хассельборг',
              label: 'Имя',
            ),
            const InfoFieldItem(
              text: 'MarkusHSS@gmail.com',
              label: 'Email',
            ),
            const InfoFieldItem(
              text: '03.03.1986',
              label: 'Дата рождения',
            ),
            const InfoFieldItem(
              text: 'Сборная Швеции',
              label: 'Команда',
              hasArrow: true,
            ),
            const InfoFieldItem(
              text: 'Скип',
              label: 'Позиция',
              hasArrow: true,
            ),
            InfoFieldItem(
              text: 'Тема оформления',
              label: 'Системная',
              hasArrow: true,
              onTap: () {
                showModalBottomSheet(
                  barrierColor: colorScheme.barrierColor,
                  context: context,
                  builder: (context) => const ThemeSettingsBottomSheet(),
                );
              },
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 1,
                  color: colorScheme.outlinedButtonBackgroundColor,
                ),
              ),
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
