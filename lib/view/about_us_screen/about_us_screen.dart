import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/main_screen/main_screen_controller.dart';
import 'package:migrostore/view/settings_screen/settings_screen_controller.dart';
import 'package:provider/provider.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColoredBox(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SizedBox(
            width: 375.0.w,
            height: 812.0.h,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 172.0.h),
                  child: SizedBox(
                    width: 160.0.w,
                    height: 66.0.w,
                    child: SvgPicture.asset(
                      "assets/migrostore_logo.svg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.0.h),
                  child: Text(
                    "Migrostore App",
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
                    "Версія 1.0.1",
                    style: GoogleFonts.roboto(
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromARGB(255, 24, 24, 24),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0.h),
                  child: Text(
                    "Migrostore spółka z ograniczoną odpowiedzialnością",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromARGB(255, 24, 24, 24),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0.h),
                  child: Text(
                    "ul. Aleksandra Ostrowskiego, 13",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromARGB(255, 24, 24, 24),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0.h),
                  child: Text(
                    "53-238, Wrocław",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromARGB(255, 24, 24, 24),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0.h),
                  child: Text(
                    "NIP: 8943184905",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromARGB(255, 24, 24, 24),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0.h),
                  child: Text(
                    "KRS: 0000966678",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromARGB(255, 24, 24, 24),
                    ),
                  ),
                ),
              ],
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
                bottom: 13.0.h,
                left: 15.0.w,
                right: 15.0.w,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: InkWell(
                      onTap: () {
                        context
                            .read<SettingsScreenController>()
                            .setAboutUsScreenState();
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
                      "Про нас",
                      textAlign: TextAlign.center,
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
      ],
    );
  }
}
