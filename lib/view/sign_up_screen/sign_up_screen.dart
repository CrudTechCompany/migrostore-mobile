import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/auth_screen/auth_screen_controller.dart';
import 'package:migrostore/view/input_code_screen/input_code_screen.dart';
import 'package:migrostore/view/input_code_screen/input_code_screen_controller.dart';
import 'package:migrostore/view/sign_up_screen/sign_up_screen_controller.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 70.0.h),
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
                          .read<SignUpScreenController>()
                          .setSendCodeButtonState(),
                      controller: context
                          .read<SignUpScreenController>()
                          .emailController,
                      cursorColor: const Color.fromARGB(255, 24, 24, 24),
                      cursorHeight: 16.0.sp,
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        contentPadding: EdgeInsets.zero,
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
                                    .watch<SignUpScreenController>()
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
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                      ),
                    ),
                  ),
                  context.watch<SignUpScreenController>().invalidEmailState
                      ? Padding(
                          padding: EdgeInsets.only(top: 5.0.h),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              context
                                  .read<SignUpScreenController>()
                                  .invalidEmailMessage!,
                              style: GoogleFonts.roboto(
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: const Color.fromARGB(255, 255, 0, 0),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.0.h),
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
                  SizedBox(
                    height: 43.0.w,
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        TextField(
                          obscureText: context
                              .watch<SignUpScreenController>()
                              .obscurePasswordState,
                          onChanged: (value) => context
                              .read<SignUpScreenController>()
                              .setSendCodeButtonState(),
                          controller: context
                              .read<SignUpScreenController>()
                              .passwordController,
                          cursorColor: const Color.fromARGB(255, 24, 24, 24),
                          cursorHeight: 16.0.sp,
                          style: GoogleFonts.roboto(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            counterText: "",
                            filled: true,
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                            contentPadding: EdgeInsets.zero,
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
                                        .watch<SignUpScreenController>()
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
                              .read<SignUpScreenController>()
                              .setObscurePasswordState(),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          child: Icon(
                            context
                                    .watch<SignUpScreenController>()
                                    .obscurePasswordState
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 20.0.w,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                  context.watch<SignUpScreenController>().invalidPasswordState
                      ? Padding(
                          padding: EdgeInsets.only(top: 5.0.h),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              context
                                  .read<SignUpScreenController>()
                                  .invalidPasswordMessage!,
                              style: GoogleFonts.roboto(
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: const Color.fromARGB(255, 255, 0, 0),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.0.h),
                      child: Row(
                        children: [
                          Text(
                            "Підтвердити пароль",
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
                              .watch<SignUpScreenController>()
                              .obscureConfirmPasswordState,
                          onChanged: (value) => context
                              .read<SignUpScreenController>()
                              .setSendCodeButtonState(),
                          controller: context
                              .read<SignUpScreenController>()
                              .confirmPasswordController,
                          cursorColor: const Color.fromARGB(255, 24, 24, 24),
                          cursorHeight: 16.0.sp,
                          style: GoogleFonts.roboto(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            counterText: "",
                            filled: true,
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                            contentPadding: EdgeInsets.zero,
                            hintText: "Введіть пароль повторно",
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
                                        .watch<SignUpScreenController>()
                                        .confirmPasswordController
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
                              .read<SignUpScreenController>()
                              .setObscureConfirmPasswordState(),
                          child: Icon(
                            context
                                    .watch<SignUpScreenController>()
                                    .obscureConfirmPasswordState
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
                          .watch<SignUpScreenController>()
                          .invalidConfirmPasswordState
                      ? Padding(
                          padding: EdgeInsets.only(top: 5.0.h),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              context
                                  .read<SignUpScreenController>()
                                  .invalidConfirmPasswordMessage!,
                              style: GoogleFonts.roboto(
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: const Color.fromARGB(255, 255, 0, 0),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  Padding(
                    padding: EdgeInsets.only(top: 64.0.h),
                    child: InkWell(
                      onTap: context
                              .watch<SignUpScreenController>()
                              .sendCodeButtonState
                          ? () => context
                              .read<SignUpScreenController>()
                              .onClickSendCodeButton()
                          : null,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0.w),
                          color: context
                                  .watch<SignUpScreenController>()
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
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30.0.h,
                    ),
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
                                  .read<AuthScreenController>()
                                  .setSignInScreenState();
                              context
                                  .read<AuthScreenController>()
                                  .setSignUpScreenState();
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
                          Provider.of<AuthScreenController>(context,
                                  listen: false)
                              .setSignUpScreenState();
                        },
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
        context.watch<SignUpScreenController>().codeScreenState
            ? ChangeNotifierProvider(
                create: (_) => InputCodeScreenController(),
                child: const InputCodeScreen(),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
