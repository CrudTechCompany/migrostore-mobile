// ignore_for_file: use_build_context_synchronously

import 'dart:math';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:migrostore/view/modal_window/successfully_profile_modal_window.dart';
import 'package:migrostore/view/profile_screen/components/profile_select_city_screen.dart';
import 'package:migrostore/view/profile_screen/components/profile_select_city_screen_controller.dart';
import 'package:migrostore/view/profile_screen/components/profile_select_skill_screen.dart';
import 'package:migrostore/view/profile_screen/components/profile_select_skill_screen_controller.dart';
import 'package:migrostore/view/profile_screen/profile_screen_controller.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        if (!Hive.isBoxOpen("userInfo")) {
          await Hive.openBox("userInfo");
        }
        if (context.read<ProfileScreenController>().isInitialized) {
          return;
        } else {
          context.read<ProfileScreenController>().setInitializedState();
          context.read<ProfileScreenController>().setIsInitialized();
        }
      },
    );
    return Stack(
      children: [
        SizedBox(
          width: 375.0.w,
          height: 812.0.h,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 117.0.h),
                  child: Row(
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
                ),
                SizedBox(
                  height: 43.0.w,
                  child: TextField(
                    onTap: () => context
                        .read<ProfileScreenController>()
                        .onClickOutside(),
                    onChanged: (value) => context
                        .read<ProfileScreenController>()
                        .setSendButtonState(),
                    controller:
                        context.read<ProfileScreenController>().nameController,
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
                          width: 1.0.h,
                          color: context
                                  .watch<ProfileScreenController>()
                                  .nameController
                                  .text
                                  .isEmpty
                              ? const Color.fromARGB(255, 180, 180, 180)
                              : const Color.fromARGB(255, 24, 24, 24),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.0.h,
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
                    onTap: () => context
                        .read<ProfileScreenController>()
                        .onClickOutside(),
                    onChanged: (value) => context
                        .read<ProfileScreenController>()
                        .setSendButtonState(),
                    controller: context
                        .read<ProfileScreenController>()
                        .surnameController,
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
                          width: 1.0.h,
                          color: context
                                  .watch<ProfileScreenController>()
                                  .surnameController
                                  .text
                                  .isEmpty
                              ? const Color.fromARGB(255, 180, 180, 180)
                              : const Color.fromARGB(255, 24, 24, 24),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.0.h,
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
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      context.watch<ProfileScreenController>().hintTextState
                          ? Text(
                              "Введіть номер телефону",
                              style: GoogleFonts.roboto(
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: const Color.fromARGB(255, 180, 180, 180),
                              ),
                            )
                          : const SizedBox.shrink(),
                      TextField(
                        onTap: () => context
                            .read<ProfileScreenController>()
                            .setHintTextState(),
                        maxLength: 9,
                        controller: context
                            .read<ProfileScreenController>()
                            .phoneController,
                        onChanged: (value) => context
                            .read<ProfileScreenController>()
                            .setSendButtonState(),
                        cursorColor: const Color.fromARGB(255, 24, 24, 24),
                        cursorHeight: 16.0.sp,
                        style: GoogleFonts.roboto(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                        decoration: InputDecoration(
                          prefix: Text(
                            "+48 ",
                            style: GoogleFonts.roboto(
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: const Color.fromARGB(255, 24, 24, 24),
                            ),
                          ),
                          counterText: "",
                          filled: true,
                          fillColor: Colors.transparent,
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0.w,
                              color: context
                                      .watch<ProfileScreenController>()
                                      .phoneController
                                      .text
                                      .isEmpty
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
                    ],
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
                  onTap: () {
                    context
                        .read<ProfileScreenController>()
                        .onClickSelectDateField(context);
                    FocusScope.of(context).requestFocus(FocusNode());
                    context.read<ProfileScreenController>().onClickOutside();
                  },
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  child: SizedBox(
                    width: double.infinity,
                    height: 43.0.w,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0.h,
                            color: context
                                        .watch<ProfileScreenController>()
                                        .selectedBirthDate ==
                                    null
                                ? const Color.fromARGB(255, 180, 180, 180)
                                : const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            context
                                    .watch<ProfileScreenController>()
                                    .selectedBirthDate ??
                                "Виберіть дату",
                            style: GoogleFonts.roboto(
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: context
                                          .watch<ProfileScreenController>()
                                          .selectedBirthDate ==
                                      null
                                  ? const Color.fromARGB(255, 180, 180, 180)
                                  : const Color.fromARGB(255, 24, 24, 24),
                            ),
                          ),
                          Icon(
                            Icons.calendar_month,
                            size: 24.0.w,
                            color: context
                                        .watch<ProfileScreenController>()
                                        .selectedBirthDate ==
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
                    readOnly: true,
                    onTap: () => context
                        .read<ProfileScreenController>()
                        .onClickOutside(),
                    // onChanged: (value) => context
                    //     .read<ProfileScreenController>()
                    //     .setSendButtonState(),
                    keyboardType: TextInputType.emailAddress,
                    controller:
                        context.read<ProfileScreenController>().emailController,
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
                          width: 1.0.h,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.0.h,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                      ),
                    ),
                  ),
                ),
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
                DropdownButton2<String>(
                  buttonHeight: 55.0.w,
                  buttonWidth: double.infinity,
                  isExpanded: true,
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
                  value: context.read<ProfileScreenController>().selectedState,
                  items: context.read<ProfileScreenController>().stateList,
                  hint: Text(
                    "Виберіть країну перебування",
                    style: GoogleFonts.roboto(
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromARGB(255, 180, 180, 180),
                    ),
                  ),
                  onMenuStateChange: (isOpen) =>
                      context.read<ProfileScreenController>().onClickOutside(),
                  onChanged: (value) => context
                      .read<ProfileScreenController>()
                      .onChangeSelectedState(value),
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
                DropdownButton2<String>(
                  buttonHeight: 55.0.w,
                  buttonWidth: double.infinity,
                  isExpanded: true,
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
                  value: context.read<ProfileScreenController>().selectedEntry,
                  items: context.read<ProfileScreenController>().entryList,
                  hint: Text(
                    "Виберіть підставу для в’їзду",
                    style: GoogleFonts.roboto(
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromARGB(255, 180, 180, 180),
                    ),
                  ),
                  onMenuStateChange: (isOpen) =>
                      context.read<ProfileScreenController>().onClickOutside(),
                  onChanged: (value) => context
                      .read<ProfileScreenController>()
                      .onChangedSelectedEntry(value),
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
                  onTap: () {
                    Provider.of<ProfileScreenController>(context, listen: false)
                        .setSelectCityScreenState();
                    FocusScope.of(context).requestFocus(FocusNode());
                    context.read<ProfileScreenController>().onClickOutside();
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      border: Border(
                        bottom: BorderSide(
                          width: 1.0.w,
                          color: context
                                      .watch<ProfileScreenController>()
                                      .selectedCity ==
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
                          SizedBox(
                            width: 320.0.w,
                            child: Text(
                              context
                                      .watch<ProfileScreenController>()
                                      .selectedCity ??
                                  "Виберіть місто",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: context
                                            .watch<ProfileScreenController>()
                                            .selectedCity ==
                                        null
                                    ? const Color.fromARGB(255, 180, 180, 180)
                                    : const Color.fromARGB(255, 24, 24, 24),
                              ),
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
                DropdownButton2<String>(
                  buttonHeight: 55.0.w,
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
                  value: context
                      .watch<ProfileScreenController>()
                      .selectedPolishLevel,
                  items: context.read<ProfileScreenController>().levelList,
                  onMenuStateChange: (isOpen) =>
                      context.read<ProfileScreenController>().onClickOutside(),
                  onChanged: (value) => context
                      .read<ProfileScreenController>()
                      .onChangedPolishOrEnglishLevel("polish", value),
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
                DropdownButton2<String>(
                  buttonHeight: 55.0.w,
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
                  value: context
                      .watch<ProfileScreenController>()
                      .selectedEnglishLevel,
                  items: context.read<ProfileScreenController>().levelList,
                  onMenuStateChange: (isOpen) =>
                      context.read<ProfileScreenController>().onClickOutside(),
                  onChanged: (value) => context
                      .read<ProfileScreenController>()
                      .onChangedPolishOrEnglishLevel("english", value),
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
                  onTap: () {
                    context
                        .read<ProfileScreenController>()
                        .setSelectSkillScreenState();
                    FocusScope.of(context).requestFocus(FocusNode());
                    context.read<ProfileScreenController>().onClickOutside();
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      border: Border(
                        bottom: BorderSide(
                          width: 1.0.w,
                          color: context
                                      .watch<ProfileScreenController>()
                                      .selectedSkill ==
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
                          SizedBox(
                            width: 320.0.w,
                            child: Text(
                              context
                                      .watch<ProfileScreenController>()
                                      .selectedSkill ??
                                  "Виберіть свої навички",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: context
                                            .watch<ProfileScreenController>()
                                            .selectedSkill ==
                                        null
                                    ? const Color.fromARGB(255, 180, 180, 180)
                                    : const Color.fromARGB(255, 24, 24, 24),
                              ),
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
                    onTap:
                        context.watch<ProfileScreenController>().sentButtonState
                            ? () => context
                                .read<ProfileScreenController>()
                                .onClickSendButton()
                            : null,
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0.w),
                        color: context
                                .watch<ProfileScreenController>()
                                .sentButtonState
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
            ? ChangeNotifierProvider(
                create: (_) => ProfileSelectCityScreenController(),
                child: const ProfileSelectCityScreen(),
              )
            : const SizedBox.shrink(),
        context.watch<ProfileScreenController>().selectSkillScreenState
            ? ChangeNotifierProvider(
                create: (_) => ProfileSelectSkillScreenController(),
                child: const ProfileSelectSkillScreen(),
              )
            : const SizedBox.shrink(),
        context.watch<ProfileScreenController>().successfullyModalWindowState
            ? const SuccessfullyProfileModalWindow()
            : const SizedBox.shrink(),
      ],
    );
  }
}
