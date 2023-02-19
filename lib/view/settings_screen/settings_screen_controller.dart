import 'dart:io';

import 'package:flutter/material.dart';
import 'package:migrostore/view/app_screen/app_screen_controller.dart';
import 'package:migrostore/view/main_screen/main_screen_controller.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreenController extends ChangeNotifier {
  final List<Map<String, String>> _content = [
    {"icon": "assets/terms_icon.svg", "title": "Загальні положення"},
    {"icon": "assets/policy_icon.svg", "title": "Політика конфіденційності"},
    {"icon": "assets/about_icon.svg", "title": "Про нас"},
    {"icon": "assets/out_icon.svg", "title": "Вийти"},
    {"icon": "assets/delete_icon.svg", "title": "Видалити акаунт"},
  ];
  List<Map<String, String>> get content => _content;

  // About us screen

  bool _aboutUsScreenState = false;
  bool get aboutUsScreenState => _aboutUsScreenState;
  void _setAboutUsScreenState() {
    _aboutUsScreenState = !_aboutUsScreenState;
    notifyListeners();
  }

  // Delete account

  bool _deleteAccountState = false;
  bool get deleteAccountState => _deleteAccountState;

  void _setDeleteAccountState(BuildContext context) {
    _deleteAccountState = !_deleteAccountState;
    notifyListeners();
  }

  Function get setDeleteAccountState => _setDeleteAccountState;

  // Exit modal window

  bool _exitWindowState = false;
  bool get exitWindowState => _exitWindowState;

  void _setExitWindowState(BuildContext context) {
    _exitWindowState = !_exitWindowState;
    notifyListeners();
  }

  Function get setExitWindowState => _setExitWindowState;

  Function get setAboutUsScreenState => _setAboutUsScreenState;

  void _onClickContentItem(BuildContext context, int index) async {
    switch (index) {
      case 0:
        {
          Platform.isAndroid
              ? Provider.of<AppScreenController>(context, listen: false)
                  .setTermsScreenState()
              : await launchUrl(
                  Uri.parse("https://migrostore.pl/terms-and-conditions"),
                  mode: LaunchMode.externalApplication);
          break;
        }

      case 1:
        {
          Platform.isAndroid
              ? Provider.of<AppScreenController>(context, listen: false)
                  .setPrivacyScreenState()
              : await launchUrl(
                  Uri.parse("https://migrostore.pl/privacy-policy"),
                  mode: LaunchMode.externalApplication);
          break;
        }
      case 2:
        {
          _setAboutUsScreenState();
          Provider.of<MainScreenController>(context, listen: false)
              .setNavigationBarState();
          break;
        }
      case 3:
        {
          _setExitWindowState(context);
          Provider.of<MainScreenController>(context, listen: false)
              .setNavigationBarState();
          break;
        }

      case 4:
        {
          _setDeleteAccountState(context);
          Provider.of<MainScreenController>(context, listen: false)
              .setNavigationBarState();
          break;
        }
    }
  }

  Function get onClickContentItem => _onClickContentItem;
}
