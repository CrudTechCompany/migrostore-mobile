// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:migrostore/view/app_screen/app_screen_controller.dart';
import 'package:migrostore/view/splash_screen/splash_screen_controller.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<SplashScreenController>().getUserData();
        if (Hive.isBoxOpen("userInfo")) {
          if (Hive.box("userInfo").get("userInfo")["isOnboarded"]) {
            Provider.of<AppScreenController>(context, listen: false)
                .setMainScreenState();
            Provider.of<AppScreenController>(context, listen: false)
                .setSplashScreenState();
          } else {
            Provider.of<AppScreenController>(context, listen: false)
                .setOnboardingScreenState();
            Provider.of<AppScreenController>(context, listen: false)
                .setSplashScreenState();
          }
        } else {
          await Hive.openBox("userInfo").then(
            (value) {
              if (value.get("userInfo")["isOnboarded"]) {
                Provider.of<AppScreenController>(context, listen: false)
                    .setMainScreenState();
                Provider.of<AppScreenController>(context, listen: false)
                    .setSplashScreenState();
              } else {
                Provider.of<AppScreenController>(context, listen: false)
                    .setOnboardingScreenState();
                Provider.of<AppScreenController>(context, listen: false)
                    .setSplashScreenState();
              }
            },
          );
        }
      },
    );
    return SizedBox(
      width: 375.0.w,
      height: 812.0.h,
      child: Center(
        child: SvgPicture.asset("assets/migrostore_logo.svg"),
      ),
    );
  }
}
