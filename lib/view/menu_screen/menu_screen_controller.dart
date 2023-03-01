// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:migrostore/view/app_screen/app_screen_controller.dart';
import 'package:migrostore/view/main_screen/main_screen_controller.dart';
import 'package:provider/provider.dart';

class MenuScreenController extends ChangeNotifier {
  final List<Map<String, String>> _content = [
    {
      "icon": "assets/menu_resume.svg",
      "title": "Резюме",
      "description":
          "Ви можете підготувати своє резюме за пару хвилин. Просто заповніть свій профіль."
    },
    {
      "icon": "assets/menu_legalization.svg",
      "title": "Легалізація",
      "description":
          "Залиште нам свої контактні дані і ми проконсультуємо вас безкоштовно."
    },
    {
      "icon": "assets/menu_work.svg",
      "title": "Робота",
      "description":
          "Вишліть нам ваші побажання і здібності, а ми самі допасуємо до вас робоче місце."
    },
    {
      "icon": "assets/menu_help.svg",
      "title": "Допомога",
      "description":
          "Вишліть нам ваші побажання і здібності, а ми самі допасуємо до вас робоче місце."
    },
  ];

  List<Map<String, String>> get content => _content;

  // Legalization screen

  bool _legalizationScreenState = false;
  bool get legalizationScreenState => _legalizationScreenState;
  void _setLegalizationScreenState() {
    _legalizationScreenState = !_legalizationScreenState;
    notifyListeners();
  }

  Function get setLegalizationScreenState => _setLegalizationScreenState;

  // Help screen

  bool _helpScreenState = false;
  bool get helpScreenState => _helpScreenState;
  void _setHelpScreenState() {
    _helpScreenState = !_helpScreenState;
    notifyListeners();
  }

  Function get setHelpScreenState => _setHelpScreenState;

  void _onClickMenuItem(BuildContext context, int index) async {
    switch (index) {
      case 0:
        if (!Hive.isBoxOpen("userInfo")) {
          await Hive.openBox("userInfo");
        }
        if (Hive.box("userInfo").get("userInfo")["isAuthorized"]) {
          _setResumeScreenState();
          Provider.of<MainScreenController>(context, listen: false)
              .setNavigationBarState();
        } else {
          Provider.of<AppScreenController>(context, listen: false)
              .setAuthScreenState();
        }
        break;
      case 1:
        {
          _setLegalizationScreenState();
          Provider.of<MainScreenController>(context, listen: false)
              .setNavigationBarState();
          break;
        }
      case 2:
        {
          if (Hive.isBoxOpen("userName")) {
            if (Hive.box("userInfo").get("userInfo")["isAuthorized"]) {
              _setWorkScreenState();
              Provider.of<MainScreenController>(context, listen: false)
                  .setNavigationBarState();
            } else {
              Provider.of<AppScreenController>(context, listen: false)
                  .setAuthScreenState();
            }
          } else {
            await Hive.openBox("userInfo").then((box) {
              if (box.get("userInfo")["isAuthorized"]) {
                _setWorkScreenState();
                Provider.of<MainScreenController>(context, listen: false)
                    .setNavigationBarState();
              } else {
                Provider.of<AppScreenController>(context, listen: false)
                    .setAuthScreenState();
              }
            });
          }
          break;
        }
      case 3:
        {
          _setHelpScreenState();
          Provider.of<MainScreenController>(context, listen: false)
              .setNavigationBarState();
          break;
        }
    }
  }

  Function get onClickMenuItem => _onClickMenuItem;

  // Work screen
  bool _workScreenState = false;
  bool get workScreenState => _workScreenState;
  void _setWorkScreenState() {
    _workScreenState = !_workScreenState;
    notifyListeners();
  }

  Function get setWorkScreenState => _setWorkScreenState;

  // Resume screen

  bool _resumeScreenState = false;
  bool get resumeScreenState => _resumeScreenState;

  void _setResumeScreenState() {
    _resumeScreenState = !_resumeScreenState;
    notifyListeners();
  }

  Function get setResumeScreenState => _setResumeScreenState;
}
