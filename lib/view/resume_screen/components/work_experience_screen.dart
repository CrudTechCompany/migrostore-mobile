import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/resume_screen/resume_screen_controller.dart';
import 'package:provider/provider.dart';

class WorkExperienceScreen extends StatelessWidget {
  const WorkExperienceScreen({super.key});

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
                    "Досвід роботи",
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
                          "Посада",
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
                      controller: context
                          .read<ResumeScreenController>()
                          .positionController,
                      onChanged: (value) => context
                          .read<ResumeScreenController>()
                          .setAddWorkExperienceButtonState(),
                      cursorColor: const Color.fromARGB(255, 24, 24, 24),
                      cursorHeight: 16.0.sp,
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(
                          RegExp("[а-яА-ЯёЁïÏ]"),
                        ),
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        contentPadding: EdgeInsets.zero,
                        hintText: "Введіть посаду",
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
                                    .positionController
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
                          "Назва фірми",
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
                      controller: context
                          .read<ResumeScreenController>()
                          .companyController,
                      onChanged: (value) => context
                          .read<ResumeScreenController>()
                          .setAddWorkExperienceButtonState(),
                      cursorColor: const Color.fromARGB(255, 24, 24, 24),
                      cursorHeight: 16.0.sp,
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(
                          RegExp("[а-яА-ЯёЁïÏ]"),
                        ),
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        contentPadding: EdgeInsets.zero,
                        hintText: "Введіть назву фірми",
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
                                    .companyController
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
                        .onClickStartEndDateField(context, "start_date"),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0.w,
                            color: context
                                        .watch<ResumeScreenController>()
                                        .selectedStartDate ==
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
                                      .selectedStartDate ??
                                  "Оберіть дату початку",
                              style: GoogleFonts.roboto(
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: context
                                            .watch<ResumeScreenController>()
                                            .selectedStartDate ==
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
                                          .selectedStartDate ==
                                      null
                                  ? const Color.fromARGB(255, 180, 180, 180)
                                  : const Color.fromARGB(255, 24, 24, 24),
                            )
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
                    onTap: context.watch<ResumeScreenController>().checkBoxState
                        ? null
                        : () => context
                            .read<ResumeScreenController>()
                            .onClickStartEndDateField(context, "end_date"),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0.w,
                            color: context
                                        .watch<ResumeScreenController>()
                                        .selectedEndDate ==
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
                                      .selectedEndDate ??
                                  "Оберіть дату закінчення",
                              style: GoogleFonts.roboto(
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: context
                                            .watch<ResumeScreenController>()
                                            .selectedEndDate ==
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
                                          .selectedEndDate ==
                                      null
                                  ? const Color.fromARGB(255, 180, 180, 180)
                                  : const Color.fromARGB(255, 24, 24, 24),
                            )
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
                      mainAxisAlignment: MainAxisAlignment.start,
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
                                .checkBoxState,
                            onChanged: (value) => context
                                .read<ResumeScreenController>()
                                .setCheckBoxState(value),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0.w),
                          child: Text(
                            "Я все ще тут працюю",
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
                      top: 100.0.h,
                    ),
                    child: InkWell(
                      onTap: context
                              .watch<ResumeScreenController>()
                              .addWorkExperienceButtonState
                          ? () => context
                              .read<ResumeScreenController>()
                              .onClickAddWorkExperienceButton()
                          : null,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0.r),
                          color: context
                                  .watch<ResumeScreenController>()
                                  .addWorkExperienceButtonState
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
                          .setAddWorkExperienceScreenState(),
                      child: Icon(
                        Icons.arrow_back,
                        size: 24.0.w,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Досвід роботи",
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
