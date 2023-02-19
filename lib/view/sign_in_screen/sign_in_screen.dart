import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/auth_screen/auth_screen_controller.dart';
import 'package:migrostore/view/reset_password_screen/reset_password_screen.dart';
import 'package:migrostore/view/reset_password_screen/reset_password_screen_controller.dart';
import 'package:migrostore/view/sign_in_screen/sign_in_screen_controller.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 187.0.h),
                    child: Text(
                      "З поверненням!",
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
                      onChanged: (value) => context
                          .read<SignInScreenController>()
                          .setNextButtonState(),
                      controller: context
                          .read<SignInScreenController>()
                          .emailController,
                      keyboardType: TextInputType.emailAddress,
                      cursorHeight: 16.0.sp,
                      cursorColor: const Color.fromARGB(255, 24, 24, 24),
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
                            width: 1.0.h,
                            color: context
                                    .watch<SignInScreenController>()
                                    .invalidEmailState
                                ? const Color.fromARGB(255, 255, 0, 0)
                                : context
                                        .watch<SignInScreenController>()
                                        .emailController
                                        .text
                                        .isEmpty
                                    ? const Color.fromARGB(255, 180, 180, 180)
                                    : const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.0.h,
                            color: context
                                    .watch<SignInScreenController>()
                                    .invalidEmailState
                                ? const Color.fromARGB(255, 255, 0, 0)
                                : const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                      ),
                    ),
                  ),
                  context.watch<SignInScreenController>().invalidEmailState
                      ? Padding(
                          padding: EdgeInsets.only(top: 2.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                context
                                    .read<SignInScreenController>()
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
                            "Пароль",
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
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      SizedBox(
                        height: 43.0.w,
                        child: TextField(
                          obscureText: context
                              .watch<SignInScreenController>()
                              .obscureState,
                          onChanged: (value) => context
                              .read<SignInScreenController>()
                              .setNextButtonState(),
                          controller: context
                              .read<SignInScreenController>()
                              .passwordController,
                          cursorHeight: 16.0.sp,
                          cursorColor: const Color.fromARGB(255, 24, 24, 24),
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
                            hintText: "Введіть пароль",
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: const Color.fromARGB(255, 180, 180, 180),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.0.h,
                                color: context
                                        .watch<SignInScreenController>()
                                        .invalidPasswordState
                                    ? const Color.fromARGB(255, 255, 0, 0)
                                    : context
                                            .watch<SignInScreenController>()
                                            .passwordController
                                            .text
                                            .isEmpty
                                        ? const Color.fromARGB(
                                            255, 180, 180, 180)
                                        : const Color.fromARGB(255, 24, 24, 24),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.0.h,
                                color: context
                                        .watch<SignInScreenController>()
                                        .invalidPasswordState
                                    ? const Color.fromARGB(255, 255, 0, 0)
                                    : const Color.fromARGB(255, 24, 24, 24),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () => context
                              .read<SignInScreenController>()
                              .setObscureState(),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          child: Icon(
                            context.watch<SignInScreenController>().obscureState
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 20.0.w,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  context.watch<SignInScreenController>().invalidPasswordState
                      ? Padding(
                          padding: EdgeInsets.only(top: 2.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                context
                                    .read<SignInScreenController>()
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.0.h),
                      child: InkWell(
                        onTap: () => context
                            .read<SignInScreenController>()
                            .setResetPasswordScreenState(),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        child: Text(
                          "Забули пароль?",
                          style: GoogleFonts.roboto(
                            decoration: TextDecoration.underline,
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 44.0.h),
                    child: InkWell(
                      onTap: context
                              .watch<SignInScreenController>()
                              .signInButtonState
                          ? () => context
                              .read<SignInScreenController>()
                              .onClickSignInButton(context)
                          : null,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0.w),
                          color: context
                                  .watch<SignInScreenController>()
                                  .signInButtonState
                              ? const Color.fromARGB(255, 24, 24, 24)
                              : const Color.fromARGB(255, 180, 180, 180),
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
                    padding: EdgeInsets.only(
                      top: 30.0.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Немає акаунту?",
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
                                  .read<AuthScreenController>()
                                  .setSignUpScreenState();
                              context
                                  .read<AuthScreenController>()
                                  .setSignInScreenState();
                            },
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            child: Text(
                              "Зареєструватися",
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
                          context
                              .read<AuthScreenController>()
                              .setSignInScreenState();
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
        context.watch<SignInScreenController>().resetPasswordScreenState
            ? ChangeNotifierProvider(
                create: (_) => ResetPasswordScreenController(),
                child: const ResetPasswordScreen(),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
