import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/resume_screen/resume_screen_controller.dart';
import 'package:provider/provider.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Освіта",
                    style: GoogleFonts.roboto(
                      fontSize: 26.0.sp,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromARGB(255, 24, 24, 24),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0.h),
                    child: Text(
                      "Будь ласка, заповнюйте польською мовою",
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 122, 122, 122),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0.h,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Спеціальність",
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
                          .read<ResumeScreenController>()
                          .setAddEducationButtonState(),
                      controller: context
                          .read<ResumeScreenController>()
                          .specialityController,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(
                          RegExp("[а-яА-ЯёЁïÏ]"),
                        ),
                      ],
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
                        hintText: "Введіть спеціальність",
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
                                    .watch<ResumeScreenController>()
                                    .specialityController
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
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0.h,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Назва установи",
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
                          .read<ResumeScreenController>()
                          .setAddEducationButtonState(),
                      controller: context
                          .read<ResumeScreenController>()
                          .institutionControlller,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(
                          RegExp("[а-яА-ЯёЁïÏ]"),
                        ),
                      ],
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
                        hintText: "Введіть назву установи",
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
                                    .watch<ResumeScreenController>()
                                    .institutionControlller
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
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0.h,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Рівень освіти",
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
                          .read<ResumeScreenController>()
                          .setAddEducationButtonState(),
                      controller: context
                          .read<ResumeScreenController>()
                          .educationLevelControlller,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(
                          RegExp("[а-яА-ЯёЁïÏ]"),
                        ),
                      ],
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
                        hintText: "Введіть рівень освіти",
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
                                    .watch<ResumeScreenController>()
                                    .educationLevelControlller
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
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0.h,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Дата початку",
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
                        .read<ResumeScreenController>()
                        .onClickStartEndEducationDate(context, "start_date"),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0.w,
                            color: context
                                        .watch<ResumeScreenController>()
                                        .startEducationDate ==
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
                                      .watch<ResumeScreenController>()
                                      .startEducationDate ??
                                  "Оберіть дату початку",
                              style: GoogleFonts.roboto(
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: context
                                            .watch<ResumeScreenController>()
                                            .startEducationDate ==
                                        null
                                    ? const Color.fromARGB(255, 180, 180, 180)
                                    : const Color.fromARGB(255, 24, 24, 24),
                              ),
                            ),
                            Icon(
                              Icons.calendar_month,
                              size: 24.0.w,
                              color: context
                                          .watch<ResumeScreenController>()
                                          .startEducationDate ==
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
                    padding: EdgeInsets.only(
                      top: 20.0.h,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Дата закінчення",
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
                    onTap: context
                            .watch<ResumeScreenController>()
                            .educationScreenCheckBoxState
                        ? null
                        : () => context
                            .read<ResumeScreenController>()
                            .onClickStartEndEducationDate(context, "end_date"),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0.w,
                            color: context
                                        .watch<ResumeScreenController>()
                                        .endEducationDate ==
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
                                      .watch<ResumeScreenController>()
                                      .endEducationDate ??
                                  "Оберіть дату закінчення",
                              style: GoogleFonts.roboto(
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: context
                                            .watch<ResumeScreenController>()
                                            .endEducationDate ==
                                        null
                                    ? const Color.fromARGB(255, 180, 180, 180)
                                    : const Color.fromARGB(255, 24, 24, 24),
                              ),
                            ),
                            Icon(
                              Icons.calendar_month,
                              size: 24.0.w,
                              color: context
                                          .watch<ResumeScreenController>()
                                          .endEducationDate ==
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
                        SizedBox(
                          width: 20.0.w,
                          height: 20.0.w,
                          child: Checkbox(
                            activeColor: const Color.fromARGB(255, 24, 24, 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0.w),
                            ),
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            value: context
                                .watch<ResumeScreenController>()
                                .educationScreenCheckBoxState,
                            onChanged: (value) => context
                                .read<ResumeScreenController>()
                                .setEducationScreenCheckBoxState(value),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0.w),
                          child: Text(
                            "Я все ще тут навчаюсь",
                            style: GoogleFonts.roboto(
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: const Color.fromARGB(255, 24, 24, 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30.0.h,
                    ),
                    child: InkWell(
                      onTap: context
                              .watch<ResumeScreenController>()
                              .addEducationButtonState
                          ? () => context
                              .read<ResumeScreenController>()
                              .onClickAddEducationButton()
                          : null,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0.r),
                          color: context
                                  .watch<ResumeScreenController>()
                                  .addEducationButtonState
                              ? const Color.fromARGB(255, 24, 24, 24)
                              : const Color.fromARGB(255, 180, 180, 180),
                        ),
                        child: SizedBox(
                          width: 345.0.w,
                          height: 53.0.w,
                          child: Center(
                            child: Text(
                              "Додати",
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
                      onTap: () => context
                          .read<ResumeScreenController>()
                          .setEducationScreenState(),
                      child: Icon(
                        Icons.arrow_back,
                        size: 24.0.w,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Освіта",
                      style: GoogleFonts.roboto(
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.w500,
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
      ],
    );
  }
}
