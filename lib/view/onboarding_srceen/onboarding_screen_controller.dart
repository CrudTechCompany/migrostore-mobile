// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:migrostore/view/app_screen/app_screen_controller.dart';
import 'package:provider/provider.dart';

class OnboardingScreenController extends ChangeNotifier {
  final PageController _controller = PageController();
  PageController get controller => _controller;

  final List<Map<String, String>> _content = [
    {
      "image": "assets/welcome_screen.svg",
      "title": "Ласкаво просимо!",
      "description":
          "Шукаєте автоматизованого створення резюме, послуги легалізації чи шукаєте роботу? Ми тут, щоб допомогти вам у цьому!"
    },
    {
      "image": "assets/resume_screen.svg",
      "title": "Резюме",
      "description":
          "Ви можете підготувати своє резюме за пару хвилин. Просто заповніть свій профіль!"
    },
    {
      "image": "assets/legalization_screen.svg",
      "title": "Послуга легалізації",
      "description":
          "Залиште нам свої контактні дані і ми проконсультуємо вас безкоштовно!"
    },
    {
      "image": "assets/work_screen.svg",
      "title": "Робота",
      "description":
          "Вишліть нам ваші побажання і здібності, а ми самі допасуємо до вас робоче місце!"
    }
  ];
  List<Map<String, String>> get content => _content;

  int _index = 0;
  int get index => _index;
  void _setIndex(int value) {
    _index = value;
    notifyListeners();
  }

  Function get setIndex => _setIndex;

  void _onClickNextButton() async {
    await _controller.animateToPage(++_index,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  Function get onClickNextButton => _onClickNextButton;

  void _onClickSkipOrContinueButton(BuildContext context) async {
    if (Hive.isBoxOpen("userInfo")) {
      Box box = Hive.box("userInfo");
      box.get("userInfo")["isOnboarded"] = true;
      Hive.box("userInfo").put("userInfo", box.get("userInfo"));
    } else {
      await Hive.openBox("userInfo");
      Box box = Hive.box("userInfo");
      box.get("userInfo")["isOnboarded"] = true;
      Hive.box("userInfo").put("userInfo", box.get("userInfo"));
    }
    Provider.of<AppScreenController>(context, listen: false)
        .setMainScreenState();
    Provider.of<AppScreenController>(context, listen: false)
        .setOnboardingScreenState();
  }

  Function get onClickSkipOrContinueButton => _onClickSkipOrContinueButton;
}
