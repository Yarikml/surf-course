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
    final themeInherited = ThemeInherited.of(context);
    final textScheme = AppTextScheme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              'Цветовая схема',
              style: textScheme.regular14Label,
            ),
          ),
          SizedBox(
            height: 64,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: themeInherited.appThemes.length,
              itemBuilder: (context, index) {
                final currentTheme = themeInherited.appThemes[index];

                return GestureDetector(
                  onTap: () {
                    themeInherited.setThemeData(currentTheme);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 6),
                    width: 103,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: currentTheme == themeInherited.themeData.value
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
                                    margin: const EdgeInsets.all(1),
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? themeInherited.appThemes[index]
                                              .light.highlightColor
                                          : themeInherited.appThemes[index].dark
                                              .highlightColor,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(1),
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? themeInherited
                                              .appThemes[index].light.focusColor
                                          : themeInherited
                                              .appThemes[index].dark.focusColor,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(1),
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? themeInherited.appThemes[index]
                                              .light.primaryColor
                                          : themeInherited.appThemes[index].dark
                                              .primaryColor,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(1),
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? themeInherited
                                              .appThemes[index].light.hintColor
                                          : themeInherited
                                              .appThemes[index].dark.hintColor,
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
                          style: currentTheme == themeInherited.themeData.value
                              ? textScheme.regular12AccentSubtitle
                              : textScheme.regular12Subtitle,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
