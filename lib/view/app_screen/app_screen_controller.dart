import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AppScreenController extends ChangeNotifier {
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
  bool _mainScreenState = false;
  bool get mainScreenState => _mainScreenState;
  void _setMainScreenState() {
    _mainScreenState = !_mainScreenState;
    notifyListeners();
  }

  Function get setMainScreenState => _setMainScreenState;

  // Auth screen
  bool _authScreenState = false;
  bool get authScreenState => _authScreenState;
  void _setAuthScreenState() {
    _authScreenState = !_authScreenState;
    notifyListeners();
  }

  Function get setAuthScreenState => _setAuthScreenState;

  // Terms screen
  bool _termsScreenState = false;
  bool get termsScreenState => _termsScreenState;
  void _setTermsScreenState() {
    _termsScreenState = !_termsScreenState;
    notifyListeners();
  }

  Function get setTermsScreenState => _setTermsScreenState;

  // Privacy screen
  bool _privacyScreenState = false;
  bool get privacyScreenState => _privacyScreenState;
  void _setPrivacyScreenState() {
    _privacyScreenState = !_privacyScreenState;
    notifyListeners();
  }

  Function get setPrivacyScreenState => _setPrivacyScreenState;

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
}
