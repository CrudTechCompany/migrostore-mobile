import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/reset_code_screen/reset_code_screen_controller.dart';
import 'package:migrostore/view/reset_password_screen/reset_password_screen_controller.dart';
import 'package:migrostore/view/sign_in_screen/sign_in_screen_controller.dart';
import 'package:provider/provider.dart';

class SuccessfullyResetPasswordModalWindow extends StatelessWidget {
  const SuccessfullyResetPasswordModalWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
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
                    padding: EdgeInsets.only(top: 30.0.h),
                    child: Text(
                      "Ваш пароль успішно змінено",
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
                    padding: EdgeInsets.only(
                      top: 25.0.h,
                      left: 30.0.w,
                      right: 30.0.w,
                      bottom: 30.0.h,
                    ),
                    child: InkWell(
                      onTap: () {
                        Provider.of<ResetCodeScreenController>(context,
                                listen: false)
                            .setSuccessfullyModalWindowState();
                        Provider.of<ResetPasswordScreenController>(context,
                                listen: false)
                            .setResetCodeScreenState();
                        Provider.of<SignInScreenController>(context,
                                listen: false)
                            .setResetPasswordScreenState();
                      },
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
                              "Авторизація",
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
