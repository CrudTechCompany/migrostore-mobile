import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/main_screen/main_screen_controller.dart';
import 'package:migrostore/view/modal_window/work_initial_modal_window.dart';
import 'package:migrostore/view/work_screen/components/work_select_city_screen.dart';
import 'package:migrostore/view/work_screen/work_screen_controller.dart';
import 'package:provider/provider.dart';

import 'components/work_select_skill_screen.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({super.key});

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
                top: 117.0.h,
                left: 15.0.w,
                right: 15.0.w,
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
                          .read<WorkScreenController>()
                          .onChangedInputedName(value),
                      cursorColor: const Color.fromARGB(255, 24, 24, 24),
                      cursorHeight: 16.0.sp,
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        contentPadding: EdgeInsets.zero,
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
                                        .watch<WorkScreenController>()
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
                          .read<WorkScreenController>()
                          .onChangedInputedSurName(value),
                      cursorColor: const Color.fromARGB(255, 24, 24, 24),
                      cursorHeight: 16.0.sp,
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        contentPadding: EdgeInsets.zero,
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
                                        .watch<WorkScreenController>()
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
                          "Номер телефону",
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
                          .read<WorkScreenController>()
                          .onChangedInputedPhoneNumber(value),
                      cursorColor: const Color.fromARGB(255, 24, 24, 24),
                      cursorHeight: 16.0.sp,
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        contentPadding: EdgeInsets.zero,
                        hintText: "Введіть номер телефону",
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
                                        .watch<WorkScreenController>()
                                        .inputedPhoneNumber ==
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
                        .read<WorkScreenController>()
                        .setSelectedDate(context),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0.w,
                            color: context
                                        .watch<WorkScreenController>()
                                        .selectedDate ==
                                    null
                                ? const Color.fromARGB(255, 180, 180, 180)
                                : const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 43.0.w,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                context
                                        .watch<WorkScreenController>()
                                        .selectedDate ??
                                    "Виберіть дату",
                                style: GoogleFonts.roboto(
                                  fontSize: 16.0.sp,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: context
                                              .watch<WorkScreenController>()
                                              .selectedDate ==
                                          null
                                      ? const Color.fromARGB(255, 180, 180, 180)
                                      : const Color.fromARGB(255, 24, 24, 24),
                                ),
                              ),
                              Icon(
                                Icons.calendar_month_outlined,
                                size: 24.0.w,
                                color: context
                                            .watch<WorkScreenController>()
                                            .selectedDate ==
                                        null
                                    ? const Color.fromARGB(255, 180, 180, 180)
                                    : const Color.fromARGB(255, 24, 24, 24),
                              ),
                            ],
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
                          .read<WorkScreenController>()
                          .onChangedInputedEmail(value),
                      cursorColor: const Color.fromARGB(255, 24, 24, 24),
                      cursorHeight: 16.0.sp,
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        contentPadding: EdgeInsets.zero,
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
                                        .watch<WorkScreenController>()
                                        .inputedPhoneNumber ==
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
                          "Країна перебування",
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
                  DropdownButton2<String>(
                    buttonWidth: double.infinity,
                    isExpanded: true,
                    underline: ColoredBox(
                      color:
                          context.watch<WorkScreenController>().selectedState ==
                                  null
                              ? const Color.fromARGB(255, 180, 180, 180)
                              : const Color.fromARGB(255, 24, 24, 24),
                      child: SizedBox(
                        width: double.infinity,
                        height: 1.0.h,
                      ),
                    ),
                    value: context.read<WorkScreenController>().selectedState,
                    items: context.read<WorkScreenController>().stateList,
                    hint: Text(
                      "Виберіть країну перебування",
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 180, 180, 180),
                      ),
                    ),
                    onChanged: (value) => context
                        .read<WorkScreenController>()
                        .onChangedSelectedState(value),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Row(
                      children: [
                        Text(
                          "Підстави для в’їзду",
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
                  DropdownButton2<String>(
                    buttonWidth: double.infinity,
                    isExpanded: true,
                    underline: ColoredBox(
                      color:
                          context.watch<WorkScreenController>().selectedEntry ==
                                  null
                              ? const Color.fromARGB(255, 180, 180, 180)
                              : const Color.fromARGB(255, 24, 24, 24),
                      child: SizedBox(
                        width: double.infinity,
                        height: 1.0.h,
                      ),
                    ),
                    value: context.read<WorkScreenController>().selectedEntry,
                    items: context.read<WorkScreenController>().entryList,
                    hint: Text(
                      "Виберіть підставу для в’їзду",
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 180, 180, 180),
                      ),
                    ),
                    onChanged: (value) => context
                        .read<WorkScreenController>()
                        .onChangedSelectedEntry(value),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Row(
                      children: [
                        Text(
                          "Місто пошуку роботи",
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
                        .read<WorkScreenController>()
                        .setSelectCityScreenState(),
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
                    child: Row(
                      children: [
                        Text(
                          "Володіння польскою мовою",
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
                  DropdownButton2<String>(
                    buttonWidth: double.infinity,
                    isExpanded: true,
                    hint: Text(
                      "Виберіть рівень",
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 180, 180, 180),
                      ),
                    ),
                    value: context
                        .watch<WorkScreenController>()
                        .selectedPolishLevel,
                    items: context.read<WorkScreenController>().levelList,
                    onChanged: (value) {},
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Row(
                      children: [
                        Text(
                          "Володіння англійською мовою",
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
                  DropdownButton2<String>(
                    buttonWidth: double.infinity,
                    isExpanded: true,
                    hint: Text(
                      "Виберіть рівень",
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 180, 180, 180),
                      ),
                    ),
                    value: context
                        .watch<WorkScreenController>()
                        .selectedPolishLevel,
                    items: context.read<WorkScreenController>().levelList,
                    onChanged: (value) {},
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Row(
                      children: [
                        Text(
                          "Ваші навички",
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
                        .read<WorkScreenController>()
                        .setSelectSkillScreenState(),
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
                            "Вислати",
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
                          .read<MainScreenController>()
                          .setWorkScreenState(),
                      child: Icon(
                        Icons.arrow_back,
                        size: 24.0.w,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Робота",
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
        context.watch<WorkScreenController>().initialModalWindowState
            ? const WorkInitialModalWindow()
            : const SizedBox.shrink(),
        context.watch<WorkScreenController>().selectCityScreenState
            ? const WorkSelectCityScreen()
            : const SizedBox.shrink(),
        context.watch<WorkScreenController>().selectSkillScreenState
            ? const WorkSelectSkillScreen()
            : const SizedBox.shrink(),
      ],
    );
  }
}
