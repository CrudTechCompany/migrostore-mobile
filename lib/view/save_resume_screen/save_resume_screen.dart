import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/resume_screen/resume_screen_controller.dart';
import 'package:provider/provider.dart';

class SaveResumeScreen extends StatelessWidget {
  const SaveResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: SizedBox(
        width: 375.0.w,
        height: 812.0.h,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 84.0.h),
                child: SizedBox(
                  width: 345.0.w,
                  height: 345.0.w,
                  child: SvgPicture.asset(
                    "assets/successfully_create.svg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(
                "Вітаємо!",
                style: GoogleFonts.roboto(
                  fontSize: 26.0.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: const Color.fromARGB(255, 24, 24, 24),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0.h),
                child: Text(
                  "Ви створили своє резюме",
                  style: GoogleFonts.roboto(
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: const Color.fromARGB(255, 24, 24, 24),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 100.0.h),
                child: InkWell(
                  onTap: () => context
                      .read<ResumeScreenController>()
                      .onClickSaveButton(),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
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
                          "Завантажити резюме",
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
    );
  }
}
