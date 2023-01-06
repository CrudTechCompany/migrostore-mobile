import 'package:flutter/material.dart';
import 'package:migrostore/view/modal_window/exit_modal_window.dart';
import 'package:migrostore/view/modal_window/internet_connection_modal_window.dart';
import 'package:migrostore/view/onboarding_screen/onboarding_screen.dart';
import 'package:migrostore/view/onboarding_screen/onboarding_screen_controller.dart';
import 'package:migrostore/view/splash_screen/splash_screen.dart';
import 'package:migrostore/view/splash_screen/splash_screen_controller.dart';
import 'package:provider/provider.dart';
import '../main_screen/main_screen.dart';
import '../main_screen/main_screen_controller.dart';
import '../modal_window/delete_account_modal_window.dart';
import 'app_screen_controller.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context
            .read<AppScreenController>()
            .setInternetConnectionModalWindowState();
      },
    );
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Stack(
          children: [
            context.watch<AppScreenController>().splashScreenState
                ? ChangeNotifierProvider(
                    create: (_) => SplashScreenController(),
                    child: const SplashScreen(),
                  )
                : const SizedBox.shrink(),
            context.watch<AppScreenController>().onboardingScreenState
                ? ChangeNotifierProvider(
                    create: (_) => OnboardingScreenController(),
                    child: const OnboardingScreen(),
                  )
                : const SizedBox.shrink(),
            context.watch<AppScreenController>().mainScreenState
                ? ChangeNotifierProvider(
                    create: (_) => MainScreenController(),
                    child: const MainScreen(),
                  )
                : const SizedBox.shrink(),
            context.watch<AppScreenController>().exitModalWindowState
                ? const ExitModalWindow()
                : const SizedBox.shrink(),
            context.watch<AppScreenController>().deleteAccountModalWindowState
                ? const DeleteAccountModalWindow()
                : const SizedBox.shrink(),
            context
                    .watch<AppScreenController>()
                    .internetConnectionModalWindowState
                ? const InternetConnectionModalWindow()
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
