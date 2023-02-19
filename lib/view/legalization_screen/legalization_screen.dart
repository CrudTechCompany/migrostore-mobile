import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/legalization_screen/legalization_data_screen.dart';
import 'package:migrostore/view/legalization_screen/legalization_screen_controller.dart';
import 'package:migrostore/view/main_screen/main_screen_controller.dart';
import 'package:migrostore/view/menu_screen/menu_screen_controller.dart';
import 'package:migrostore/view/modal_window/successfully_legalization_modal_window.dart';
import 'package:provider/provider.dart';

class LegalizationScreen extends StatelessWidget {
  const LegalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColoredBox(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SizedBox(
            width: 375.0.w,
            height: 812.0.h,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 117.0.h),
                    child: Text(
                      "Безкоштовні консультації з відділом легалізації",
                      style: GoogleFonts.roboto(
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Text(
                      "Виберіть найближче до тебе місто для контакту з відділом легалізації",
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 122, 122, 122),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: DropdownButton2(
                      buttonWidth: double.infinity,
                      underline: ColoredBox(
                        color: context
                                    .watch<LegalizationScreenController>()
                                    .selectedCity !=
                                null
                            ? const Color.fromARGB(255, 24, 24, 24)
                            : const Color.fromARGB(255, 180, 180, 180),
                        child: SizedBox(
                          width: double.infinity,
                          height: 1.0.h,
                        ),
                      ),
                      value: context
                          .watch<LegalizationScreenController>()
                          .selectedCity,
                      isExpanded: true,
                      hint: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Виберіть місто",
                          style: GoogleFonts.roboto(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 180, 180, 180),
                          ),
                        ),
                      ),
                      items:
                          context.read<LegalizationScreenController>().cityList,
                      onChanged: (value) {
                        context
                            .read<LegalizationScreenController>()
                            .setSelectedCity(value);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Text(
                      "Виберіть послугу",
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 122, 122, 122),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: DropdownButton2(
                      buttonWidth: double.infinity,
                      underline: ColoredBox(
                        color: context
                                    .watch<LegalizationScreenController>()
                                    .selectedService !=
                                null
                            ? const Color.fromARGB(255, 24, 24, 24)
                            : const Color.fromARGB(255, 180, 180, 180),
                        child: SizedBox(
                          width: double.infinity,
                          height: 1.0.h,
                        ),
                      ),
                      value: context
                          .watch<LegalizationScreenController>()
                          .selectedService,
                      isExpanded: true,
                      hint: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Виберіть послугу",
                          style: GoogleFonts.roboto(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 180, 180, 180),
                          ),
                        ),
                      ),
                      items: context
                          .read<LegalizationScreenController>()
                          .serviceList,
                      onChanged: (value) {
                        context
                            .read<LegalizationScreenController>()
                            .setSelectedService(value);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 217.0.h),
                    child: InkWell(
                      onTap: context
                              .watch<LegalizationScreenController>()
                              .nextButtonState
                          ? () => context
                              .read<LegalizationScreenController>()
                              .setLegalizationDataScreenState()
                          : null,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0.r),
                          color: context
                                  .watch<LegalizationScreenController>()
                                  .nextButtonState
                              ? const Color.fromARGB(255, 24, 24, 24)
                              : const Color.fromARGB(255, 180, 180, 180),
                        ),
                        child: SizedBox(
                          width: 345.0.w,
                          height: 53.0.w,
                          child: Center(
                            child: Text(
                              "Далі",
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
                            .read<MenuScreenController>()
                            .setLegalizationScreenState();
                        Provider.of<MainScreenController>(context,
                                listen: false)
                            .setNavigationBarState();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 24.0.w,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Легалізація",
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
        context
                .watch<LegalizationScreenController>()
                .legalizationDataScreenState
            ? const LegalizationDataScreen()
            : const SizedBox.shrink(),
        context
                .watch<LegalizationScreenController>()
                .legalizationRequestModalWindowState
            ? const SuccessfullyLegalizationModalWindow()
            : const SizedBox.shrink(),
      ],
    );
  }
}
