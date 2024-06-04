import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/feature/main/di/theme_inherited.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/cupertino_radio_tile.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/scheme_selector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:surf_flutter_courses_template/utils/extensions/theme_mode_x.dart';

class ThemeSettingsBottomSheet extends StatefulWidget {
  const ThemeSettingsBottomSheet({super.key});

  @override
  State<ThemeSettingsBottomSheet> createState() =>
      _ThemeSettingsBottomSheetState();
}

class _ThemeSettingsBottomSheetState extends State<ThemeSettingsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final themeInherited = ThemeInherited.of(context);
    final localization = AppLocalizations.of(context)!;
    return Container(
      height: 380,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  localization.profilePageThemeLabel,
                  style: AppTextScheme.of(context).bold18,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          CupertinoRadioTile(
            value: ThemeMode.system,
            groupValue: themeInherited.themeMode.value,
            label: ThemeMode.system.label,
            onChanged: (value) {
              themeInherited.setThemeMode(ThemeMode.system);
            },
          ),
          CupertinoRadioTile(
            value: ThemeMode.light,
            groupValue: themeInherited.themeMode.value,
            label: ThemeMode.light.label,
            onChanged: (value) {
              themeInherited.setThemeMode(ThemeMode.light);
            },
          ),
          Visibility(
            visible: themeInherited.themeMode.value == ThemeMode.light,
            child: const SchemeSelector(),
          ),
          CupertinoRadioTile(
            value: ThemeMode.dark,
            groupValue: themeInherited.themeMode.value,
            label: ThemeMode.dark.label,
            onChanged: (value) {
              themeInherited.setThemeMode(ThemeMode.dark);
            },
          ),
          Visibility(
            visible: themeInherited.themeMode.value == ThemeMode.dark,
            child: const SchemeSelector(),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(localization.done),
          ),
        ],
      ),
    );
  }
}
