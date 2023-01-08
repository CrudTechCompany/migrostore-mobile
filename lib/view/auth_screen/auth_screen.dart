import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/auth_screen/auth_screen_controller.dart';
import 'package:migrostore/view/main_screen/main_screen_controller.dart';
import 'package:migrostore/view/sign_in_screen/sign_in_screen.dart';
import 'package:migrostore/view/sign_in_screen/sign_in_screen_controller.dart';
import 'package:provider/provider.dart';

import '../sign_up_screen/sign_up_screen.dart';
import '../sign_up_screen/sign_up_screen_controller.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColoredBox(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SizedBox(
            width: 375.0.w,
            height: 812.0.h,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 66.0.h),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () => Provider.of<MainScreenController>(context,
                                listen: false)
                            .setIsUserAuthorized(),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        child: Icon(
                          Icons.close,
                          size: 24.0.w,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 111.0.h),
                    child: SizedBox(
                      width: 160.0.w,
                      height: 114.0.w,
                      child: SvgPicture.asset(
                        "assets/migrostore.svg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 170.0.h,
                    ),
                    child: InkWell(
                      onTap: () => context
                          .read<AuthScreenController>()
                          .setSignInScreenState(),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(300.0.r),
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                        child: SizedBox(
                          width: 345.0.w,
                          height: 53.0.w,
                          child: Center(
                            child: Text(
                              "Увійти",
                              style: GoogleFonts.roboto(
                                fontSize: 18.0.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0.h,
                    ),
                    child: InkWell(
                      onTap: () => context
                          .read<AuthScreenController>()
                          .setSignUpScreenState(),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0.r),
                          border: Border.all(
                            width: 1.0.w,
                            style: BorderStyle.solid,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: SizedBox(
                          width: 345.0.w,
                          height: 53.0.w,
                          child: Center(
                            child: Text(
                              "Зареєструватися",
                              style: GoogleFonts.roboto(
                                fontSize: 18.0.sp,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: const Color.fromARGB(255, 24, 24, 24),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.0.h),
                    child: SizedBox(
                      width: 265.0.w,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Продовжуючи, ви погоджуєтесь із",
                            style: GoogleFonts.roboto(
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: const Color.fromARGB(255, 180, 180, 180),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.0.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () => context
                                      .read<AuthScreenController>()
                                      .onClickPrivacyOrTermsLink("terms"),
                                  child: Text(
                                    "Загальними положеннями та умовами",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      fontSize: 14.0.sp,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color:
                                          const Color.fromARGB(255, 24, 24, 24),
                                    ),
                                  ),
                                ),
                                Text(
                                  " і",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14.0.sp,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: const Color.fromARGB(
                                        255, 180, 180, 180),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.0.h),
                            child: InkWell(
                              onTap: () => context
                                  .read<AuthScreenController>()
                                  .onClickPrivacyOrTermsLink("policy"),
                              child: Text(
                                "Політикою конфіденційності",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: const Color.fromARGB(255, 24, 24, 24),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        context.watch<AuthScreenController>().signInScreenState
            ? ChangeNotifierProvider(
                create: (_) => SignInScreenController(),
                child: const SignInScreen(),
              )
            : const SizedBox.shrink(),
        context.watch<AuthScreenController>().signUpScreenState
            ? ChangeNotifierProvider(
                create: (_) => SignUpScreenController(),
                child: const SignUpScreen(),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
