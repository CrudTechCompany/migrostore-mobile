import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/resume_screen/resume_screen_controller.dart';
import 'package:provider/provider.dart';

class ResumeStepTwo extends StatelessWidget {
  const ResumeStepTwo({super.key});

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
              controller: context
                  .read<ResumeScreenController>()
                  .stepTwoScrollController,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.only(top: 170.0.h),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20.0.h),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Основна інформація",
                              style: GoogleFonts.roboto(
                                fontSize: 26.0.sp,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: const Color.fromARGB(255, 24, 24, 24),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0.h),
                          child: Align(
                            alignment: Alignment.centerLeft,
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20.0.h,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                context
                                            .watch<ResumeScreenController>()
                                            .pickedImage ==
                                        null
                                    ? SizedBox(
                                        width: 60.0.w,
                                        height: 80.0.w,
                                        child: Center(
                                          child: SvgPicture.asset(
                                            "assets/default_avatar.svg",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    : Image.file(
                                        context
                                            .read<ResumeScreenController>()
                                            .pickedImage!,
                                        fit: BoxFit.fill,
                                        filterQuality: FilterQuality.high,
                                        width: 60.0.w,
                                        height: 80.0.w,
                                      ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20.0.w),
                                  child: context
                                              .watch<ResumeScreenController>()
                                              .pickedImage ==
                                          null
                                      ? InkWell(
                                          onTap: () => context
                                              .read<ResumeScreenController>()
                                              .onClickPickImage(context),
                                          overlayColor:
                                              MaterialStateProperty.all(
                                                  Colors.transparent),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .file_download_outlined,
                                                    size: 24.0.w,
                                                    color: const Color.fromARGB(
                                                        255, 24, 24, 24),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.0.w),
                                                    child: Text(
                                                      "Завантажити фото\n(не обов’язково)",
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 14.0.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 24, 24, 24),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      : Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () => context
                                                  .read<
                                                      ResumeScreenController>()
                                                  .deletePickedImage(context),
                                              overlayColor:
                                                  MaterialStateProperty.all(
                                                      Colors.transparent),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                    width: 16.0.w,
                                                    height: 16.0.w,
                                                    child: SvgPicture.asset(
                                                      "assets/delete_icon.svg",
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.0.w),
                                                    child: Text(
                                                      "Видалити фото",
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 14.0.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 24, 24, 24),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 15.0.h),
                                              child: InkWell(
                                                onTap: () => context
                                                    .read<
                                                        ResumeScreenController>()
                                                    .onClickPickImage(context),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    SizedBox(
                                                      width: 16.0.w,
                                                      height: 16.0.w,
                                                      child: SvgPicture.asset(
                                                        "assets/edit_icon.svg",
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8.0.w),
                                                      child: Text(
                                                        "Змінити фото",
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontSize: 14.0.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          color: const Color
                                                                  .fromARGB(
                                                              255, 24, 24, 24),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.0.h),
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
                                .read<ResumeScreenController>()
                                .onClickOutSidePhoneNumberField(),
                            controller: context
                                .read<ResumeScreenController>()
                                .nameController,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                RegExp("[а-яА-ЯёЁïÏ0-9]"),
                              ),
                            ],
                            onChanged: (value) => context
                                .read<ResumeScreenController>()
                                .setStepTwoScreenNextButtonState(),
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
                              fillColor:
                                  const Color.fromARGB(255, 255, 255, 255),
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
                                          .watch<ResumeScreenController>()
                                          .nameController
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
                                .read<ResumeScreenController>()
                                .onClickOutSidePhoneNumberField(),
                            controller: context
                                .read<ResumeScreenController>()
                                .surNameController,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                RegExp("[а-яА-ЯёЁïÏ0-9]"),
                              ),
                            ],
                            onChanged: (value) => context
                                .read<ResumeScreenController>()
                                .setStepTwoScreenNextButtonState(),
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
                              fillColor:
                                  const Color.fromARGB(255, 255, 255, 255),
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
                                          .watch<ResumeScreenController>()
                                          .surNameController
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
                              .read<ResumeScreenController>()
                              .onClickBirthDayField(context),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.0.w,
                                  color: context
                                              .watch<ResumeScreenController>()
                                              .selectedBirthDayDate ==
                                          null
                                      ? const Color.fromARGB(255, 180, 180, 180)
                                      : const Color.fromARGB(255, 24, 24, 24),
                                ),
                              ),
                            ),
                            child: SizedBox(
                              width: 375.0.w,
                              height: 43.0.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    context
                                            .watch<ResumeScreenController>()
                                            .selectedBirthDayDate ??
                                        "Виберіть дату",
                                    style: GoogleFonts.roboto(
                                      fontSize: 16.0.sp,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color: context
                                                  .watch<
                                                      ResumeScreenController>()
                                                  .selectedBirthDayDate ==
                                              null
                                          ? const Color.fromARGB(
                                              255, 180, 180, 180)
                                          : const Color.fromARGB(
                                              255, 24, 24, 24),
                                    ),
                                  ),
                                  Icon(
                                    Icons.calendar_month,
                                    size: 24.0.w,
                                    color: context
                                                .watch<ResumeScreenController>()
                                                .selectedBirthDayDate ==
                                            null
                                        ? const Color.fromARGB(
                                            255, 180, 180, 180)
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
                            onTap: () => context
                                .read<ResumeScreenController>()
                                .onClickOutSidePhoneNumberField(),
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                RegExp("[а-яА-ЯïÏëË]"),
                              ),
                            ],
                            controller: context
                                .read<ResumeScreenController>()
                                .emailController,
                            onChanged: (value) => context
                                .read<ResumeScreenController>()
                                .setStepTwoScreenNextButtonState(),
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
                              fillColor:
                                  const Color.fromARGB(255, 255, 255, 255),
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
                                          .watch<ResumeScreenController>()
                                          .emailErrorState
                                      ? const Color.fromARGB(255, 255, 0, 0)
                                      : context
                                              .watch<ResumeScreenController>()
                                              .emailController
                                              .text
                                              .isEmpty
                                          ? const Color.fromARGB(
                                              255, 180, 180, 180)
                                          : const Color.fromARGB(
                                              255, 24, 24, 24),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.0.w,
                                  color: context
                                          .watch<ResumeScreenController>()
                                          .emailErrorState
                                      ? const Color.fromARGB(255, 255, 0, 0)
                                      : const Color.fromARGB(255, 24, 24, 24),
                                ),
                              ),
                            ),
                          ),
                        ),
                        context.watch<ResumeScreenController>().emailErrorState
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 5.0.h),
                                  child: Text(
                                    context
                                        .read<ResumeScreenController>()
                                        .emailErrorText,
                                    style: GoogleFonts.roboto(
                                      fontSize: 12.0.sp,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color:
                                          const Color.fromARGB(255, 255, 0, 0),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
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
                            onTap: () => context
                                .read<ResumeScreenController>()
                                .onClickPhoneNumberFiled(),
                            controller: context
                                .read<ResumeScreenController>()
                                .phoneController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) => context
                                .read<ResumeScreenController>()
                                .setStepTwoScreenNextButtonState(),
                            keyboardType: const TextInputType.numberWithOptions(
                              signed: true,
                            ),
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
                              fillColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              contentPadding: EdgeInsets.zero,
                              prefix: context
                                      .watch<ResumeScreenController>()
                                      .phoneNumberPrefixState
                                  ? Text(
                                      "+ ",
                                      style: GoogleFonts.roboto(
                                        fontSize: 16.0.sp,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: const Color.fromARGB(
                                            255, 24, 24, 24),
                                      ),
                                    )
                                  : null,
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
                                          .watch<ResumeScreenController>()
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
                        DropdownButton2(
                          onMenuStateChange: (isOpen) => context
                              .read<ResumeScreenController>()
                              .onClickOutSidePhoneNumberField(),
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
                          underline: ColoredBox(
                            color: context
                                        .watch<ResumeScreenController>()
                                        .selectedState ==
                                    null
                                ? const Color.fromARGB(255, 180, 180, 180)
                                : const Color.fromARGB(255, 24, 24, 24),
                            child: SizedBox(
                              width: double.infinity,
                              height: 1.0.h,
                            ),
                          ),
                          value: context
                              .watch<ResumeScreenController>()
                              .selectedState,
                          items:
                              context.read<ResumeScreenController>().stateList,
                          onChanged: (value) => context
                              .read<ResumeScreenController>()
                              .setSelectedState(value),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.0.h),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Володіння мовами",
                              style: GoogleFonts.roboto(
                                fontSize: 18.0.sp,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: const Color.fromARGB(255, 24, 24, 24),
                              ),
                            ),
                          ),
                        ),
                        ListView.builder(
                          padding: EdgeInsets.only(
                            top: 20.0.h,
                          ),
                          itemCount: context
                              .read<ResumeScreenController>()
                              .addedLanguagesList
                              .length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: index == 0
                                  ? EdgeInsets.zero
                                  : EdgeInsets.only(top: 10.0.h),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        context
                                            .read<ResumeScreenController>()
                                            .addedLanguagesList
                                            .keys
                                            .toList()[index],
                                        style: GoogleFonts.roboto(
                                          fontSize: 16.0.sp,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          color: const Color.fromARGB(
                                              255, 122, 122, 122),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => context
                                            .read<ResumeScreenController>()
                                            .onClickDeleteLanguageIcon(
                                                context, index),
                                        overlayColor: MaterialStateProperty.all(
                                            Colors.transparent),
                                        child: Icon(
                                          Icons.close,
                                          size: 24.0.w,
                                          color: const Color.fromARGB(
                                              255, 255, 0, 0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 15.0.h),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Рівень",
                                          style: GoogleFonts.roboto(
                                            fontSize: 12.0.sp,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            color: const Color.fromARGB(
                                                255, 24, 24, 24),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  DropdownButton2<String>(
                                    onMenuStateChange: (isOpen) => context
                                        .read<ResumeScreenController>()
                                        .onClickOutSidePhoneNumberField(),
                                    value: context
                                        .watch<ResumeScreenController>()
                                        .addedLanguagesList
                                        .values
                                        .toList()[index],
                                    buttonWidth: double.infinity,
                                    isExpanded: true,
                                    hint: Text(
                                      "Виберіть рівень",
                                      style: GoogleFonts.roboto(
                                        fontSize: 16.0.sp,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: const Color.fromARGB(
                                            255, 180, 180, 180),
                                      ),
                                    ),
                                    underline: ColoredBox(
                                      color: context
                                                  .watch<
                                                      ResumeScreenController>()
                                                  .addedLanguagesList
                                                  .values
                                                  .toList()[index] ==
                                              null
                                          ? const Color.fromARGB(
                                              255, 180, 180, 180)
                                          : const Color.fromARGB(
                                              255, 24, 24, 24),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 1.0.h,
                                      ),
                                    ),
                                    items: context
                                        .read<ResumeScreenController>()
                                        .languageLevelList,
                                    onChanged: (value) => context
                                        .read<ResumeScreenController>()
                                        .onClickLanguageLevelListItem(
                                            value, index),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0.h),
                          child: InkWell(
                            onTap: () => context
                                .read<ResumeScreenController>()
                                .setSelectLanguageScreenState(context),
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0.r),
                                border: Border.all(
                                  width: 1.0.w,
                                  style: BorderStyle.solid,
                                  color: const Color.fromARGB(255, 24, 24, 24),
                                ),
                              ),
                              child: SizedBox(
                                width: 345.0.w,
                                height: 53.0.w,
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: 20.0.w,
                                        height: 20.0.w,
                                        child: SvgPicture.asset(
                                          "assets/plus_icon.svg",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0.w),
                                        child: Text(
                                          "Додати мову",
                                          style: GoogleFonts.roboto(
                                            fontSize: 18.0.sp,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            color: const Color.fromARGB(
                                                255, 24, 24, 24),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20.0.h,
                            bottom: 40.0.h,
                          ),
                          child: InkWell(
                            onTap: context
                                    .watch<ResumeScreenController>()
                                    .stepTwoScreenNextButtonState
                                ? () => context
                                    .read<ResumeScreenController>()
                                    .onClickStepTwoScreenNextButton(context)
                                : null,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0.r),
                                color: context
                                        .watch<ResumeScreenController>()
                                        .stepTwoScreenNextButtonState
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
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
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
                ],
              ),
            ),
          ),
        ),
        ColoredBox(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SizedBox(
            width: 375.0.w,
            height: 160.0.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 15.0.w,
                    right: 15.0.w,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: InkWell(
                          onTap: () => context
                              .read<ResumeScreenController>()
                              .setResumeStepTwoScreenState(),
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
                          "Резюме",
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
                Padding(
                  padding: EdgeInsets.only(top: 10.0.h),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48.0.w,
                    child: SvgPicture.asset(
                      "assets/step_two.svg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
