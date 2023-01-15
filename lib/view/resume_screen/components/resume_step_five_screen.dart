import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/resume_screen/resume_screen_controller.dart';
import 'package:provider/provider.dart';

class ResumeStepFiveScreenState extends StatelessWidget {
  const ResumeStepFiveScreenState({super.key});

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
              padding: EdgeInsets.only(
                left: 15.0.w,
                right: 15.0.w,
                top: 170.0.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Кваліфікації",
                    style: GoogleFonts.roboto(
                      fontSize: 26.0.sp,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromARGB(255, 24, 24, 24),
                    ),
                  ),
                  Text(
                    "Будь ласка, заповнюйте польською мовою",
                    style: GoogleFonts.roboto(
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromARGB(255, 122, 122, 122),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(
                          RegExp("[а-яА-ЯёЁïÏ]"),
                        ),
                      ],
                      keyboardType: TextInputType.text,
                      controller: context
                          .read<ResumeScreenController>()
                          .qualificationController,
                      onChanged: (value) => context
                          .read<ResumeScreenController>()
                          .setCreateResumeButtonState(),
                      maxLines: 8,
                      cursorColor: const Color.fromARGB(255, 24, 24, 24),
                      cursorHeight: 16.0.sp,
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        hintText:
                            "Сертифікати, документи підтвердження кваліфікації і т.д., які ви отримали",
                        hintStyle: GoogleFonts.roboto(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 180, 180, 180),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0.r),
                          borderSide: BorderSide(
                            width: 1.0.w,
                            color: context
                                    .watch<ResumeScreenController>()
                                    .qualificationController
                                    .text
                                    .isNotEmpty
                                ? const Color.fromARGB(255, 24, 24, 24)
                                : const Color.fromARGB(255, 180, 180, 180),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0.r),
                          borderSide: BorderSide(
                            width: 1.0.w,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 215.0.h),
                    child: InkWell(
                      onTap: context
                              .watch<ResumeScreenController>()
                              .createResumeButtonState
                          ? () => context
                              .read<ResumeScreenController>()
                              .setCreateResumeScreenState()
                          : null,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0.r),
                          color: context
                                  .watch<ResumeScreenController>()
                                  .createResumeButtonState
                              ? const Color.fromARGB(255, 24, 24, 24)
                              : const Color.fromARGB(255, 180, 180, 180),
                        ),
                        child: SizedBox(
                          width: 345.0.w,
                          height: 53.0.w,
                          child: Center(
                            child: Text(
                              "Створити резюме",
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
            height: 160.0.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 15.0.w,
                    right: 15.0.w,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: InkWell(
                          onTap: () => context
                              .read<ResumeScreenController>()
                              .setStepFiveScreenState(),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          child: Icon(
                            Icons.arrow_back,
                            size: 24.0.w,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Резюме",
                          style: GoogleFonts.roboto(
                            fontSize: 20.0.sp,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0.h),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48.0.w,
                    child: SvgPicture.asset(
                      "assets/step_five.svg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
