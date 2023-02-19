import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/help_screen/help_screen_controller.dart';
import 'package:migrostore/view/main_screen/main_screen_controller.dart';
import 'package:migrostore/view/menu_screen/menu_screen_controller.dart';
import 'package:provider/provider.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColoredBox(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SizedBox(
            width: 375.0.w,
            height: 812.0.h,
            child: ListView.separated(
              padding: EdgeInsets.only(
                top: 123.0.h,
                left: 15.0.w,
                right: 15.0.w,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0.h),
                  child: InkWell(
                    onTap: () =>
                        context.read<HelpScreenController>().onClickItem(index),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 16.0.w,
                          height: 16.0.w,
                          child: SvgPicture.asset(
                            context.read<HelpScreenController>().items[index]
                                ["icon"]!,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0.w),
                          child: Text(
                            context.read<HelpScreenController>().items[index]
                                ["title"]!,
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
              },
              separatorBuilder: (context, index) {
                return ColoredBox(
                  color: const Color.fromARGB(255, 180, 180, 180),
                  child: SizedBox(
                    width: double.infinity,
                    height: 1.0.h,
                  ),
                );
              },
              itemCount: context.read<HelpScreenController>().items.length,
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
                            .setHelpScreenState();
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
                      "Допомога",
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
