import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/app_screen/app_screen_controller.dart';
import 'package:provider/provider.dart';

class DeleteAccountModalWindow extends StatelessWidget {
  const DeleteAccountModalWindow({super.key});

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
                      "Ви дійсно хочете видалити обліковий запис?",
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
                      vertical: 30.0.h,
                      horizontal: 15.0.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Provider.of<AppScreenController>(context,
                                  listen: false)
                              .setDeleteAccountModalWindowState(),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0.r),
                              border: Border.all(
                                width: 1.0.w,
                                color: const Color.fromARGB(255, 24, 24, 24),
                              ),
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: SizedBox(
                              width: 150.0.w,
                              height: 53.0.w,
                              child: Center(
                                child: Text(
                                  "Нi",
                                  style: GoogleFonts.roboto(
                                    fontSize: 18.0.sp,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color:
                                        const Color.fromARGB(255, 24, 24, 24),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Phoenix.rebirth(context),
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
                                  "Так",
                                  style: GoogleFonts.roboto(
                                    fontSize: 18.0.sp,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
