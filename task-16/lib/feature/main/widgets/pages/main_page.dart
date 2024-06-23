import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';

import 'package:surf_flutter_courses_template/assets/resources/resources.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/feature/main/di/reply_inherited.dart';
import 'package:surf_flutter_courses_template/feature/main/state_manager/reply_controller.dart';

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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColorScheme.of(context).scaffoldGradientStart,
                AppColorScheme.of(context).scaffoldGradientEnd,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
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
                duration: const Duration(milliseconds: 300),
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
                                style: AppTextScheme.of(context)
                                    .regular56
                                    .copyWith(
                                      color: AppColorScheme.of(context)
                                          .accentedTextColor,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        : state == ReplyState.error
                            ? Center(
                                child: Text(
                                  'Error. Try again',
                                  style: AppTextScheme.of(context)
                                      .regular56
                                      .copyWith(
                                        color: AppColorScheme.of(context)
                                            .errorTextColor,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : Container(),
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
                          style: AppTextScheme.of(context).regular16.copyWith(
                                color:
                                    AppColorScheme.of(context).regulaTextColor,
                              ),
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
