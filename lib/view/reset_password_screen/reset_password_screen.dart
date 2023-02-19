import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/reset_code_screen/reset_code_screen.dart';
import 'package:migrostore/view/reset_code_screen/reset_code_screen_controller.dart';
import 'package:migrostore/view/reset_password_screen/reset_password_screen_controller.dart';
import 'package:migrostore/view/sign_in_screen/sign_in_screen_controller.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
                    padding: EdgeInsets.only(top: 187.0.h),
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
                    padding: EdgeInsets.only(top: 50.0.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            "Email",
                            style: GoogleFonts.roboto(
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: const Color.fromARGB(255, 24, 24, 24),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.0.w),
                            child: Text(
                              "*",
                              style: GoogleFonts.roboto(
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: const Color.fromARGB(255, 255, 0, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 43.0.w,
                    child: TextField(
                      controller: context
                          .read<ResetPasswordScreenController>()
                          .emailController,
                      onChanged: (value) => context
                          .read<ResetPasswordScreenController>()
                          .setSendCodeButtonState(),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: const Color.fromARGB(255, 24, 24, 24),
                      cursorHeight: 16.0.sp,
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        hintText: "Введіть адресу email",
                        hintStyle: GoogleFonts.roboto(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 180, 180, 180),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.0.w,
                            color: context
                                    .watch<ResetPasswordScreenController>()
                                    .invalidEmailState
                                ? const Color.fromARGB(255, 255, 0, 0)
                                : context
                                        .watch<ResetPasswordScreenController>()
                                        .emailController
                                        .text
                                        .isEmpty
                                    ? const Color.fromARGB(255, 180, 180, 180)
                                    : const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.0.w,
                            color: context
                                    .watch<ResetPasswordScreenController>()
                                    .invalidEmailState
                                ? const Color.fromARGB(255, 255, 0, 0)
                                : const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                      ),
                    ),
                  ),
                  context
                          .watch<ResetPasswordScreenController>()
                          .invalidEmailState
                      ? Padding(
                          padding: EdgeInsets.only(top: 2.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                context
                                    .read<ResetPasswordScreenController>()
                                    .invalidEmailMessage!,
                                style: GoogleFonts.roboto(
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: const Color.fromARGB(255, 255, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            "Новий пароль",
                            style: GoogleFonts.roboto(
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: const Color.fromARGB(255, 24, 24, 24),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.0.w),
                            child: Text(
                              "*",
                              style: GoogleFonts.roboto(
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: const Color.fromARGB(255, 255, 0, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 43.0.w,
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        TextField(
                          obscureText: context
                              .watch<ResetPasswordScreenController>()
                              .obscurePasswordState,
                          controller: context
                              .read<ResetPasswordScreenController>()
                              .passwordController,
                          onChanged: (value) => context
                              .read<ResetPasswordScreenController>()
                              .setSendCodeButtonState(),
                          cursorColor: const Color.fromARGB(255, 24, 24, 24),
                          cursorHeight: 16.0.sp,
                          style: GoogleFonts.roboto(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                          decoration: InputDecoration(
                            counterText: "",
                            contentPadding: EdgeInsets.zero,
                            filled: true,
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                            hintText: "Введіть пароль (мінімум 6 символів)",
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: const Color.fromARGB(255, 180, 180, 180),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.0.w,
                                color: context
                                        .watch<ResetPasswordScreenController>()
                                        .passwordController
                                        .text
                                        .isEmpty
                                    ? const Color.fromARGB(255, 180, 180, 180)
                                    : const Color.fromARGB(255, 24, 24, 24),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.0.w,
                                color: const Color.fromARGB(255, 24, 24, 24),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => context
                              .read<ResetPasswordScreenController>()
                              .setObscurePasswordState(),
                          child: Icon(
                            context
                                    .watch<ResetPasswordScreenController>()
                                    .obscurePasswordState
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 20.0.w,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        )
                      ],
                    ),
                  ),
                  context
                          .watch<ResetPasswordScreenController>()
                          .invalidPasswordState
                      ? Padding(
                          padding: EdgeInsets.only(top: 2.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                context
                                    .read<ResetPasswordScreenController>()
                                    .invalidPasswordMessage!,
                                style: GoogleFonts.roboto(
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: const Color.fromARGB(255, 255, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                  Padding(
                    padding: EdgeInsets.only(top: 84.0.h),
                    child: InkWell(
                      onTap: context
                              .watch<ResetPasswordScreenController>()
                              .sendCodeButtonState
                          ? () => context
                              .read<ResetPasswordScreenController>()
                              .onClickSendCodeButton()
                          : null,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0.w),
                          color: context
                                  .watch<ResetPasswordScreenController>()
                                  .sendCodeButtonState
                              ? const Color.fromARGB(255, 24, 24, 24)
                              : const Color.fromARGB(255, 180, 180, 180),
                        ),
                        child: SizedBox(
                          width: 345.0.w,
                          height: 53.0.w,
                          child: Center(
                            child: Text(
                              "Відправити код",
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
                          Provider.of<SignInScreenController>(context,
                                  listen: false)
                              .setResetPasswordScreenState();
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
        context.watch<ResetPasswordScreenController>().resetCodeScreenState
            ? ChangeNotifierProvider(
                create: (_) => ResetCodeScreenController(),
                child: const ResetCodeScreen(),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
