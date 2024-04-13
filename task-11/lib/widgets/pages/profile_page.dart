import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter_courses_template/assets/app_assets.dart';
import 'dart:math' as math;

import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/assets/app_text_scheme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(AppStrings.profile),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 96,
                      backgroundImage: AssetImage(AppAssets.avatar),
                    ),
                    Positioned(
                      bottom: 0,
                      left: -40,
                      child: Transform.rotate(
                        angle: math.pi / 7,
                        child: SvgPicture.asset(
                          AppAssets.curvedArrow,
                          height: 50,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 35,
                      left: -70,
                      child: Transform.rotate(
                        angle: math.pi / 10,
                        child: Text(
                          AppStrings.percent,
                          style: AppTextScheme.of(context).residential700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  AppStrings.fio,
                  style: AppTextScheme.of(context).healthy400,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                color: Theme.of(context).colorScheme.onBackground,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppStrings.aboutMe),
                    SvgPicture.asset(
                      AppAssets.aboutMe,
                      height: 40,
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  AppStrings.aboutMeText,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                color: Theme.of(context).colorScheme.onBackground,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppStrings.hobbies),
                    SvgPicture.asset(
                      AppAssets.ball,
                      height: 40,
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(AppStrings.hobbiesText),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                color: Theme.of(context).colorScheme.onBackground,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppStrings.development),
                    SvgPicture.asset(
                      AppAssets.development,
                      height: 40,
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(AppStrings.developmentText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
