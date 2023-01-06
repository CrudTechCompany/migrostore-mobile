import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/legalization_screen/legalization_screen.dart';
import 'package:migrostore/view/legalization_screen/legalization_screen_controller.dart';
import 'package:migrostore/view/main_screen/main_screen_controller.dart';
import 'package:provider/provider.dart';
import '../help_screen/help_screen.dart';
import '../help_screen/help_screen_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: context.watch<MainScreenController>().index,
            onTap: (value) {
              context.read<MainScreenController>().setIndex(value);
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            selectedItemColor: const Color.fromARGB(255, 24, 24, 24),
            unselectedItemColor: const Color.fromARGB(255, 144, 144, 144),
            selectedLabelStyle: GoogleFonts.roboto(
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
            unselectedLabelStyle: GoogleFonts.roboto(
              fontSize: 12.0.sp,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: context.watch<MainScreenController>().index == 0
                      ? const Color.fromARGB(255, 24, 24, 24)
                      : const Color.fromARGB(255, 144, 144, 144),
                  size: context.watch<MainScreenController>().index == 0
                      ? 26.0.w
                      : 24.0.w,
                ),
                label: "Головна",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: context.watch<MainScreenController>().index == 1
                      ? const Color.fromARGB(255, 24, 24, 24)
                      : const Color.fromARGB(255, 144, 144, 144),
                  size: context.watch<MainScreenController>().index == 1
                      ? 26.0.w
                      : 24.0.w,
                ),
                label: "Мій профіль",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: context.watch<MainScreenController>().index == 2
                      ? const Color.fromARGB(255, 24, 24, 24)
                      : const Color.fromARGB(255, 144, 144, 144),
                  size: context.watch<MainScreenController>().index == 2
                      ? 26.0.w
                      : 24.0.w,
                ),
                label: "Налаштування",
              )
            ],
          ),
          body: context
              .read<MainScreenController>()
              .screens[context.watch<MainScreenController>().index],
        ),
        context.watch<MainScreenController>().legalizationScreenState
            ? ChangeNotifierProvider(
                create: (_) => LegalizationScreenController(),
                child: const LegalizationScreen(),
              )
            : const SizedBox.shrink(),
        context.watch<MainScreenController>().helpScreenState
            ? ChangeNotifierProvider(
                create: (_) => HelpScreenController(),
                child: const HelpScreen(),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
