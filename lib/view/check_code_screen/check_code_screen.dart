import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/sign_up_screen/sign_up_screen_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../auth_screen/auth_screen_controller.dart';

class CheckCodeScreen extends StatelessWidget {
  const CheckCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<SignUpScreenController>().timer != null
            ? null
            : context.read<SignUpScreenController>().setTimer();
      },
    );
    return Stack(
      children: [
        ColoredBox(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SizedBox(
            width: 375.0.w,
            height: 812.0.h,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 167.0.h),
                    child: Text(
                      "Ласкаво просимо!",
                      style: GoogleFonts.roboto(
                        fontSize: 36.0.sp,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0.h),
                    child: Text(
                      "Код був відправлений на пошту",
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 144, 144, 144),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0.h),
                    child: Text(
                      context.read<SignUpScreenController>().inputedEmail!,
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 144, 144, 144),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0.h),
                    child: SizedBox(
                      width: 300.0.w,
                      child: PinCodeTextField(
                        cursorHeight: 26.0.sp,
                        cursorColor: const Color.fromARGB(255, 24, 24, 24),
                        appContext: context,
                        length: 4,
                        keyboardType: TextInputType.number,
                        blinkDuration: const Duration(microseconds: 10),
                        animationDuration: const Duration(microseconds: 10),
                        textStyle: GoogleFonts.roboto(
                          fontSize: 26.0.sp,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                        pinTheme: PinTheme(
                          fieldHeight: 60.0.w,
                          fieldWidth: 60.0.w,
                          activeColor: const Color.fromARGB(255, 24, 24, 24),
                          inactiveColor:
                              const Color.fromARGB(255, 180, 180, 180),
                          selectedColor: const Color.fromARGB(255, 24, 24, 24),
                        ),
                        animationType: AnimationType.none,
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 80.0.h),
                    child:
                        context.watch<SignUpScreenController>().initialTime == 0
                            ? const SizedBox.shrink()
                            : Text(
                                "Відправити код повторно",
                                style: GoogleFonts.roboto(
                                  fontSize: 16.0.sp,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color:
                                      const Color.fromARGB(255, 144, 144, 144),
                                ),
                              ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0.h),
                    child: context
                                .watch<SignUpScreenController>()
                                .initialTime ==
                            0
                        ? InkWell(
                            onTap: () => context
                                .read<SignUpScreenController>()
                                .setInitialTime(),
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            child: SizedBox(
                              width: 120.0.w,
                              child: Column(
                                children: [
                                  Text(
                                    "Вислати код",
                                    style: GoogleFonts.roboto(
                                      fontSize: 20.0.sp,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      color:
                                          const Color.fromARGB(255, 24, 24, 24),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 2.0.h),
                                    child: ColoredBox(
                                      color:
                                          const Color.fromARGB(255, 24, 24, 24),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 1.0.h,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Text(
                            context
                                        .watch<SignUpScreenController>()
                                        .initialTime >
                                    9
                                ? "00:${context.watch<SignUpScreenController>().initialTime}"
                                : "00:0${context.watch<SignUpScreenController>().initialTime}",
                            style: GoogleFonts.roboto(
                              fontSize: 26.0.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: const Color.fromARGB(255, 24, 24, 24),
                            ),
                          ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 110.0.h),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0.r),
                        color: const Color.fromARGB(255, 180, 180, 180),
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
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Вже є акаунт?",
                          style: GoogleFonts.roboto(
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 180, 180, 180),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0.w),
                          child: InkWell(
                            onTap: () {
                              context
                                  .read<SignUpScreenController>()
                                  .stopTimer();
                              context
                                  .read<SignUpScreenController>()
                                  .setCheckCodeScreenState();
                              context
                                  .read<AuthScreenController>()
                                  .setSignUpScreenState();
                              context
                                  .read<AuthScreenController>()
                                  .setSignInScreenState();
                            },
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            child: Text(
                              "Увійти",
                              style: GoogleFonts.roboto(
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.w500,
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
        ColoredBox(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SizedBox(
            width: 375.0.w,
            height: 102.0.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 12.0.h),
                      child: InkWell(
                        onTap: () => context
                            .read<SignUpScreenController>()
                            .setCheckCodeScreenState(),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        child: Icon(
                          Icons.arrow_back,
                          size: 24.0.w,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 60.0.w,
                      height: 43.0.w,
                      child: SvgPicture.asset(
                        "assets/migrostore.svg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
