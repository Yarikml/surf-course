import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/assets/themes/app_theme_data.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/cupertino_radio_tile.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/scheme_selector.dart';

class ThemeSettingsBottomSheet extends StatefulWidget {
  const ThemeSettingsBottomSheet({super.key});

  @override
  State<ThemeSettingsBottomSheet> createState() =>
      _ThemeSettingsBottomSheetState();
}

class _ThemeSettingsBottomSheetState extends State<ThemeSettingsBottomSheet> {
  final darkThemes = <ThemeData>[
    AppThemeData.greenDarkTheme,
  ];
  final lightThemes = <ThemeData>[
    AppThemeData.greenLightTheme,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            groupValue: 'groupValue',
            label: 'Системная',
            onChanged: (value) {},
          ),
          CupertinoRadioTile(
            value: ThemeMode.system,
            groupValue: 'groupValue',
            label: 'Светлая',
            onChanged: (value) {},
          ),
          CupertinoRadioTile(
            value: ThemeMode.system,
            groupValue: 'groupValue',
            label: 'Темная',
            onChanged: (value) {},
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Готово'),
          ),
          SchemeSelector(),
        ],
      ),
    );
  }
}
