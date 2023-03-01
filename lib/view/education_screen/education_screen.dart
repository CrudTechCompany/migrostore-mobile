import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/resume_screen/resume_screen_controller.dart';
import 'package:provider/provider.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 170.0.h),
                      child: Text(
                        "Освіта",
                        style: GoogleFonts.roboto(
                          fontSize: 26.0.sp,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.0.h),
                      child: Text(
                        "Будь ласка, заповнюйте польською мовою",
                        style: GoogleFonts.roboto(
                          fontSize: 16.0.sp,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(255, 122, 122, 122),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 20.0.h),
                    itemCount: context
                        .watch<ResumeScreenController>()
                        .educationList
                        .length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(top: index == 0 ? 0 : 20.0.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context
                                      .read<ResumeScreenController>()
                                      .educationList[index]["speciality"]!,
                                  style: GoogleFonts.roboto(
                                    fontSize: 18.0.sp,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color:
                                        const Color.fromARGB(255, 24, 24, 24),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 2.0.h),
                                  child: Text(
                                    context
                                        .read<ResumeScreenController>()
                                        .educationList[index]["institution"]!,
                                    style: GoogleFonts.roboto(
                                      fontSize: 14.0.sp,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color:
                                          const Color.fromARGB(255, 24, 24, 24),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 4.0.h),
                                  child: Text(
                                    "${context.read<ResumeScreenController>().educationList[index]["startDate"]!} - ${context.read<ResumeScreenController>().educationList[index]["endDate"]!}",
                                    style: GoogleFonts.roboto(
                                      fontSize: 14.0.sp,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color: const Color.fromARGB(
                                          255, 144, 144, 144),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () => context
                                      .read<ResumeScreenController>()
                                      .onClickEditEducationIcon(index),
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  child: SizedBox(
                                    width: 20.0.w,
                                    height: 20.0.w,
                                    child: SvgPicture.asset(
                                      "assets/edit_icon.svg",
                                      color: const Color.fromARGB(
                                          255, 180, 180, 180),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20.0.h),
                                  child: InkWell(
                                    onTap: () => context
                                        .read<ResumeScreenController>()
                                        .onClickDeleteEducationIcon(index),
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    child: SizedBox(
                                      width: 20.0.w,
                                      height: 20.0.w,
                                      child: SvgPicture.asset(
                                        "assets/delete_icon.svg",
                                        color: const Color.fromARGB(
                                            255, 255, 0, 0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0.h),
                    child: InkWell(
                      onTap: () => context
                          .read<ResumeScreenController>()
                          .setAddEducationScreenState(),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0.r),
                          border: Border.all(
                            style: BorderStyle.solid,
                            width: 1.0.w,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                        child: SizedBox(
                          width: 345.0.w,
                          height: 53.0.w,
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "+",
                                  style: GoogleFonts.roboto(
                                    fontSize: 30.0.sp,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color:
                                        const Color.fromARGB(255, 24, 24, 24),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0.w),
                                  child: Text(
                                    "Додати освіту",
                                    style: GoogleFonts.roboto(
                                      fontSize: 18.0.sp,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      color:
                                          const Color.fromARGB(255, 24, 24, 24),
                                    ),
                                  ),
                                ),
                              ],
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
                              .setEducationScreenState(),
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
                      "assets/step_4.svg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ColoredBox(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: SizedBox(
              width: 375.0.w,
              height: 102.0.h,
              child: Center(
                child: InkWell(
                  onTap: () => context
                      .read<ResumeScreenController>()
                      .setQualificationScreenState(),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0.r),
                      color: const Color.fromARGB(255, 24, 24, 24),
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
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
