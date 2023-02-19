import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/app_screen/app_screen_controller.dart';
import 'package:migrostore/view/auth_screen/auth_screen_controller.dart';
import 'package:migrostore/view/sign_in_screen/sign_in_screen.dart';
import 'package:migrostore/view/sign_in_screen/sign_in_screen_controller.dart';
import 'package:migrostore/view/sign_up_screen/sign_up_screen.dart';
import 'package:migrostore/view/sign_up_screen/sign_up_screen_controller.dart';
import 'package:provider/provider.dart';

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
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 54.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Provider.of<AppScreenController>(context,
                                  listen: false)
                              .setAuthScreenState(),
                          child: Icon(
                            Icons.close_outlined,
                            size: 24.0.w,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 119.0.h),
                    child: SizedBox(
                      width: 160.0.w,
                      height: 114.0.w,
                      child: SvgPicture.asset(
                        "assets/migrostore_auth_logo.svg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 170.0.h),
                    child: InkWell(
                      onTap: () => context
                          .read<AuthScreenController>()
                          .setSignInScreenState(),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0.w),
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
                                fontStyle: FontStyle.normal,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0.h),
                    child: InkWell(
                      onTap: () => context
                          .read<AuthScreenController>()
                          .setSignUpScreenState(),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.solid,
                            width: 1.0.w,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                          borderRadius: BorderRadius.circular(30.0.w),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                    .onClickTermsOrPrivacy(context, "Terms"),
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                child: Text(
                                  "Загальними положеннями та умовами",
                                  style: GoogleFonts.roboto(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14.0.sp,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color:
                                        const Color.fromARGB(255, 24, 24, 24),
                                  ),
                                ),
                              ),
                              Text(
                                " та",
                                style: GoogleFonts.roboto(
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color:
                                      const Color.fromARGB(255, 180, 180, 180),
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
                                .onClickTermsOrPrivacy(context, "Privacy"),
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            child: Text(
                              "Політикою конфіденційності",
                              style: GoogleFonts.roboto(
                                decoration: TextDecoration.underline,
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: const Color.fromARGB(255, 24, 24, 24),
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
