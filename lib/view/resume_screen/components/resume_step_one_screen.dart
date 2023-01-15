import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/resume_screen/resume_screen_controller.dart';
import 'package:provider/provider.dart';

class ResumeStepOneScreen extends StatelessWidget {
  const ResumeStepOneScreen({super.key});

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
                    padding: EdgeInsets.only(top: 102.0.h),
                    child: SizedBox(
                      width: 375.0.w,
                      height: 48.0.w,
                      child: SvgPicture.asset(
                        "assets/step_one.svg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0.h,
                      left: 15.0.w,
                      right: 15.0.w,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Назва резюме",
                            style: GoogleFonts.roboto(
                              fontSize: 26.0.sp,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              color: const Color.fromARGB(255, 24, 24, 24),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0.h),
                          child: Row(
                            children: [
                              Text(
                                "Введіть назву для резюме",
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
                        SizedBox(
                          height: 43.0.w,
                          child: TextField(
                            controller: context
                                .read<ResumeScreenController>()
                                .resumeNameController,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                RegExp("[а-яА-ЯёЁïÏ]"),
                              ),
                            ],
                            onChanged: (value) => context
                                .read<ResumeScreenController>()
                                .setStepOneScreenNextButtonState(),
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
                              fillColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              hintText: "Введіть назву для резюме",
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: const Color.fromARGB(255, 180, 180, 180),
                              ),
                              contentPadding: EdgeInsets.zero,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.0.w,
                                  color: context
                                          .watch<ResumeScreenController>()
                                          .resumeNameController
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.0.h),
                            child: Text(
                              "Назва резюме тільки польською мовою",
                              style: GoogleFonts.roboto(
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: const Color.fromARGB(255, 180, 180, 180),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 380.0.h),
                          child: InkWell(
                            onTap: context
                                    .watch<ResumeScreenController>()
                                    .stepOneScreenNextButtonState
                                ? () => context
                                    .read<ResumeScreenController>()
                                    .onClickStepOneScreenNextButton(context)
                                : null,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0.r),
                                color: context
                                        .watch<ResumeScreenController>()
                                        .stepOneScreenNextButtonState
                                    ? const Color.fromARGB(255, 24, 24, 24)
                                    : const Color.fromARGB(255, 180, 180, 180),
                              ),
                              child: SizedBox(
                                width: 345.0.w,
                                height: 53.0.w,
                                child: Center(
                                  child: Text(
                                    "Далі",
                                    style: GoogleFonts.roboto(
                                      fontSize: 18.0.sp,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
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
                bottom: 13.0.h,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: InkWell(
                      onTap: () => context
                          .read<ResumeScreenController>()
                          .setResumeStepOneScreenState(),
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
          ),
        ),
      ],
    );
  }
}
