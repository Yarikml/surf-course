import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/assets/themes/app_theme_data.dart';
import 'package:surf_flutter_courses_template/feature/main/di/theme_inherited.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/cupertino_radio_tile.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/scheme_selector.dart';

class ThemeSettingsBottomSheet extends StatefulWidget {
  const ThemeSettingsBottomSheet({super.key});

  @override
  State<ThemeSettingsBottomSheet> createState() =>
      _ThemeSettingsBottomSheetState();
}

class _ThemeSettingsBottomSheetState extends State<ThemeSettingsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Тема оформления',
                  style: AppTextScheme.of(context).bold18,
                ),
                const Icon(Icons.close),
              ],
            ),
          ),
          CupertinoRadioTile(
            value: ThemeMode.system,
            groupValue: ThemeInherited.of(context).themeMode.value,
            label: 'Системная',
            onChanged: (value) {
              ThemeInherited.of(context).setThemeMode(ThemeMode.system);
            },
          ),
          CupertinoRadioTile(
            value: ThemeMode.light,
            groupValue: ThemeInherited.of(context).themeMode.value,
            label: 'Светлая',
            onChanged: (value) {
              ThemeInherited.of(context).setThemeMode(ThemeMode.light);
            },
          ),
          Visibility(
            visible:
                ThemeInherited.of(context).themeMode.value == ThemeMode.light,
            child: SchemeSelector(),
          ),
          CupertinoRadioTile(
            value: ThemeMode.dark,
            groupValue: ThemeInherited.of(context).themeMode.value,
            label: 'Темная',
            onChanged: (value) {
              ThemeInherited.of(context).setThemeMode(ThemeMode.dark);
            },
          ),
          Visibility(
            visible:
                ThemeInherited.of(context).themeMode.value == ThemeMode.dark,
            child: SchemeSelector(),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: Text('Готово'),
          ),
        ],
      ),
    );
  }
}
