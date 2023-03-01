import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/help_screen/help_screen.dart';
import 'package:migrostore/view/help_screen/help_screen_controller.dart';
import 'package:migrostore/view/legalization_screen/legalization_screen.dart';
import 'package:migrostore/view/legalization_screen/legalization_screen_controller.dart';
import 'package:migrostore/view/menu_screen/menu_screen_controller.dart';
import 'package:migrostore/view/resume_screen/resume_screen.dart';
import 'package:migrostore/view/resume_screen/resume_screen_controller.dart';
import 'package:migrostore/view/work_screen/work_screen.dart';
import 'package:migrostore/view/work_screen/work_screen_controller.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 375.0.w,
          height: 812.0.h,
          child: ListView.builder(
            padding: EdgeInsets.only(
              top: 74.0.h,
              left: 15.0.w,
              right: 15.0.w,
            ),
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: context.read<MenuScreenController>().content.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    index == 0 ? EdgeInsets.zero : EdgeInsets.only(top: 15.0.h),
                child: InkWell(
                  onTap: () => context
                      .read<MenuScreenController>()
                      .onClickMenuItem(context, index),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0.r),
                      color: const Color.fromARGB(255, 246, 246, 246),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 15.0.w,
                        right: 15.0.w,
                        top: 20.0.w,
                        bottom: 10.0.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 60.0.w,
                                height: 60.0.w,
                                child: SvgPicture.asset(
                                  context
                                      .read<MenuScreenController>()
                                      .content[index]["icon"]!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15.0.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      context
                                          .read<MenuScreenController>()
                                          .content[index]["title"]!,
                                      style: GoogleFonts.roboto(
                                        fontSize: 18.0.sp,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        color: const Color.fromARGB(
                                            255, 24, 24, 24),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 4.0.w),
                                      child: SizedBox(
                                        width: 230.0.w,
                                        child: Text(
                                          context
                                              .read<MenuScreenController>()
                                              .content[index]["description"]!,
                                          style: GoogleFonts.roboto(
                                            fontSize: 14.0.sp,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            color: const Color.fromARGB(
                                                255, 144, 144, 144),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14.0.w,
                            color: const Color.fromARGB(255, 144, 144, 144),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        context.watch<MenuScreenController>().legalizationScreenState
            ? ChangeNotifierProvider(
                create: (_) => LegalizationScreenController(),
                child: const LegalizationScreen(),
              )
            : const SizedBox.shrink(),
        context.watch<MenuScreenController>().helpScreenState
            ? ChangeNotifierProvider(
                create: (_) => HelpScreenController(),
                child: const HelpScreen(),
              )
            : const SizedBox.shrink(),
        context.watch<MenuScreenController>().workScreenState
            ? ChangeNotifierProvider(
                create: (_) => WorkScreenController(),
                child: const WorkScreen(),
              )
            : const SizedBox.shrink(),
        context.watch<MenuScreenController>().resumeScreenState
            ? ChangeNotifierProvider(
                create: (_) => ResumeScreenController(),
                child: const ResumeScreen(),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
