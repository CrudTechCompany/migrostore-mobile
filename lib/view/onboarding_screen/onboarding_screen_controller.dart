import 'package:flutter/material.dart';

class OnboardingScreenController extends ChangeNotifier {
  final List<Map<String, String>> _items = [
    {
      "image": "assets/welcome_onboarding.svg",
      "title": "Ласкаво просимо!",
      "description":
          "Шукаєте автоматизованого створення резюме, послуги легалізації чи шукаєте роботу? Ми тут, щоб допомогти вам у цьому!"
    },
    {
      "image": "assets/resume_onboarding.svg",
      "title": "Резюме",
      "description":
          "Ви можете підготувати своє резюме за пару хвилин. Просто заповніть свій профіль!"
    },
    {
      "image": "assets/legalization_onboarding.svg",
      "title": "Послуга легалізації",
      "description":
          "Залиште нам свої контактні дані і ми проконсультуємо вас безкоштовно!"
    },
    {
      "image": "assets/work_onboarding.svg",
      "title": "Робота",
      "description":
          "Вишліть нам ваші побажання і здібності, а ми самі допасуємо до вас робоче місце!"
    }
  ];
  List<Map<String, String>> get items => _items;

  final PageController _controller = PageController();
  PageController get controller => _controller;

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
}
