import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/resume_screen/resume_screen_controller.dart';
import 'package:provider/provider.dart';

class SelectLanguangeScreen extends StatelessWidget {
  const SelectLanguangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColoredBox(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SizedBox(
            width: 375.0.w,
            height: 812.0.h,
            child: ListView.builder(
              itemCount:
                  context.read<ResumeScreenController>().languageList.length,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(
                top: 117.0.h,
                bottom: 123.0.h,
                left: 15.0.w,
                right: 15.0.w,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => context
                      .read<ResumeScreenController>()
                      .onClickLanguageListItem(index),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context
                              .read<ResumeScreenController>()
                              .languageList
                              .keys
                              .toList()[index],
                          style: GoogleFonts.roboto(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                        Icon(
                          context
                                  .watch<ResumeScreenController>()
                                  .languageList
                                  .values
                                  .toList()[index]
                              ? Icons.radio_button_on
                              : Icons.radio_button_off,
                          size: 16.0.sp,
                        )
                      ],
                    ),
                  ),
                );
              },
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
                      onTap: () => context
                          .read<ResumeScreenController>()
                          .setSelectLanguageScreenState(context),
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
                      "Виберіть мову",
                      style: GoogleFonts.roboto(
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ColoredBox(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: SizedBox(
              width: 375.0.w,
              height: 113.0.h,
              child: Center(
                child: InkWell(
                  onTap: context
                          .watch<ResumeScreenController>()
                          .addLanguageButtonState
                      ? () => context
                          .read<ResumeScreenController>()
                          .onClickAddLanguageButton()
                      : null,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0.r),
                      color: context
                              .watch<ResumeScreenController>()
                              .addLanguageButtonState
                          ? const Color.fromARGB(255, 24, 24, 24)
                          : const Color.fromARGB(255, 180, 180, 180),
                    ),
                    child: SizedBox(
                      width: 345.0.w,
                      height: 53.0.w,
                      child: Center(
                        child: Text(
                          "Додати мову",
                          style: GoogleFonts.roboto(
                            fontSize: 18.0.sp,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
