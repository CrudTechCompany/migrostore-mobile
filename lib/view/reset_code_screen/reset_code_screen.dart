import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/modal_window/successfully_reset_password_modal_window.dart';
import 'package:migrostore/view/reset_code_screen/reset_code_screen_controller.dart';
import 'package:migrostore/view/reset_password_screen/reset_password_screen_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class ResetCodeScreen extends StatelessWidget {
  const ResetCodeScreen({super.key});

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
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 167.0.h),
                    child: Text(
                      "Зміна пароля",
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
                      Provider.of<ResetPasswordScreenController>(context,
                              listen: false)
                          .emailController
                          .text,
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
                          inactiveColor: const Color.fromARGB(255, 24, 24, 24),
                          selectedColor: const Color.fromARGB(255, 24, 24, 24),
                        ),
                        animationType: AnimationType.none,
                        onChanged: (value) => context
                            .read<ResetCodeScreenController>()
                            .setSignUpButtonState(value),
                      ),
                    ),
                  ),
                  context.watch<ResetCodeScreenController>().invalidCodeState
                      ? Padding(
                          padding: EdgeInsets.only(top: 30.0.h),
                          child: Text(
                            "Введено неправильний код",
                            style: GoogleFonts.roboto(
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: const Color.fromARGB(255, 255, 0, 0),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  Padding(
                    padding: EdgeInsets.only(top: 210.0.h),
                    child: InkWell(
                      onTap: context
                              .watch<ResetCodeScreenController>()
                              .signUpButtonState
                          ? () => context
                              .read<ResetCodeScreenController>()
                              .onClickSignUpButton(context)
                          : null,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0.r),
                          color: context
                                  .watch<ResetCodeScreenController>()
                                  .signUpButtonState
                              ? const Color.fromARGB(255, 24, 24, 24)
                              : const Color.fromARGB(255, 180, 180, 180),
                        ),
                        child: SizedBox(
                          width: 345.0.w,
                          height: 53.0.w,
                          child: Center(
                            child: Text(
                              "Змінити пароль",
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
              padding: EdgeInsets.only(
                left: 15.0.w,
                right: 15.0.w,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 12.0.h),
                      child: InkWell(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          Provider.of<ResetPasswordScreenController>(context,
                                  listen: false)
                              .setResetCodeScreenState();
                        },
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
                        "assets/migrostore_header_logo.svg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        context.watch<ResetCodeScreenController>().successfullyModalWindowState
            ? const SuccessfullyResetPasswordModalWindow()
            : const SizedBox.shrink(),
      ],
    );
  }
}
