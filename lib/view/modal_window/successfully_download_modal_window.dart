import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/main_screen/main_screen_controller.dart';
import 'package:migrostore/view/menu_screen/menu_screen_controller.dart';
import 'package:provider/provider.dart';

class SuccessfullyDownloadModalWindow extends StatelessWidget {
  const SuccessfullyDownloadModalWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
      child: SizedBox(
        width: 375.0.w,
        height: 812.0.h,
        child: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0.r),
              border: Border.all(
                style: BorderStyle.solid,
                width: 1.0.w,
                color: const Color.fromARGB(255, 24, 24, 24),
              ),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: SizedBox(
              width: 345.0.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30.0.h),
                      child: Text(
                        "Ваше резюме успішно збережено",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.0.h),
                      child: InkWell(
                        onTap: () {
                          Provider.of<MenuScreenController>(context,
                                  listen: false)
                              .setResumeScreenState();
                          Provider.of<MainScreenController>(context,
                                  listen: false)
                              .setNavigationBarState();
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0.r),
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                          child: SizedBox(
                            width: 290.0.w,
                            height: 53.0.w,
                            child: Center(
                              child: Text(
                                "До головної",
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
          ),
        ),
      ),
    );
  }
}
