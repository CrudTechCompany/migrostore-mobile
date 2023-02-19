import 'package:flutter/material.dart';
import 'package:migrostore/view/profile_screen/profile_screen_controller.dart';
import 'package:provider/provider.dart';

class ProfileSelectSkillScreenController extends ChangeNotifier {
  final Map<String, bool> _skillList = {
    "Кухар": false,
    "Вчитель": false,
    "Різноробочий": false,
    "Агрономія": false,
    "Садівник": false,
    "Будівельник": false,
    "Слюсар": false,
    "Оператор ЧПУ": false,
    "Робота у готелі": false,
    "Продаж": false,
    "Логістика": false,
    "Електрик": false,
    "Менеджер": false,
    "Інженер": false,
    "Дизайнер": false,
    "Медичний персонал": false,
    "Водій": false,
    "Офіціант": false,
    "Бармен": false,
    "Бариста": false,
    "Моряк": false,
    "Монтер": false,
    "Технолог": false,
  };
  Map<String, bool> get skillList => _skillList;

  void _onClickListItem(int index) {
    _skillList.update(_skillList.keys.toList()[index],
        (value) => !_skillList.values.toList()[index]);
    _setSelectButtonState();
    notifyListeners();
  }

  Function get onClickListItem => _onClickListItem;

  void _setInitialSkillList(String? value) {
    if (value == null) {
      return;
    } else {
      for (String item in value.replaceAll(" ", "").split(",")) {
        _skillList[item] = true;
      }
      _setSelectButtonState();
      notifyListeners();
    }
  }

  Function get setInitialSkillList => _setInitialSkillList;

  bool _initialState = false;
  bool get initialState => _initialState;
  void _setInitialState() {
    _initialState = !_initialState;
  }

  Function get setInitialState => _setInitialState;

  bool _selectButtonState = false;
  bool get selectButtonState => _selectButtonState;

  void _setSelectButtonState() {
    for (bool item in _skillList.values.toList()) {
      if (item) {
        _selectButtonState = true;
        break;
      } else {
        _selectButtonState = false;
      }
    }
  }

  void _onClickSelectButton(BuildContext context) {
    Provider.of<ProfileScreenController>(context, listen: false)
        .setSelectedSkill(null);
    _skillList.forEach((key, value) {
      if (value) {
        Provider.of<ProfileScreenController>(context, listen: false)
            .setSelectedSkill(key);
      }
    });
    Provider.of<ProfileScreenController>(context, listen: false)
        .setSelectSkillScreenState();
  }

  Function get onClickSelectButton => _onClickSelectButton;
}
