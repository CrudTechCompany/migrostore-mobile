import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:migrostore/view/app_screen/app_screen_controller.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375.0.w,
      height: 812.0.h,
      child: Center(
        child: InkWell(
          onTap: () {
            Provider.of<AppScreenController>(context, listen: false)
                .setSplashScreenState();
            Provider.of<AppScreenController>(context, listen: false)
                .setOnboardingScreenState();
          },
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          child: SizedBox(
            width: 198.0.w,
            height: 81.0.w,
            child: SvgPicture.asset(
              "assets/migrostore_logo.svg",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
