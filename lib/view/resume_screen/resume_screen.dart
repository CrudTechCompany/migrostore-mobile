import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/main_screen/main_screen_controller.dart';
import 'package:migrostore/view/resume_screen/components/pdf_document_view_screen.dart';
import 'package:migrostore/view/resume_screen/components/resume_step_six_screen.dart';
import 'package:migrostore/view/resume_screen/components/education_screen.dart';
import 'package:migrostore/view/resume_screen/components/resume_step_four_screen.dart';
import 'package:migrostore/view/resume_screen/components/resume_step_one_screen.dart';
import 'package:migrostore/view/resume_screen/components/resume_step_three_screen.dart';
import 'package:migrostore/view/resume_screen/components/resume_step_two_screen.dart';
import 'package:migrostore/view/resume_screen/components/select_language_screen.dart';
import 'package:migrostore/view/resume_screen/components/work_experience_screen.dart';
import 'package:migrostore/view/resume_screen/resume_screen_controller.dart';
import 'package:provider/provider.dart';

import 'components/resume_step_five_screen.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

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
                    child: SizedBox(
                      width: 256.0.w,
                      height: 256.0.w,
                      child: SvgPicture.asset(
                        "assets/resume_screen.svg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.0.h),
                    child: SizedBox(
                      width: 280.0.w,
                      child: Text(
                        "Ви ще не створили жодного резюме",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 207, 207, 207),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 110.0.h),
                    child: InkWell(
                      onTap: () => context
                          .read<ResumeScreenController>()
                          .setResumeStepOneScreenState(),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
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
                              "Cтворити резюме",
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
                bottom: 13.0.h,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: InkWell(
                      onTap: () => context
                          .read<MainScreenController>()
                          .setResumeScreenState(),
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
                  ),
                ],
              ),
            ),
          ),
        ),
        context.watch<ResumeScreenController>().resumeStepOneScreenState
            ? const ResumeStepOneScreen()
            : const SizedBox.shrink(),
        context.watch<ResumeScreenController>().resumeStepTwoScreenState
            ? const ResumeStepTwo()
            : const SizedBox.shrink(),
        context.watch<ResumeScreenController>().selectLanguageScreenState
            ? const SelectLanguangeScreen()
            : const SizedBox.shrink(),
        context.watch<ResumeScreenController>().stepThreeScreenState
            ? const ResumeStepThreeScreen()
            : const SizedBox.shrink(),
        context.watch<ResumeScreenController>().addWorkExperienceScreenState
            ? const WorkExperienceScreen()
            : const SizedBox.shrink(),
        context.watch<ResumeScreenController>().stepFourScreenState
            ? const ResumeStepFourScreen()
            : const SizedBox.shrink(),
        context.watch<ResumeScreenController>().educationScreenState
            ? const EducationScreen()
            : const SizedBox.shrink(),
        context.watch<ResumeScreenController>().stepFiveScreenState
            ? const ResumeStepFiveScreenState()
            : const SizedBox.shrink(),
        context.watch<ResumeScreenController>().createResumeScreenState
            ? const CreateResumeScreen()
            : const SizedBox.shrink(),
        context.watch<ResumeScreenController>().pdfDocumentViewScreenState
            ? const PdfDocumentViewScreen()
            : const SizedBox.shrink(),
      ],
    );
  }
}
