import 'package:flutter/material.dart';

import 'package:surf_flutter_courses_template/assets/resources/resources.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/feature/main/di/reply_inherited.dart';
import 'package:surf_flutter_courses_template/feature/main/model/reply_entity/reply_entity.dart';
import 'package:surf_flutter_courses_template/feature/main/state_manager/reply_controller.dart';
import 'package:surf_flutter_courses_template/runner.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double scale = 1;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ReplyState>(
      valueListenable: ReplyInherited.of(context).replyState,
      builder: (context, state, _) => Scaffold(
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
              tileMode: TileMode.clamp,
            ),
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
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutBack,
                  onEnd: () {
                    ReplyInherited.of(context).getReply();
                  },
                  child: Image.asset(Images.ball),
                ),
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: state == ReplyState.loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : state == ReplyState.success
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                            ),
                            child: Center(
                              child: Text(
                                ReplyInherited.of(context).reply.value!.reading,
                              ),
                            ),
                          )
                        : Center(
                            child: Text('Error'),
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
                          'Нажмите на шар или потря',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: AppTextScheme.of(context).regular16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
