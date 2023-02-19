import 'package:flutter/material.dart';
import 'package:migrostore/view/work_screen/work_screen_controller.dart';
import 'package:provider/provider.dart';

class SelectCityScreenController extends ChangeNotifier {
  final Map<String, bool> _cityList = {
    "Warszawa": false,
    "Kraków": false,
    "Łódź": false,
    "Wrocław": false,
    "Poznań": false,
    "Gdańsk": false,
    "Szczecin": false,
    "Bydgoszcz": false,
    "Lublin": false,
    "Częstochowa": false,
  };
  Map<String, bool> get cityList => _cityList;

  void _setInitialCityList(String? value) {
    if (value == null) {
      return;
    } else {
      for (String item in value.replaceAll(" ", "").split(",")) {
        _cityList[item] = true;
      }
      _setSelectButtonState();
      notifyListeners();
    }
  }

  Function get setInitialCityList => _setInitialCityList;

  bool _initialState = false;
  bool get initialState => _initialState;
  void _setInitialState() {
    _initialState = !_initialState;
  }

  Function get setInitialState => _setInitialState;

  void _onClickListItem(int index) {
    _cityList.update(_cityList.keys.toList()[index],
        (value) => !_cityList.values.toList()[index]);
    _setSelectButtonState();
    notifyListeners();
  }

  Function get onClickListItem => _onClickListItem;

  bool _selectButtonState = false;
  bool get selectButtonState => _selectButtonState;
  void _setSelectButtonState() {
    for (bool value in _cityList.values.toList()) {
      if (value) {
        _selectButtonState = true;
        break;
      } else {
        _selectButtonState = false;
      }
    }
  }

  void _onClickSelectButton(BuildContext context) {
    Provider.of<WorkScreenController>(context, listen: false)
        .setSelectedCity(null);
    _cityList.forEach((key, value) {
      if (value) {
        Provider.of<WorkScreenController>(context, listen: false)
            .setSelectedCity(key);
      }
    });
    Provider.of<WorkScreenController>(context, listen: false)
        .setSelectCityScreenState();
  }

  Function get onClickSelectButton => _onClickSelectButton;
}
