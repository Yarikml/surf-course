import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/feature/main/di/theme_inherited.dart';

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
          SizedBox(
            height: 64,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ThemeInherited.of(context).appThemes.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  ThemeInherited.of(context).setThemeData(
                      ThemeInherited.of(context).appThemes[index]);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(right: 6),
                  width: 103,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: ThemeInherited.of(context).appThemes[index] ==
                                ThemeInherited.of(context).themeData.value
                            ? Theme.of(context).primaryColor
                            : Colors.transparent),
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
                                        ? ThemeInherited.of(context)
                                            .appThemes[index]
                                            .light
                                            .highlightColor
                                        : ThemeInherited.of(context)
                                            .appThemes[index]
                                            .dark
                                            .highlightColor,
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
                                        ? ThemeInherited.of(context)
                                            .appThemes[index]
                                            .light
                                            .focusColor
                                        : ThemeInherited.of(context)
                                            .appThemes[index]
                                            .dark
                                            .focusColor,
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
                                        ? ThemeInherited.of(context)
                                            .appThemes[index]
                                            .light
                                            .primaryColor
                                        : ThemeInherited.of(context)
                                            .appThemes[index]
                                            .dark
                                            .primaryColor,
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
                                        ? ThemeInherited.of(context)
                                            .appThemes[index]
                                            .light
                                            .hintColor
                                        : ThemeInherited.of(context)
                                            .appThemes[index]
                                            .dark
                                            .hintColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Схема ${index + 1}',
                        style: ThemeInherited.of(context).appThemes[index] ==
                                ThemeInherited.of(context).themeData.value
                            ? AppTextScheme.of(context).regular12AccentSubtitle
                            : AppTextScheme.of(context).regular12Subtitle,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
