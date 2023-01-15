import 'package:flutter/material.dart';
import 'package:migrostore/view/main_screen/main_screen_controller.dart';
import 'package:provider/provider.dart';

class MenuScreenController extends ChangeNotifier {
  final List<Map<String, String>> _items = [
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

  List<Map<String, String>> get items => _items;

  // onClick menu items

  void _onClickMenuItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        {
          Provider.of<MainScreenController>(context, listen: false)
              .setResumeScreenState();
          break;
        }
      case 1:
        {
          Provider.of<MainScreenController>(context, listen: false)
              .setLegalizationScreenState();
          break;
        }
      case 2:
        {
          Provider.of<MainScreenController>(context, listen: false)
              .setWorkScreenState();
          break;
        }
      case 3:
        {
          Provider.of<MainScreenController>(context, listen: false)
              .setHelpScreenState();
          break;
        }
    }
  }

  Function get onClickMenuItem => _onClickMenuItem;
}
