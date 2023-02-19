import 'dart:math';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/main_screen/main_screen_controller.dart';
import 'package:migrostore/view/menu_screen/menu_screen_controller.dart';
import 'package:migrostore/view/modal_window/successfully_work_modal_window.dart';
import 'package:migrostore/view/modal_window/work_screen_initial_modal_window.dart';
import 'package:migrostore/view/select_city_screen/select_city_controller.dart';
import 'package:migrostore/view/select_city_screen/select_city_screen.dart';
import 'package:migrostore/view/select_skill_screen/select_skill_screen.dart';
import 'package:migrostore/view/select_skill_screen/select_skill_screen_controller.dart';
import 'package:migrostore/view/work_screen/work_screen_controller.dart';
import 'package:provider/provider.dart';

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
              controller: context.read<WorkScreenController>().scrollController,
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
                      onTap: () =>
                          context.read<WorkScreenController>().onClickOutside(),
                      onChanged: (value) => context
                          .read<WorkScreenController>()
                          .setSendButtonState(),
                      controller:
                          context.read<WorkScreenController>().nameController,
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
                                    .watch<WorkScreenController>()
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
                      onTap: () =>
                          context.read<WorkScreenController>().onClickOutside(),
                      onChanged: (value) => context
                          .read<WorkScreenController>()
                          .setSendButtonState(),
                      controller: context
                          .read<WorkScreenController>()
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
                                    .watch<WorkScreenController>()
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
                        context.watch<WorkScreenController>().hintTextState
                            ? Text(
                                "Введіть номер телефону",
                                style: GoogleFonts.roboto(
                                  fontSize: 16.0.sp,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color:
                                      const Color.fromARGB(255, 180, 180, 180),
                                ),
                              )
                            : const SizedBox.shrink(),
                        TextField(
                          onTap: () => context
                              .read<WorkScreenController>()
                              .setHintTextState(),
                          maxLength: 9,
                          controller: context
                              .read<WorkScreenController>()
                              .phoneController,
                          onChanged: (value) => context
                              .read<WorkScreenController>()
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
                                        .watch<WorkScreenController>()
                                        .invalidPhoneState
                                    ? const Color.fromARGB(255, 255, 0, 0)
                                    : context
                                            .watch<WorkScreenController>()
                                            .phoneController
                                            .text
                                            .isEmpty
                                        ? const Color.fromARGB(
                                            255, 180, 180, 180)
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
                  context.watch<WorkScreenController>().invalidPhoneState
                      ? Padding(
                          padding: EdgeInsets.only(top: 2.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                context
                                    .read<WorkScreenController>()
                                    .invalidPhoneMessage!,
                                style: GoogleFonts.roboto(
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: const Color.fromARGB(255, 255, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
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
                          .read<WorkScreenController>()
                          .onClickSelectDateField(context);
                      FocusScope.of(context).requestFocus(FocusNode());
                      context.read<WorkScreenController>().onClickOutside();
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
                                          .watch<WorkScreenController>()
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
                                          .watch<WorkScreenController>()
                                          .selectedBirthDate ==
                                      null
                                  ? "Виберіть дату"
                                  : context
                                      .read<WorkScreenController>()
                                      .selectedBirthDate!,
                              style: GoogleFonts.roboto(
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: context
                                            .watch<WorkScreenController>()
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
                                          .watch<WorkScreenController>()
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
                      onTap: () =>
                          context.read<WorkScreenController>().onClickOutside(),
                      onChanged: (value) => context
                          .read<WorkScreenController>()
                          .setSendButtonState(),
                      keyboardType: TextInputType.emailAddress,
                      controller:
                          context.read<WorkScreenController>().emailController,
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
                            color: context
                                    .watch<WorkScreenController>()
                                    .invalidEmailState
                                ? const Color.fromARGB(255, 255, 0, 0)
                                : context
                                        .watch<WorkScreenController>()
                                        .emailController
                                        .text
                                        .isEmpty
                                    ? const Color.fromARGB(255, 180, 180, 180)
                                    : const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.0.h,
                            color: context
                                    .watch<WorkScreenController>()
                                    .invalidEmailState
                                ? const Color.fromARGB(255, 255, 0, 0)
                                : const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                      ),
                    ),
                  ),
                  context.watch<WorkScreenController>().invalidEmailState
                      ? Padding(
                          padding: EdgeInsets.only(top: 2.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                context
                                    .read<WorkScreenController>()
                                    .invalidEmailMessage!,
                                style: GoogleFonts.roboto(
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: const Color.fromARGB(255, 255, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
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
                  ),
                  DropdownButton2<String>(
                    buttonHeight: 55.0.w,
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
                    onMenuStateChange: (isOpen) {
                      context.read<WorkScreenController>().onClickOutside();
                    },
                    onChanged: (value) => context
                        .read<WorkScreenController>()
                        .onChangeSelectedState(value),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
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
                  ),
                  DropdownButton2<String>(
                    buttonHeight: 55.0.w,
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
                    onMenuStateChange: (isOpen) {
                      context.read<WorkScreenController>().onClickOutside();
                    },
                    onChanged: (value) => context
                        .read<WorkScreenController>()
                        .onChangedSelectedEntry(value),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
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
                  ),
                  InkWell(
                    onTap: () {
                      Provider.of<WorkScreenController>(context, listen: false)
                          .setSelectCityScreenState();
                      FocusScope.of(context).requestFocus(FocusNode());
                      context.read<WorkScreenController>().onClickOutside();
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0.w,
                            color: context
                                        .watch<WorkScreenController>()
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
                                        .watch<WorkScreenController>()
                                        .selectedCity ??
                                    "Виберіть місто",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                  fontSize: 16.0.sp,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: context
                                              .watch<WorkScreenController>()
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
                                  .watch<WorkScreenController>()
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
                        .watch<WorkScreenController>()
                        .selectedPolishLevel,
                    items: context.read<WorkScreenController>().levelList,
                    onMenuStateChange: (isOpen) {
                      context.read<WorkScreenController>().onClickOutside();
                    },
                    onChanged: (value) => context
                        .read<WorkScreenController>()
                        .onChangedPolishOrEnglishLevel("polish", value),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
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
                                  .watch<WorkScreenController>()
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
                        .watch<WorkScreenController>()
                        .selectedEnglishLevel,
                    items: context.read<WorkScreenController>().levelList,
                    onMenuStateChange: (isOpen) {
                      context.read<WorkScreenController>().onClickOutside();
                    },
                    onChanged: (value) => context
                        .read<WorkScreenController>()
                        .onChangedPolishOrEnglishLevel("english", value),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
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
                  ),
                  InkWell(
                    onTap: () {
                      context
                          .read<WorkScreenController>()
                          .setSelectSkillScreenState();
                      FocusScope.of(context).requestFocus(FocusNode());
                      context.read<WorkScreenController>().onClickOutside();
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0.w,
                            color: context
                                        .watch<WorkScreenController>()
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
                                        .watch<WorkScreenController>()
                                        .selectedSkill ??
                                    "Виберіть свої навички",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                  fontSize: 16.0.sp,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: context
                                              .watch<WorkScreenController>()
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
                          context.watch<WorkScreenController>().sentButtonState
                              ? () => context
                                  .read<WorkScreenController>()
                                  .onClickSendButton(context)
                              : null,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0.w),
                          color: context
                                  .watch<WorkScreenController>()
                                  .sentButtonState
                              ? const Color.fromARGB(255, 24, 24, 24)
                              : const Color.fromARGB(255, 180, 180, 180),
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
                      onTap: () {
                        context
                            .read<MenuScreenController>()
                            .setWorkScreenState();
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
            ? const WorkScreenInitialModalWindow()
            : const SizedBox.shrink(),
        context.watch<WorkScreenController>().selectCityScreenState
            ? ChangeNotifierProvider(
                create: (_) => SelectCityScreenController(),
                child: const SelectCityScreen(),
              )
            : const SizedBox.shrink(),
        context.watch<WorkScreenController>().selectSkillScreenState
            ? ChangeNotifierProvider(
                create: (_) => SelectSkillScreenController(),
                child: const SelectSkillScreen(),
              )
            : const SizedBox.shrink(),
        context.watch<WorkScreenController>().successfullyModalWindowState
            ? const SuccessfullyWorkModalWindow()
            : const SizedBox.shrink(),
      ],
    );
  }
}
