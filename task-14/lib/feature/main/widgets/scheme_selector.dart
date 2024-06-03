import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';

import '../../../assets/text/app_text_scheme.dart';
import '../../../assets/themes/app_theme_data.dart';
import '../di/theme_inherited.dart';

class SchemeSelector extends StatefulWidget {
  const SchemeSelector({super.key});

  @override
  State<SchemeSelector> createState() => _SchemeSelectorState();
}

class _SchemeSelectorState extends State<SchemeSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              'Цветовая схема',
              style: AppTextScheme.of(context).regular14Label,
            ),
          ),
          Row(
            children: ThemeInherited.of(context)
                .appThemes
                .map(
                  (item) => GestureDetector(
                    onTap: () {
                      ThemeInherited.of(context).setThemeData(item);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColorScheme.of(context).schemeButtonBg,
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(1),
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? item.light.primaryColor
                                            : item.dark.primaryColor,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(1),
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? item.light.primaryColor
                                            : item.dark.primaryColor,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(1),
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? item.light.primaryColor
                                            : item.dark.primaryColor,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(1),
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? item.light.primaryColor
                                            : item.dark.primaryColor,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Схема 1',
                            style: AppTextScheme.of(context).regular12,
                          )
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
