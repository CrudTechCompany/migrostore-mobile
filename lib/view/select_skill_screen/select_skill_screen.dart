import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/select_skill_screen/select_skill_screen_controller.dart';
import 'package:migrostore/view/work_screen/work_screen_controller.dart';
import 'package:provider/provider.dart';

class SelectSkillScreen extends StatelessWidget {
  const SelectSkillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (context.read<SelectSkillScreenController>().initialState == false) {
          Provider.of<WorkScreenController>(context, listen: false)
                      .selectedSkill ==
                  null
              ? null
              : context.read<SelectSkillScreenController>().setInitialSkillList(
                  Provider.of<WorkScreenController>(context, listen: false)
                      .selectedSkill);
          context.read<SelectSkillScreenController>().setInitialState();
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
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(
                top: 117.0.h,
                bottom: 123.0.h,
                left: 15.0.w,
                right: 15.0.w,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => context
                      .read<SelectSkillScreenController>()
                      .onClickListItem(index),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context
                            .read<SelectSkillScreenController>()
                            .skillList
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
                                .watch<SelectSkillScreenController>()
                                .skillList
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
                      height: 1.0.w,
                    ),
                  ),
                );
              },
              itemCount:
                  context.read<SelectSkillScreenController>().skillList.length,
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
                      onTap: () => Provider.of<WorkScreenController>(context,
                              listen: false)
                          .setSelectSkillScreenState(),
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
                      "Навички",
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
                          .watch<SelectSkillScreenController>()
                          .selectButtonState
                      ? () => context
                          .read<SelectSkillScreenController>()
                          .onClickSelectButton(context)
                      : null,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0.r),
                      color: context
                              .watch<SelectSkillScreenController>()
                              .selectButtonState
                          ? const Color.fromARGB(255, 24, 24, 24)
                          : const Color.fromARGB(255, 180, 180, 180),
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
        )
      ],
    );
  }
}
