import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Профиль'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CircleAvatar(
                      radius: 96,
                      backgroundImage: AssetImage('./assets/avatar.jpeg'),
                    ),
                    Positioned(
                      bottom: 0,
                      left: -40,
                      child: Transform.rotate(
                        angle: math.pi / 7,
                        child: SvgPicture.asset(
                          './assets/curved_arrow.svg',
                          height: 50,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 35,
                      left: -70,
                      child: Transform.rotate(
                        angle: math.pi / 10,
                        child: const Text(
                          '100% me',
                          style: TextStyle(
                              fontFamily: 'Residential',
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Буняев Ярослав Андреевич',
                  style: TextStyle(fontFamily: 'HealthyFood', fontSize: 20),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                color: Theme.of(context).colorScheme.onBackground,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('О себе'),
                    SvgPicture.asset(
                      './assets/about_me.svg',
                      height: 40,
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  'Всем привет. Меня зовут Ярослав и я хочу стать крутым программистом!',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                color: Theme.of(context).colorScheme.onBackground,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Увлечения'),
                    SvgPicture.asset(
                      './assets/ball.svg',
                      height: 40,
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                    'Люблю поиграть в баскетбол, погулять с друзьями и почитать книги'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                color: Theme.of(context).colorScheme.onBackground,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Опыт в разработке'),
                    SvgPicture.asset(
                      './assets/development.svg',
                      height: 40,
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                    'Во время практики в универе на 3 курсе пригласили на позицию front-end разработчика, пару лет занимался вебом на React, Vue. Затем подвернулся проект на React-Native, над которым я проработал около года и вот уже как 2 года пишу приложения на Flutter. Все постигалось кровью и потом. Сейчас на курсе устраняю пробелы в хард скиллах и ищу best practise'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
