import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';
import 'package:surf_flutter_courses_template/assets/res/resources.dart';
import 'package:surf_flutter_courses_template/assets/text/text_extension.dart';
import 'package:surf_flutter_courses_template/features/receipt/pages/receipt_page/receipt_page_flow.dart';

import '../../../receipt/pages/receipt_page/receipt_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text(
        'В разработке',
      ),
    ),
    Center(
      child: Text(
        'В разработке',
      ),
    ),
    Center(
      child: Text(
        'В разработке',
      ),
    ),
    ReceiptPageFlow(
      id: 1,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColorScheme.of(context).background,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: SvgPicture.asset(
                SvgIcons.catalogIcon,
                color: _selectedIndex == 0
                    ? AppColorScheme.of(context).primary
                    : null,
              ),
            ),
            label: 'Каталог',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: SvgPicture.asset(
                SvgIcons.searchIcon,
                color: _selectedIndex == 1
                    ? AppColorScheme.of(context).primary
                    : null,
              ),
            ),
            label: 'Поиск',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: SvgPicture.asset(
                SvgIcons.bagIcon,
                color: _selectedIndex == 2
                    ? AppColorScheme.of(context).primary
                    : null,
              ),
            ),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: SvgPicture.asset(
                SvgIcons.peronIcon,
                color: _selectedIndex == 3
                    ? AppColorScheme.of(context).primary
                    : null,
              ),
            ),
            label: 'Личное',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: AppTextTheme.of(context).semiBold10,
        selectedLabelStyle: AppTextTheme.of(context).semiBold10Accent,
        selectedItemColor: AppTextTheme.of(context).semiBold10Accent.color,
        onTap: _onItemTapped,
      ),
    );
  }
}
