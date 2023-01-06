import 'dart:io';
import 'package:flutter/material.dart';
import 'package:migrostore/view/app_screen/app_screen_controller.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreenController extends ChangeNotifier {
  final List<Map<String, String>> _items = [
    {"icon": "assets/terms_icon.svg", "title": "Загальні положення"},
    {"icon": "assets/policy_icon.svg", "title": "Політика конфіденційності"},
    {"icon": "assets/about_icon.svg", "title": "Про нас"},
    {"icon": "assets/out_icon.svg", "title": "Вийти"},
    {"icon": "assets/delete_icon.svg", "title": "Видалити акаунт"},
  ];
  List<Map<String, String>> get items => _items;

  void _onClickItem(BuildContext context, int index) async {
    switch (index) {
      case 0:
        {
          Platform.isAndroid
              ? _setTermsAndConditionsScreenState()
              : await launchUrl(
                  Uri.parse("https://migrostore.pl/terms-and-conditions"),
                  mode: LaunchMode.externalApplication);
          break;
        }
      case 1:
        {
          Platform.isAndroid
              ? _setPrivacyPolicyScreenState()
              : await launchUrl(
                  Uri.parse("https://migrostore.pl/privacy-policy"),
                  mode: LaunchMode.externalApplication);
          break;
        }
      case 2:
        {
          _setAboutUsScreenState();
          break;
        }
      case 3:
        {
          Provider.of<AppScreenController>(context, listen: false)
              .setExitModalWindowState();
          break;
        }
      case 4:
        {
          Provider.of<AppScreenController>(context, listen: false)
              .setDeleteAccountModalWindowState();
          break;
        }
    }
    notifyListeners();
  }

  Function get onClickItem => _onClickItem;

  bool _aboutUsScreenState = false;
  bool get aboutUsScreenState => _aboutUsScreenState;
  void _setAboutUsScreenState() {
    _aboutUsScreenState = !_aboutUsScreenState;
    notifyListeners();
  }

  Function get setAboutUsScreenState => _setAboutUsScreenState;

  bool _termsAndConditionsScreenState = false;
  bool get termsAndConditionsScreenState => _termsAndConditionsScreenState;
  void _setTermsAndConditionsScreenState() {
    _termsAndConditionsScreenState = !_termsAndConditionsScreenState;
    notifyListeners();
  }

  Function get setTermsAndConditionsScreenState =>
      _setTermsAndConditionsScreenState;

  bool _privacyPolicyScreenState = false;
  bool get privacyPolicyScreenState => _privacyPolicyScreenState;
  void _setPrivacyPolicyScreenState() {
    _privacyPolicyScreenState = !_privacyPolicyScreenState;
    notifyListeners();
  }

  Function get setPrivacyPolicyScreenState => _setPrivacyPolicyScreenState;
}
