import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/menu_screen/menu_screen_controller.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        itemCount: context.read<MenuScreenController>().items.length,
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
                              context.read<MenuScreenController>().items[index]
                                  ["icon"]!,
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
                                      .items[index]["title"]!,
                                  style: GoogleFonts.roboto(
                                    fontSize: 18.0.sp,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color:
                                        const Color.fromARGB(255, 24, 24, 24),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 4.0.w),
                                  child: SizedBox(
                                    width: 230.0.w,
                                    child: Text(
                                      context
                                          .read<MenuScreenController>()
                                          .items[index]["description"]!,
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
    );
  }
}
