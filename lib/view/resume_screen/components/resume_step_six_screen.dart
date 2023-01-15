import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/resume_screen/resume_screen_controller.dart';
import 'package:provider/provider.dart';

class CreateResumeScreen extends StatelessWidget {
  const CreateResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        const Duration(seconds: 1),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
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
                      padding: EdgeInsets.only(
                        top: 74.0.h,
                        right: 15.0.w,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () => context
                              .read<ResumeScreenController>()
                              .onClickCloseIcon(),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          child: Icon(
                            Icons.close,
                            size: 24.0.w,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 54.0.h),
                      child: SizedBox(
                        width: 345.0.w,
                        height: 345.0.w,
                        child: SvgPicture.asset(
                          "assets/step_six.svg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0.h),
                      child: Text(
                        "Вітаємо!",
                        style: GoogleFonts.roboto(
                          fontSize: 26.0.sp,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
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
                      padding: EdgeInsets.only(top: 50.0.h),
                      child: InkWell(
                        onTap: () {},
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0.w,
                              style: BorderStyle.solid,
                              color: const Color.fromARGB(255, 24, 24, 24),
                            ),
                            borderRadius: BorderRadius.circular(30.0.r),
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: SizedBox(
                            width: 345.0.w,
                            height: 53.0.w,
                            child: Center(
                              child: Text(
                                "Перегляд резюме",
                                style: GoogleFonts.roboto(
                                  fontSize: 18.0.sp,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  color: const Color.fromARGB(255, 24, 24, 24),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0.h),
                      child: InkWell(
                        onTap: () {},
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
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
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
        } else {
          return ColoredBox(
            color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
            child: SizedBox(
              width: 375.0.w,
              height: 812.0.h,
              child: Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(30.0.r),
                    border: Border.all(
                      width: 1.0.w,
                      style: BorderStyle.solid,
                      color: const Color.fromARGB(255, 24, 24, 24),
                    ),
                  ),
                  child: SizedBox(
                    width: 345.0.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 30.0.h,
                            left: 15.0.w,
                            right: 15.0.w,
                          ),
                          child: Text(
                            "Зачекайте на завершення створення резюме",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: const Color.fromARGB(255, 24, 24, 24),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 50.0.h,
                          ),
                          child: SizedBox(
                            width: 40.0.w,
                            height: 40.0.w,
                            child: const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color.fromARGB(255, 144, 144, 144),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
