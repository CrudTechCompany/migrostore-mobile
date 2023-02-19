import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:migrostore/view/about_us_screen/about_us_screen.dart';
import 'package:migrostore/view/modal_window/delete_account_modal_window.dart';
import 'package:migrostore/view/modal_window/exit_modal_window.dart';
import 'package:migrostore/view/settings_screen/settings_screen_controller.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (Hive.isBoxOpen("userInfo")) {
        return;
      } else {
        await Hive.openBox("userInfo");
      }
    });
    return Stack(
      children: [
        SizedBox(
          width: 375.0.w,
          height: 812.0.h,
          child: ListView.separated(
            itemCount: context.read<SettingsScreenController>().content.length,
            padding: EdgeInsets.only(
              top: 133.0.h,
              left: 15.0.w,
              right: 15.0.w,
            ),
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if ((index == 3 || index == 4) &&
                  Hive.box("userInfo").get("userInfo")["isAuthorized"] ==
                      false) {
                return const SizedBox.shrink();
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0.h),
                  child: InkWell(
                    onTap: () => context
                        .read<SettingsScreenController>()
                        .onClickContentItem(context, index),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 16.0.w,
                          height: 16.0.w,
                          child: SvgPicture.asset(
                            context
                                .read<SettingsScreenController>()
                                .content[index]["icon"]!,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0.w),
                          child: Text(
                            context
                                .read<SettingsScreenController>()
                                .content[index]["title"]!,
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
                );
              }
            },
            separatorBuilder: (context, index) {
              return ColoredBox(
                color: const Color.fromARGB(255, 236, 236, 236),
                child: SizedBox(
                  width: double.infinity,
                  height: 1.0.h,
                ),
              );
            },
          ),
        ),
        ColoredBox(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SizedBox(
            width: 375.0.w,
            height: 102.0.h,
            child: Padding(
              padding: EdgeInsets.only(bottom: 13.0.h),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Налаштування",
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
        context.watch<SettingsScreenController>().aboutUsScreenState
            ? const AboutUsScreen()
            : const SizedBox.shrink(),
        context.watch<SettingsScreenController>().deleteAccountState
            ? const DeleteAccountModalWindow()
            : const SizedBox.shrink(),
        context.watch<SettingsScreenController>().exitWindowState
            ? const ExitModalWindow()
            : const SizedBox.shrink(),
      ],
    );
  }
}
