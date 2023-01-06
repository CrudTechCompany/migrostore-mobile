import 'dart:math';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/modal_window/profile_screen_modal_window.dart';
import 'package:migrostore/view/profile_screen/profile_screen_controller.dart';
import 'package:migrostore/view/select_city_screen/select_city_screen.dart';
import 'package:provider/provider.dart';
import '../select_skills_screen/select_skills_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              padding: EdgeInsets.only(
                left: 15.0.w,
                right: 15.0.w,
                top: 117.0.h,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Ім’я",
                        style: GoogleFonts.roboto(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.0.w),
                        child: Text(
                          "*",
                          style: GoogleFonts.roboto(
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 43.0.w,
                    child: TextField(
                      onChanged: (value) => context
                          .read<ProfileScreenController>()
                          .onChangeInputedName(value),
                      cursorColor: const Color.fromARGB(255, 24, 24, 24),
                      cursorHeight: 16.0.sp,
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        hintText: "Введіть ім’я",
                        hintStyle: GoogleFonts.roboto(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 180, 180, 180),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.0.w,
                            color: context
                                        .watch<ProfileScreenController>()
                                        .inputedName ==
                                    null
                                ? const Color.fromARGB(255, 180, 180, 180)
                                : const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.0.w,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Row(
                      children: [
                        Text(
                          "Прізвище",
                          style: GoogleFonts.roboto(
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.0.w),
                          child: Text(
                            "*",
                            style: GoogleFonts.roboto(
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: const Color.fromARGB(255, 255, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 43.0.w,
                    child: TextField(
                      onChanged: (value) => context
                          .read<ProfileScreenController>()
                          .onChangeInputedSurName(value),
                      cursorColor: const Color.fromARGB(255, 24, 24, 24),
                      cursorHeight: 16.0.sp,
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        hintText: "Введіть прізвище",
                        hintStyle: GoogleFonts.roboto(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 180, 180, 180),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.0.w,
                            color: context
                                        .watch<ProfileScreenController>()
                                        .inputedSurName ==
                                    null
                                ? const Color.fromARGB(255, 180, 180, 180)
                                : const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.0.w,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Row(
                      children: [
                        Text(
                          "Дата народження",
                          style: GoogleFonts.roboto(
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.0.w),
                          child: Text(
                            "*",
                            style: GoogleFonts.roboto(
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: const Color.fromARGB(255, 255, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => context
                        .read<ProfileScreenController>()
                        .onClickBirthDayField(context),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0.w,
                            color: context
                                        .watch<ProfileScreenController>()
                                        .selectedBirthDay ==
                                    null
                                ? const Color.fromARGB(255, 180, 180, 180)
                                : const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 43.0.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              context
                                          .watch<ProfileScreenController>()
                                          .selectedBirthDay ==
                                      null
                                  ? "Виберіть дату"
                                  : context
                                      .read<ProfileScreenController>()
                                      .selectedBirthDay!,
                              style: GoogleFonts.roboto(
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: context
                                            .watch<ProfileScreenController>()
                                            .selectedBirthDay ==
                                        null
                                    ? const Color.fromARGB(255, 180, 180, 180)
                                    : const Color.fromARGB(255, 24, 24, 24),
                              ),
                            ),
                            Icon(
                              Icons.calendar_month_outlined,
                              size: 24.0.w,
                              color: context
                                          .watch<ProfileScreenController>()
                                          .selectedBirthDay ==
                                      null
                                  ? const Color.fromARGB(255, 180, 180, 180)
                                  : const Color.fromARGB(255, 24, 24, 24),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Row(
                      children: [
                        Text(
                          "Email",
                          style: GoogleFonts.roboto(
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.0.w),
                          child: Text(
                            "*",
                            style: GoogleFonts.roboto(
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: const Color.fromARGB(255, 255, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 43.0.w,
                    child: TextField(
                      onChanged: (value) => context
                          .read<ProfileScreenController>()
                          .onChangeInputedEmail(value),
                      cursorColor: const Color.fromARGB(255, 24, 24, 24),
                      cursorHeight: 16.0.sp,
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        hintText: "Введіть адресу email",
                        hintStyle: GoogleFonts.roboto(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 180, 180, 180),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.0.w,
                            color: context
                                        .watch<ProfileScreenController>()
                                        .inputedEmail ==
                                    null
                                ? const Color.fromARGB(255, 180, 180, 180)
                                : const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.0.w,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                      ),
                    ),
                  ),
                  context.watch<ProfileScreenController>().emailErrorState
                      ? Padding(
                          padding: EdgeInsets.only(top: 5.0.h),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              context
                                  .read<ProfileScreenController>()
                                  .emailErrorText,
                              style: GoogleFonts.roboto(
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: const Color.fromARGB(255, 255, 0, 0),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Країна перебування",
                        style: GoogleFonts.roboto(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 43.0.w,
                    child: DropdownButton2<String?>(
                      buttonWidth: double.infinity,
                      isExpanded: true,
                      hint: Text(
                        "Виберіть країну перебування",
                        style: GoogleFonts.roboto(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 180, 180, 180),
                        ),
                      ),
                      value: context
                          .watch<ProfileScreenController>()
                          .selectedState,
                      items: context.read<ProfileScreenController>().stateItems,
                      onChanged: (value) => context
                          .read<ProfileScreenController>()
                          .setSelectedState(value),
                      underline: ColoredBox(
                        color: context
                                    .watch<ProfileScreenController>()
                                    .selectedState ==
                                null
                            ? const Color.fromARGB(255, 180, 180, 180)
                            : const Color.fromARGB(255, 24, 24, 24),
                        child: SizedBox(
                          width: double.infinity,
                          height: 1.0.h,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Підстави для в’їзду",
                        style: GoogleFonts.roboto(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                      ),
                    ),
                  ),
                  DropdownButton2<String?>(
                    buttonWidth: double.infinity,
                    isExpanded: true,
                    hint: Text(
                      "Виберіть підставу для в’їзду",
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 180, 180, 180),
                      ),
                    ),
                    value:
                        context.watch<ProfileScreenController>().selectedEntry,
                    items: context.read<ProfileScreenController>().entryItems,
                    onChanged: (value) => context
                        .read<ProfileScreenController>()
                        .setSelectedEntry(value),
                    underline: ColoredBox(
                      color: context
                                  .watch<ProfileScreenController>()
                                  .selectedEntry ==
                              null
                          ? const Color.fromARGB(255, 180, 180, 180)
                          : const Color.fromARGB(255, 24, 24, 24),
                      child: SizedBox(
                        width: double.infinity,
                        height: 1.0.h,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Місто пошуку роботи",
                        style: GoogleFonts.roboto(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => context
                        .read<ProfileScreenController>()
                        .setSelectCityScreenState(),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0.w,
                            color: const Color.fromARGB(255, 180, 180, 180),
                          ),
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 43.0.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Виберіть місто",
                              style: GoogleFonts.roboto(
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: const Color.fromARGB(255, 180, 180, 180),
                              ),
                            ),
                            Transform.rotate(
                              angle: -pi / 2,
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 24.0.w,
                                color: const Color.fromARGB(255, 124, 124, 124),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Володіння польскою мовою",
                        style: GoogleFonts.roboto(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                      ),
                    ),
                  ),
                  DropdownButton2(
                    buttonWidth: double.infinity,
                    isExpanded: true,
                    value: context
                        .watch<ProfileScreenController>()
                        .selectedPolishLevel,
                    hint: Text(
                      "Виберіть рівень",
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 180, 180, 180),
                      ),
                    ),
                    items:
                        context.read<ProfileScreenController>().languangeItems,
                    onChanged: (value) => context
                        .read<ProfileScreenController>()
                        .setSelectedLanguangeLevel("polish", value),
                    underline: ColoredBox(
                      color: context
                                  .watch<ProfileScreenController>()
                                  .selectedPolishLevel ==
                              null
                          ? const Color.fromARGB(255, 180, 180, 180)
                          : const Color.fromARGB(255, 24, 24, 24),
                      child: SizedBox(
                        width: double.infinity,
                        height: 1.0.h,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Володіння англійською мовою",
                        style: GoogleFonts.roboto(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                      ),
                    ),
                  ),
                  DropdownButton2<String?>(
                    buttonWidth: double.infinity,
                    isExpanded: true,
                    value: context
                        .watch<ProfileScreenController>()
                        .selectedEnglishLevel,
                    hint: Text(
                      "Виберіть рівень",
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 180, 180, 180),
                      ),
                    ),
                    items:
                        context.read<ProfileScreenController>().languangeItems,
                    onChanged: (value) => context
                        .read<ProfileScreenController>()
                        .setSelectedLanguangeLevel("english", value),
                    underline: ColoredBox(
                      color: context
                                  .watch<ProfileScreenController>()
                                  .selectedEnglishLevel ==
                              null
                          ? const Color.fromARGB(255, 180, 180, 180)
                          : const Color.fromARGB(255, 24, 24, 24),
                      child: SizedBox(
                        width: double.infinity,
                        height: 1.0.h,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Ваші навички",
                        style: GoogleFonts.roboto(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => context
                        .read<ProfileScreenController>()
                        .setSelectSkillsScreenState(),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0.w,
                            color: const Color.fromARGB(255, 180, 180, 180),
                          ),
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 43.0.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Виберіть свої навички",
                              style: GoogleFonts.roboto(
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: const Color.fromARGB(255, 180, 180, 180),
                              ),
                            ),
                            Transform.rotate(
                              angle: -pi / 2,
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 24.0.w,
                                color: const Color.fromARGB(255, 124, 124, 124),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.0.h),
                    child: InkWell(
                      onTap: context
                              .watch<ProfileScreenController>()
                              .saveProfileButtonState
                          ? () => context
                              .read<ProfileScreenController>()
                              .onClickSaveProfileButton()
                          : null,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0.r),
                          color: context
                                  .watch<ProfileScreenController>()
                                  .saveProfileButtonState
                              ? const Color.fromARGB(255, 24, 24, 24)
                              : const Color.fromARGB(255, 180, 180, 180),
                        ),
                        child: SizedBox(
                          width: 345.0.w,
                          height: 53.0.w,
                          child: Center(
                            child: Text(
                              "Зберегти",
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
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Мій профіль",
                  style: GoogleFonts.roboto(
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    color: const Color.fromARGB(255, 24, 24, 24),
                  ),
                ),
              ),
            ),
          ),
        ),
        context.watch<ProfileScreenController>().selectCityScreenState
            ? const SelectCityScreen()
            : const SizedBox.shrink(),
        context.watch<ProfileScreenController>().selectSkillsScreenState
            ? const SelectSkillsScreen()
            : const SizedBox.shrink(),
        context.watch<ProfileScreenController>().successfullyModalWindow
            ? const ProfileScreenModalWindow()
            : const SizedBox.shrink(),
      ],
    );
  }
}
