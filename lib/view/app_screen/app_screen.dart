import "package:flutter/material.dart";
import 'package:migrostore/view/app_screen/app_screen_controller.dart';
import 'package:migrostore/view/auth_screen/auth_screen_controller.dart';
import 'package:migrostore/view/main_screen/main_screen.dart';
import 'package:migrostore/view/main_screen/main_screen_controller.dart';
import 'package:migrostore/view/modal_window/exit_modal_window.dart';
import 'package:migrostore/view/onboarding_srceen/onboarding_screen_controller.dart';
import 'package:migrostore/view/privacy_screen/privacy_screen.dart';
import 'package:migrostore/view/privacy_screen/privacy_screen_controller.dart';
import 'package:migrostore/view/splash_screen/splash_screen_controller.dart';
import 'package:migrostore/view/terms_screen/terms_screen.dart';
import 'package:migrostore/view/terms_screen/terms_screen_controller.dart';
import 'package:provider/provider.dart';
import '../auth_screen/auth_screen.dart';
import '../modal_window/internal_connection_modal_window.dart';
import '../onboarding_srceen/onboarding_screen.dart';
import '../splash_screen/splash_screen.dart';

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

    return Scaffold(
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
          context.watch<AppScreenController>().authScreenState
              ? ChangeNotifierProvider(
                  create: (_) => AuthScreenController(),
                  child: const AuthScreen(),
                )
              : const SizedBox.shrink(),
          context.watch<AppScreenController>().termsScreenState
              ? ChangeNotifierProvider(
                  create: (_) => TermsScreenController(),
                  child: const TermsScreen(),
                )
              : const SizedBox.shrink(),
          context.watch<AppScreenController>().privacyScreenState
              ? ChangeNotifierProvider(
                  create: (_) => PrivacyScreenController(),
                  child: const PrivacyScreen(),
                )
              : const SizedBox.shrink(),
          context.watch<AppScreenController>().exitModalWindowState
              ? const ExitModalWindow()
              : const SizedBox.shrink(),
          context
                  .watch<AppScreenController>()
                  .internetConnectionModalWindowState
              ? const InternetConnectionModalWindow()
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
