import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AppScreenController extends ChangeNotifier {
  // Internet connection modal window

  bool _internetConnectionModalWindowState = false;
  bool get internetConnectionModalWindowState =>
      _internetConnectionModalWindowState;
  void _setInternetConnectionModalWindowState() {
    InternetConnectionChecker().onStatusChange.listen(
      (event) {
        if (event == InternetConnectionStatus.connected) {
          _internetConnectionModalWindowState = false;
        } else {
          _internetConnectionModalWindowState = true;
        }
      },
    );
    notifyListeners();
  }

  Function get setInternetConnectionModalWindowState =>
      _setInternetConnectionModalWindowState;

  // Exit modal window

  bool _exitModalWindowState = false;
  bool get exitModalWindowState => _exitModalWindowState;
  void _setExitModalWindowState() {
    _exitModalWindowState = !_exitModalWindowState;
    notifyListeners();
  }

  Function get setExitModalWindowState => _setExitModalWindowState;

  // Delete account modal window

  bool _deleteAccountModalWindowState = false;
  bool get deleteAccountModalWindowState => _deleteAccountModalWindowState;
  void _setDeleteAccountModalWindowState() {
    _deleteAccountModalWindowState = !_deleteAccountModalWindowState;
    notifyListeners();
  }

  Function get setDeleteAccountModalWindowState =>
      _setDeleteAccountModalWindowState;

  // Splash screen

  bool _splashScreenState = true;
  bool get splashScreenState => _splashScreenState;
  void _setSplashScreenState() {
    _splashScreenState = !_splashScreenState;
    notifyListeners();
  }

  Function get setSplashScreenState => _setSplashScreenState;

  // Onboarding screen

  bool _onboardingScreenState = false;
  bool get onboardingScreenState => _onboardingScreenState;
  void _setOnboardingScreenState() {
    _onboardingScreenState = !_onboardingScreenState;
    notifyListeners();
  }

  Function get setOnboardingScreenState => _setOnboardingScreenState;

  // Main screen

  bool _mainscreenState = false;
  bool get mainScreenState => _mainscreenState;
  void _setMainScreenState() {
    _mainscreenState = !_mainscreenState;
    notifyListeners();
  }

  Function get setMainScreenState => _setMainScreenState;
}
