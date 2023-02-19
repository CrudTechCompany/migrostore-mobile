import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/onboarding_srceen/onboarding_screen_controller.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375.0.w,
      height: 812.0.h,
      child: PageView.builder(
        onPageChanged: (value) =>
            context.read<OnboardingScreenController>().setIndex(value),
        physics: const ClampingScrollPhysics(),
        controller: context.read<OnboardingScreenController>().controller,
        itemCount: context.read<OnboardingScreenController>().content.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 375.0.w,
            height: 812.0.h,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: 84.0.h,
                left: 15.0.w,
                right: 15.0.w,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: 345.0.w,
                    height: 345.0.w,
                    child: SvgPicture.asset(
                      context.read<OnboardingScreenController>().content[index]
                          ["image"]!,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0.h),
                    child: Text(
                      context.read<OnboardingScreenController>().content[index]
                          ["title"]!,
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
                      width: 326.0.w,
                      height: 84.0.w,
                      child: Text(
                        context
                            .read<OnboardingScreenController>()
                            .content[index]["description"]!,
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
                    padding: EdgeInsets.only(top: 30.0.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.5.w),
                            color: context
                                        .watch<OnboardingScreenController>()
                                        .index ==
                                    0
                                ? const Color.fromARGB(255, 24, 24, 24)
                                : const Color.fromARGB(255, 180, 180, 180),
                          ),
                          child: SizedBox(
                            width: 7.0.w,
                            height: 7.0.w,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.5.w),
                              color: context
                                          .watch<OnboardingScreenController>()
                                          .index ==
                                      1
                                  ? const Color.fromARGB(255, 24, 24, 24)
                                  : const Color.fromARGB(255, 180, 180, 180),
                            ),
                            child: SizedBox(
                              width: 7.0.w,
                              height: 7.0.w,
                            ),
                          ),
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.5.w),
                            color: context
                                        .watch<OnboardingScreenController>()
                                        .index ==
                                    2
                                ? const Color.fromARGB(255, 24, 24, 24)
                                : const Color.fromARGB(255, 180, 180, 180),
                          ),
                          child: SizedBox(
                            width: 7.0.w,
                            height: 7.0.w,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0.w),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.5.w),
                              color: context
                                          .watch<OnboardingScreenController>()
                                          .index ==
                                      3
                                  ? const Color.fromARGB(255, 24, 24, 24)
                                  : const Color.fromARGB(255, 180, 180, 180),
                            ),
                            child: SizedBox(
                              width: 7.0.w,
                              height: 7.0.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: context
                                      .watch<OnboardingScreenController>()
                                      .index ==
                                  3
                              ? null
                              : () => context
                                  .read<OnboardingScreenController>()
                                  .onClickSkipOrContinueButton(context),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          child: Text(
                            "Пропустити",
                            style: GoogleFonts.roboto(
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: context
                                          .watch<OnboardingScreenController>()
                                          .index ==
                                      3
                                  ? Colors.transparent
                                  : const Color.fromARGB(255, 180, 180, 180),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: context
                                      .watch<OnboardingScreenController>()
                                      .index ==
                                  3
                              ? () => context
                                  .read<OnboardingScreenController>()
                                  .onClickSkipOrContinueButton(context)
                              : () => context
                                  .read<OnboardingScreenController>()
                                  .onClickNextButton(),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                context
                                            .watch<OnboardingScreenController>()
                                            .index ==
                                        3
                                    ? "Продовжити"
                                    : "Далі",
                                style: GoogleFonts.roboto(
                                  fontSize: 16.0.sp,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  color: const Color.fromARGB(255, 24, 24, 24),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 14.0.w,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
