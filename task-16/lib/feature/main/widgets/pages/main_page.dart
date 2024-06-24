import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/feature/main/di/reply_inherited.dart';
import 'package:surf_flutter_courses_template/feature/main/state_manager/reply_controller.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/error_placeholder.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/magic_ball.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/loading_placeholder.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/ball_reply.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double scale = 1;
  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);
    final replyInherited = ReplyInherited.of(context);
    final localization = AppLocalizations.of(context)!;

    return ValueListenableBuilder<ReplyState>(
      valueListenable: replyInherited.replyState,
      builder: (context, state, _) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colorScheme.scaffoldGradientStart,
                colorScheme.scaffoldGradientEnd,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              MagicBall(
                scale: scale,
                onBallTap: () {
                  setState(() {
                    scale = scale == 1 ? 3 : 1;
                  });
                },
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: state == ReplyState.loading
                    ? const LoadingPlaceholder()
                    : state == ReplyState.success
                        ? const BallReply()
                        : state == ReplyState.error
                            ? const ErrorPlaceholder()
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
                        duration: const Duration(seconds: 1),
                        child: Text(
                          localization.tapOnBall,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: textScheme.regular16.copyWith(
                            color: colorScheme.regulaTextColor,
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
