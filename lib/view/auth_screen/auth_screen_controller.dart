import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthScreenController extends ChangeNotifier {
  // SignIn/SignUp buttons

  void _onClickSignInButton() {}
  Function get onClickSignInButton => _onClickSignInButton;

  void _onClickSignUpButton() {}
  Function get onClickSignUpButton => _onClickSignUpButton;

  // SignIn screen

  bool _signInScreenState = false;
  bool get signInScreenState => _signInScreenState;
  void _setSignInScreenState() {
    _signInScreenState = !_signInScreenState;
    notifyListeners();
  }

  Function get setSignInScreenState => _setSignInScreenState;

  // SignUp screen

  bool _signUpScreenState = false;
  bool get signUpScreenState => _signUpScreenState;
  void _setSignUpScreenState() {
    _signUpScreenState = !_signUpScreenState;
    notifyListeners();
  }

  Function get setSignUpScreenState => _setSignUpScreenState;

  // Privacy policy/Terms & conditions links

  void _onClickPrivacyOrTermsLink(String type) async {
    if (Platform.isIOS) {
      switch (type) {
        case "terms":
          {
            await launchUrl(
                Uri.parse("https://migrostore.pl/terms-and-conditions"),
                mode: LaunchMode.externalApplication);
            break;
          }
        case "policy":
          {
            await launchUrl(Uri.parse("https://migrostore.pl/privacy-policy"),
                mode: LaunchMode.externalApplication);
            break;
          }
      }
    }
  }

  Function get onClickPrivacyOrTermsLink => _onClickPrivacyOrTermsLink;
}
