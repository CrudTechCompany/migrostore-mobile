import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/profile_screen/components/profile_select_city_screen_controller.dart';
import 'package:migrostore/view/profile_screen/profile_screen_controller.dart';
import 'package:provider/provider.dart';

class ProfileSelectCityScreen extends StatelessWidget {
  const ProfileSelectCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (context.read<ProfileSelectCityScreenController>().initialState ==
            false) {
          Provider.of<ProfileScreenController>(context, listen: false)
                      .selectedCity ==
                  null
              ? null
              : context
                  .read<ProfileSelectCityScreenController>()
                  .setInitialCityList(Provider.of<ProfileScreenController>(
                          context,
                          listen: false)
                      .selectedCity);
          context.read<ProfileSelectCityScreenController>().setInitialState();
        } else {
          return;
        }
      },
    );
    return Stack(
      children: [
        ColoredBox(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SizedBox(
            width: 375.0.w,
            height: 812.0.h,
            child: ListView.separated(
              padding: EdgeInsets.only(
                top: 117.0.h,
                left: 15.0.w,
                right: 15.0.w,
                bottom: 123.0.h,
              ),
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => context
                      .read<ProfileSelectCityScreenController>()
                      .onClickListItem(index),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context
                            .read<ProfileSelectCityScreenController>()
                            .cityList
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
                                .watch<ProfileSelectCityScreenController>()
                                .cityList
                                .values
                                .toList()[index]
                            ? Icons.radio_button_on
                            : Icons.radio_button_off,
                        size: 16.0.sp,
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0.h),
                  child: ColoredBox(
                    color: const Color.fromARGB(255, 236, 236, 236),
                    child: SizedBox(
                      width: double.infinity,
                      height: 1.0.h,
                    ),
                  ),
                );
              },
              itemCount: context
                  .read<ProfileSelectCityScreenController>()
                  .cityList
                  .length,
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
                      onTap: () => Provider.of<ProfileScreenController>(context,
                              listen: false)
                          .setSelectCityScreenState(),
                      child: Icon(
                        Icons.arrow_back,
                        size: 24.0.w,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Місто пошуку роботи",
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
                          .watch<ProfileSelectCityScreenController>()
                          .selectButtonState
                      ? () => context
                          .read<ProfileSelectCityScreenController>()
                          .onClickSelectButton(context)
                      : null,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: context
                              .watch<ProfileSelectCityScreenController>()
                              .selectButtonState
                          ? const Color.fromARGB(255, 24, 24, 24)
                          : const Color.fromARGB(255, 180, 180, 180),
                      borderRadius: BorderRadius.circular(30.0.r),
                    ),
                    child: SizedBox(
                      width: 345.0.w,
                      height: 53.0.w,
                      child: Center(
                        child: Text(
                          "Вибрати",
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
            ),
          ),
        ),
      ],
    );
  }
}
