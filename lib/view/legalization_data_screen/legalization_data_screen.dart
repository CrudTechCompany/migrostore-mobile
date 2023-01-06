import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/legalization_screen/legalization_screen_controller.dart';
import 'package:provider/provider.dart';

class LegalizationDataScreen extends StatelessWidget {
  const LegalizationDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Stack(
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
                      height: 42.0.w,
                      child: TextField(
                        cursorColor: const Color.fromARGB(255, 24, 24, 24),
                        style: GoogleFonts.roboto(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                        onChanged: (value) => context
                            .read<LegalizationScreenController>()
                            .onChangeInputedName(value),
                        decoration: InputDecoration(
                          hintText: "Введіть ім’я",
                          hintStyle: GoogleFonts.roboto(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 180, 180, 180),
                          ),
                          contentPadding: EdgeInsets.zero,
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: context
                                          .watch<LegalizationScreenController>()
                                          .inputedName ==
                                      null
                                  ? const Color.fromARGB(255, 180, 180, 180)
                                  : const Color.fromARGB(255, 24, 24, 24),
                              width: 1.0.w,
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
                      height: 42.0.w,
                      child: TextField(
                        maxLength: 12,
                        onChanged: (value) => context
                            .read<LegalizationScreenController>()
                            .onChangeInputedPhoneNumber(value),
                        keyboardType: TextInputType.phone,
                        cursorColor: const Color.fromARGB(255, 24, 24, 24),
                        style: GoogleFonts.roboto(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                        decoration: InputDecoration(
                          counterText: "",
                          contentPadding: EdgeInsets.zero,
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          hintText: "Введіть польський номер",
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
                                      .watch<LegalizationScreenController>()
                                      .errorPhoneNumberState
                                  ? const Color.fromARGB(255, 255, 0, 0)
                                  : context
                                              .watch<
                                                  LegalizationScreenController>()
                                              .inputedPhoneNumber ==
                                          null
                                      ? const Color.fromARGB(255, 180, 180, 180)
                                      : const Color.fromARGB(255, 24, 24, 24),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0.w,
                              color: context
                                      .watch<LegalizationScreenController>()
                                      .errorPhoneNumberState
                                  ? const Color.fromARGB(255, 255, 0, 0)
                                  : const Color.fromARGB(255, 24, 24, 24),
                            ),
                          ),
                        ),
                      ),
                    ),
                    context
                                .watch<LegalizationScreenController>()
                                .errorPhoneNumberText !=
                            null
                        ? Padding(
                            padding: EdgeInsets.only(top: 5.0.h),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                context
                                    .read<LegalizationScreenController>()
                                    .errorPhoneNumberText!,
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
                          "Email",
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
                      height: 42.0.w,
                      child: TextField(
                        onChanged: (value) => context
                            .read<LegalizationScreenController>()
                            .onChangeInputedEmail(value),
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: const Color.fromARGB(255, 24, 24, 24),
                        style: GoogleFonts.roboto(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: "Введіть адресу email",
                          hintStyle: GoogleFonts.roboto(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 180, 180, 180),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0.w,
                              color: context
                                      .watch<LegalizationScreenController>()
                                      .emailErrorState
                                  ? const Color.fromARGB(255, 255, 0, 0)
                                  : context
                                              .watch<
                                                  LegalizationScreenController>()
                                              .inputedEmail ==
                                          null
                                      ? const Color.fromARGB(255, 180, 180, 180)
                                      : const Color.fromARGB(255, 24, 24, 24),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0.w,
                              color: context
                                      .watch<LegalizationScreenController>()
                                      .emailErrorState
                                  ? const Color.fromARGB(255, 255, 0, 0)
                                  : const Color.fromARGB(255, 24, 24, 24),
                            ),
                          ),
                        ),
                      ),
                    ),
                    context
                            .watch<LegalizationScreenController>()
                            .emailErrorState
                        ? Padding(
                            padding: EdgeInsets.only(top: 5.0.h),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                context
                                    .read<LegalizationScreenController>()
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
                          "Зручний час для зв’язку",
                          style: GoogleFonts.roboto(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 117.0.w,
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 12.0.h),
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: context
                              .read<LegalizationScreenController>()
                              .selectTimeList
                              .length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: index == 0
                                  ? EdgeInsets.zero
                                  : EdgeInsets.only(top: 15.0.h),
                              child: InkWell(
                                onTap: () => context
                                    .read<LegalizationScreenController>()
                                    .onClickSelectTimeItem(index),
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    context
                                            .watch<
                                                LegalizationScreenController>()
                                            .selectTimeList[index]["isSelected"]
                                        ? Icon(Icons.radio_button_on,
                                            size: 16.0.w)
                                        : Icon(
                                            Icons.radio_button_off,
                                            size: 16.0.w,
                                          ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0.w),
                                      child: Text(
                                        context
                                            .read<
                                                LegalizationScreenController>()
                                            .selectTimeList[index]["title"],
                                        style: GoogleFonts.roboto(
                                          fontSize: 16.0.sp,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          color: const Color.fromARGB(
                                              255, 24, 24, 24),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0.h),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Залишити коментар",
                          style: GoogleFonts.roboto(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0.h),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        cursorColor: const Color.fromARGB(255, 24, 24, 24),
                        cursorHeight: 16.0.sp,
                        style: GoogleFonts.roboto(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                        onChanged: (value) => context
                            .read<LegalizationScreenController>()
                            .onChangeInputedMessage(value),
                        maxLines: 5,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0.w,
                              style: BorderStyle.solid,
                              color: context
                                          .watch<LegalizationScreenController>()
                                          .inputedMessage ==
                                      null
                                  ? const Color.fromARGB(255, 180, 180, 180)
                                  : const Color.fromARGB(255, 24, 24, 24),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0.w,
                              style: BorderStyle.solid,
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
                          "Вибрані послуги",
                          style: GoogleFonts.roboto(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0.h),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          context
                              .read<LegalizationScreenController>()
                              .selectedService!,
                          style: GoogleFonts.roboto(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 122, 122, 122),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.0.h),
                      child: InkWell(
                        onTap: context
                                .watch<LegalizationScreenController>()
                                .sendButtonState
                            ? () => context
                                .read<LegalizationScreenController>()
                                .onClickSendButton(context)
                            : null,
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0.r),
                            color: context
                                    .watch<LegalizationScreenController>()
                                    .sendButtonState
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
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
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
                        onTap: () => context
                            .read<LegalizationScreenController>()
                            .setLegalizationDataScreenState(),
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
        ],
      ),
    );
  }
}
