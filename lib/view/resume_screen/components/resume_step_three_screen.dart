import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/resume_screen/resume_screen_controller.dart';
import 'package:provider/provider.dart';

class ResumeStepThreeScreen extends StatelessWidget {
  const ResumeStepThreeScreen({super.key});

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
                bottom: 123.0.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Досвід роботи",
                    style: GoogleFonts.roboto(
                      fontSize: 26.0.sp,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromARGB(255, 24, 24, 24),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0.h),
                    child: Text(
                      "Будь ласка, заповнюйте польською мовою",
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 122, 122, 122),
                      ),
                    ),
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: context
                        .watch<ResumeScreenController>()
                        .workExperienceList
                        .length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context
                                    .read<ResumeScreenController>()
                                    .workExperienceList[index]["position"]!,
                                style: GoogleFonts.roboto(
                                  fontSize: 18.0.sp,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  color: const Color.fromARGB(255, 24, 24, 24),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0.h),
                                child: Text(
                                  context
                                      .read<ResumeScreenController>()
                                      .workExperienceList[index]["company"]!,
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
                                padding: EdgeInsets.only(top: 5.0.h),
                                child: Row(
                                  children: [
                                    Text(
                                      "${context.read<ResumeScreenController>().workExperienceList[index]["start_date"]!} - ${context.read<ResumeScreenController>().workExperienceList[index]["end_date"]!}",
                                      style: GoogleFonts.roboto(
                                        fontSize: 12.0.sp,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: const Color.fromARGB(
                                            255, 144, 144, 144),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () => context
                                    .read<ResumeScreenController>()
                                    .onClickAddedWorkExperienceEditButton(
                                        index),
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                child: SizedBox(
                                  width: 16.0.w,
                                  height: 16.0.w,
                                  child: SvgPicture.asset(
                                    "assets/edit_icon.svg",
                                    fit: BoxFit.fill,
                                    color:
                                        const Color.fromARGB(255, 24, 24, 24),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.0.h),
                                child: InkWell(
                                  onTap: () => context
                                      .read<ResumeScreenController>()
                                      .onClickAddedWorkExperienceDeleteIcon(
                                          index),
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  child: SizedBox(
                                    width: 16.0.w,
                                    height: 16.0.w,
                                    child: SvgPicture.asset(
                                      "assets/delete_icon.svg",
                                      fit: BoxFit.fill,
                                      color:
                                          const Color.fromARGB(255, 255, 0, 0),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0.h),
                        child: ColoredBox(
                          color: const Color.fromARGB(255, 180, 180, 180),
                          child: SizedBox(
                            width: double.infinity,
                            height: 1.0.h,
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 25.0.sp,
                    ),
                    child: InkWell(
                      onTap: () => context
                          .read<ResumeScreenController>()
                          .setAddWorkExperienceScreenState(),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0.r),
                          border: Border.all(
                            width: 1.0.w,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                        child: SizedBox(
                          width: 345.0.w,
                          height: 53.0.w,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "+",
                                  style: GoogleFonts.roboto(
                                    fontSize: 18.0.sp,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color:
                                        const Color.fromARGB(255, 24, 24, 24),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0.w),
                                  child: Text(
                                    "Додати досвід роботи",
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
                              .setStepThreeScreenState(),
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
                      "assets/step_three.svg",
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
              height: 113.0.h,
              child: Center(
                child: InkWell(
                  onTap: () => context
                      .read<ResumeScreenController>()
                      .setStepFourScreenState(),
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
