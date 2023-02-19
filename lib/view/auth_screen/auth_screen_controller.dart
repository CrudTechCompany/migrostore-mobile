import 'dart:io';

import 'package:flutter/material.dart';
import 'package:migrostore/view/app_screen/app_screen_controller.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthScreenController extends ChangeNotifier {
  void _onClickTermsOrPrivacy(BuildContext context, String type) async {
    switch (type) {
      case "Terms":
        Platform.isAndroid
            ? Provider.of<AppScreenController>(context, listen: false)
                .setTermsScreenState()
            : await launchUrl(
                Uri.parse("https://migrostore.pl/terms-and-conditions"),
                mode: LaunchMode.externalApplication);

        break;
      case "Privacy":
        Platform.isAndroid
            ? Provider.of<AppScreenController>(context, listen: false)
                .setPrivacyScreenState()
            : await launchUrl(Uri.parse("https://migrostore.pl/privacy-policy"),
                mode: LaunchMode.externalApplication);
        break;
    }
  }

  Function get onClickTermsOrPrivacy => _onClickTermsOrPrivacy;

  // Sign in screen
  bool _signInScreenState = false;
  bool get signInScreenState => _signInScreenState;
  void _setSignInScreenState() {
    _signInScreenState = !_signInScreenState;
    notifyListeners();
  }

  Function get setSignInScreenState => _setSignInScreenState;

  // Sign up screen
  bool _signUpScreenState = false;
  bool get signUpScreenState => _signUpScreenState;
  void _setSignUpScreenState() {
    _signUpScreenState = !_signUpScreenState;
    notifyListeners();
  }

  Function get setSignUpScreenState => _setSignUpScreenState;
}
