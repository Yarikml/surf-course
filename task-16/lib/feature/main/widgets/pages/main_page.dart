import 'package:flutter/material.dart';

import 'package:surf_flutter_courses_template/assets/resources/resources.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double scale = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF100C2C),
                Color(0xFF000002),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  scale = scale == 1 ? 3 : 1;
                });
              },
              child: AnimatedScale(
                scale: scale,
                duration: Duration(seconds: 1),
                curve: Curves.easeInOutBack,
                child: Image.asset(Images.ball),
              ),
            ),
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 176,
                    child: AnimatedOpacity(
                      opacity: scale == 1 ? 1 : 0.05,
                      duration: Duration(seconds: 1),
                      child: Text(
                        'Нажмите на шар или потрясите телефон',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: AppTextScheme.of(context).regular16,
                      ),
                    ),
                  ),
                ],
              ),
            )
            /*     Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    scale = scale == 1 ? 4 : 1;
                  });
                },
                child: AnimatedScale(
                  scale: scale,
                  duration: const Duration(seconds: 2),
                  child: Image.asset(Images.ball),
                ),
              ),
            ),*/
/*            SizedBox(
              width: 176,
              child: Text(
                'Нажмите на шар или потрясите телефон',
                maxLines: 2,
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
