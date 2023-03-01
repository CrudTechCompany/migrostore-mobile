import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/add_education_screen/add_education_screen.dart';
import 'package:migrostore/view/add_work_experience_screen/add_work_experience_screen.dart';
import 'package:migrostore/view/basic_info_screen/basic_info_screen.dart';
import 'package:migrostore/view/cv_name_screen/cv_name_screen.dart';
import 'package:migrostore/view/education_screen/education_screen.dart';
import 'package:migrostore/view/main_screen/main_screen_controller.dart';
import 'package:migrostore/view/menu_screen/menu_screen_controller.dart';
import 'package:migrostore/view/modal_window/successfully_download_modal_window.dart';
import 'package:migrostore/view/preloader_screen/preloader_screen.dart';
import 'package:migrostore/view/qualification_screen/qualification_screen.dart';
import 'package:migrostore/view/resume_screen/resume_screen_controller.dart';
import 'package:migrostore/view/save_resume_screen/save_resume_screen.dart';
import 'package:migrostore/view/select_language_screen/select_language_screen.dart';
import 'package:migrostore/view/work_experience_screen/work_experience_screen.dart';
import 'package:provider/provider.dart';

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
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 102.0.h),
                    child: SizedBox(
                      width: 345.0.w,
                      height: 345.0.w,
                      child: SvgPicture.asset(
                        "assets/cv_image.svg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
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
                    padding: EdgeInsets.only(top: 124.0.h),
                    child: InkWell(
                      onTap: () => context
                          .read<ResumeScreenController>()
                          .setCvNameScreenState(),
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
                      onTap: () {
                        context
                            .read<MenuScreenController>()
                            .setResumeScreenState();
                        Provider.of<MainScreenController>(context,
                                listen: false)
                            .setNavigationBarState();
                      },
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
        context.watch<ResumeScreenController>().cvNameScreenState
            ? const CvNameScreen()
            : const SizedBox.shrink(),
        context.watch<ResumeScreenController>().basicInfoScreenState
            ? const BasicInfoScreen()
            : const SizedBox.shrink(),
        context.watch<ResumeScreenController>().selectLanguageScreenState
            ? const SelectLanguageScreen()
            : const SizedBox.shrink(),
        context.watch<ResumeScreenController>().workExperienceScreenState
            ? const WorkExperienceScreen()
            : const SizedBox.shrink(),
        context.watch<ResumeScreenController>().addWorkExperienceScreenState
            ? const AddWorkExperienceScreen()
            : const SizedBox.shrink(),
        context.watch<ResumeScreenController>().educationScreenState
            ? const EducationScreen()
            : const SizedBox.shrink(),
        context.watch<ResumeScreenController>().addEducationScreenState
            ? const AddEducationScreen()
            : const SizedBox.shrink(),
        context.watch<ResumeScreenController>().qualificationScreenState
            ? const QualificationScreen()
            : const SizedBox.shrink(),
        context.watch<ResumeScreenController>().preloaderScreenState
            ? const PreloaderScreen()
            : const SizedBox.shrink(),
        context.watch<ResumeScreenController>().successfullyScreenState
            ? const SaveResumeScreen()
            : const SizedBox.shrink(),
        context.watch<ResumeScreenController>().successfullyModalWindowState
            ? const SuccessfullyDownloadModalWindow()
            : const SizedBox.shrink(),
      ],
    );
  }
}
