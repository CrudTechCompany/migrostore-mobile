import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/main_screen/main_screen_controller.dart';
import 'package:migrostore/view/work_screen/work_screen_controller.dart';
import 'package:provider/provider.dart';

class SuccessfullyWorkModalWindow extends StatelessWidget {
  const SuccessfullyWorkModalWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: SizedBox(
        width: 375.0.w,
        height: 812.0.h,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 117.0.h),
              child: SizedBox(
                width: 252.0.w,
                height: 252.0.w,
                child: SvgPicture.asset(
                  "assets/find_work.svg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 70.0.h),
              child: Text(
                "Дякуємо!",
                style: GoogleFonts.roboto(
                  fontSize: 26.0.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: const Color.fromARGB(255, 24, 24, 24),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0.h),
              child: SizedBox(
                width: 300.0.w,
                child: Text(
                  "Ми вже шукаємо для вас роботу на підставі вашого профілю. Тепер наш час діяти!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: const Color.fromARGB(255, 24, 24, 24),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.0.h),
              child: InkWell(
                onTap: () {
                  context
                      .read<WorkScreenController>()
                      .setSuccessfullyModalWindowState();
                  context.read<MainScreenController>().setWorkScreenState();
                },
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0.r),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(
                      color: const Color.fromARGB(255, 24, 24, 24),
                      style: BorderStyle.solid,
                      width: 1.0.w,
                    ),
                  ),
                  child: SizedBox(
                    width: 345.0.w,
                    height: 53.0.w,
                    child: Center(
                      child: Text(
                        "До головної",
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
          ],
        ),
      ),
    );
  }
}
