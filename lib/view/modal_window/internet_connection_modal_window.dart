import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InternetConnectionModalWindow extends StatelessWidget {
  const InternetConnectionModalWindow({super.key});

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
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(30.0.r),
              border: Border.all(
                style: BorderStyle.solid,
                width: 1.0.w,
                color: const Color.fromARGB(255, 24, 24, 24),
              ),
            ),
            child: SizedBox(
              width: 345.0.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30.0.h),
                    child: Text(
                      "Відсутнє інтернет з'єднання",
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0.h),
                    child: Text(
                      "Увімкніть інтернет і трохи зачекайте",
                      style: GoogleFonts.roboto(
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 30.0.h,
                      horizontal: 15.0.w,
                    ),
                    child: InkWell(
                      onTap: () => exit(0),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0.r),
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                        child: SizedBox(
                          width: 150.0.w,
                          height: 53.0.w,
                          child: Center(
                            child: Text(
                              "Вийти",
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
      ),
    );
  }
}
