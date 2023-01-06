import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/services/api_client/api_client.dart';

class ProfileScreenController extends ChangeNotifier {
  // Name text field

  String? _inputedName;
  String? get inputedName => _inputedName;
  void _onChangeInputedName(String value) {
    value.isEmpty ? _inputedName = null : _inputedName = value;
    _setSaveProfileButtonState();
    notifyListeners();
  }

  Function get onChangeInputedName => _onChangeInputedName;

  // Surname text field

  String? _inputedSurName;
  String? get inputedSurName => _inputedSurName;
  void _onChangeInputedSurName(String value) {
    value.isEmpty ? _inputedSurName = null : _inputedSurName = value;
    _setSaveProfileButtonState();
    notifyListeners();
  }

  Function get onChangeInputedSurName => _onChangeInputedSurName;

  // BirthDay date picker

  String? _selectedBirthDay;
  String? get selectedBirthDay => _selectedBirthDay;

  void _onClickBirthDayField(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime(
        DateTime.now().year - 18,
        DateTime.now().month,
        DateTime.now().day,
      ),
      firstDate: DateTime(
        DateTime.now().year - 100,
      ),
      lastDate: DateTime(
        DateTime.now().year - 18,
        DateTime.now().month,
        DateTime.now().day,
      ),
    ).then(
      (value) => _setSelectedBirthDay(value),
    );
  }

  Function get onClickBirthDayField => _onClickBirthDayField;

  void _setSelectedBirthDay(DateTime? date) {
    if (date == null) {
      return;
    } else {
      _selectedBirthDay = "";
      date.day > 9
          ? _selectedBirthDay = _selectedBirthDay! + date.day.toString()
          : _selectedBirthDay = "${_selectedBirthDay!}0${date.day.toString()}";
      date.month > 9
          ? _selectedBirthDay = "${_selectedBirthDay!}-${date.month.toString()}"
          : _selectedBirthDay =
              "${_selectedBirthDay!}-0${date.month.toString()}";
      _selectedBirthDay = "${_selectedBirthDay!}-${date.year.toString()}";
    }
    _setSaveProfileButtonState();
    notifyListeners();
  }

  Function get setSelectedBirthDay => _setSelectedBirthDay;

  //Email text field

  String? _inputedEmail;
  String? get inputedEmail => _inputedEmail;
  bool _emailErrorState = false;
  bool get emailErrorState => _emailErrorState;
  final String _emailErrorText = "Неправильний формат пошти";
  String get emailErrorText => _emailErrorText;
  void _onChangeInputedEmail(String value) {
    value.isEmpty ? _inputedEmail = null : _inputedEmail = value;
    _setSaveProfileButtonState();
    notifyListeners();
  }

  Function get onChangeInputedEmail => _onChangeInputedEmail;

  // State drop down list

  final List<DropdownMenuItem<String>> _stateItems = [
    DropdownMenuItem<String>(
      value: "Ukraine",
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24.0.w,
            height: 18.0.w,
            child: SvgPicture.asset(
              "assets/ukraine.svg",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.0.w,
            ),
            child: Text(
              "Україна",
              style: GoogleFonts.roboto(
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                color: const Color.fromARGB(255, 24, 24, 24),
              ),
            ),
          ),
        ],
      ),
    ),
    DropdownMenuItem<String>(
      value: "Poland",
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24.0.w,
            height: 18.0.w,
            child: SvgPicture.asset(
              "assets/poland.svg",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.0.w,
            ),
            child: Text(
              "Польща",
              style: GoogleFonts.roboto(
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                color: const Color.fromARGB(255, 24, 24, 24),
              ),
            ),
          ),
        ],
      ),
    ),
    DropdownMenuItem<String>(
      value: "Germany",
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24.0.w,
            height: 18.0.w,
            child: SvgPicture.asset(
              "assets/germany.svg",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.0.w,
            ),
            child: Text(
              "Німеччина",
              style: GoogleFonts.roboto(
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                color: const Color.fromARGB(255, 24, 24, 24),
              ),
            ),
          ),
        ],
      ),
    ),
    DropdownMenuItem<String>(
      value: "Сzech",
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24.0.w,
            height: 18.0.w,
            child: SvgPicture.asset(
              "assets/czech.svg",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.0.w,
            ),
            child: Text(
              "Чехія",
              style: GoogleFonts.roboto(
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                color: const Color.fromARGB(255, 24, 24, 24),
              ),
            ),
          ),
        ],
      ),
    ),
    DropdownMenuItem<String>(
      value: "Slovakia",
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24.0.w,
            height: 18.0.w,
            child: SvgPicture.asset(
              "assets/slovakia.svg",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.0.w,
            ),
            child: Text(
              "Словаччина",
              style: GoogleFonts.roboto(
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                color: const Color.fromARGB(255, 24, 24, 24),
              ),
            ),
          ),
        ],
      ),
    ),
  ];
  List<DropdownMenuItem<String>> get stateItems => _stateItems;

  String? _selectedState;
  String? get selectedState => _selectedState;
  void _setSelectedState(String value) {
    _selectedState = value;
    notifyListeners();
  }

  Function get setSelectedState => _setSelectedState;

  // Grounds for entry

  final List<DropdownMenuItem<String>> _entryItems = [
    DropdownMenuItem<String>(
      value: "Refugee",
      child: Text(
        "Біженець",
        style: GoogleFonts.roboto(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
      ),
    ),
    DropdownMenuItem<String>(
      value: "Free visa",
      child: Text(
        "Безвіз",
        style: GoogleFonts.roboto(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
      ),
    ),
    DropdownMenuItem<String>(
      value: "Work visa",
      child: Text(
        "Робоча або інша віза",
        style: GoogleFonts.roboto(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
      ),
    ),
  ];
  List<DropdownMenuItem<String>> get entryItems => _entryItems;

  String? _selectedEntry;
  String? get selectedEntry => _selectedEntry;

  void _setSelectedEntry(String value) {
    _selectedEntry = value;
    notifyListeners();
  }

  Function get setSelectedEntry => _setSelectedEntry;

  // Polish or english level list

  final List<DropdownMenuItem<String>> _languangeItems = [
    DropdownMenuItem(
      value: "Elementary",
      child: Text(
        "Початковий/Елементарний",
        style: GoogleFonts.roboto(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
      ),
    ),
    DropdownMenuItem(
      value: "A1",
      child: Text(
        "A1",
        style: GoogleFonts.roboto(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
      ),
    ),
    DropdownMenuItem(
      value: "A2",
      child: Text(
        "A2",
        style: GoogleFonts.roboto(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
      ),
    ),
    DropdownMenuItem(
      value: "Intermediate",
      child: Text(
        "Cередній",
        style: GoogleFonts.roboto(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
      ),
    ),
    DropdownMenuItem(
      value: "B1",
      child: Text(
        "B1",
        style: GoogleFonts.roboto(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
      ),
    ),
    DropdownMenuItem(
      value: "B2",
      child: Text(
        "B2",
        style: GoogleFonts.roboto(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
      ),
    ),
  ];
  List<DropdownMenuItem<String>> get languangeItems => _languangeItems;

  String? _selectedPolishLevel;
  String? get selectedPolishLevel => _selectedPolishLevel;

  String? _selectedEnglishLevel;
  String? get selectedEnglishLevel => _selectedEnglishLevel;

  void _setSelectedLanguangeLevel(String type, String value) {
    switch (type) {
      case "polish":
        {
          _selectedPolishLevel = value;
          break;
        }
      case "english":
        {
          _selectedEnglishLevel = value;
          break;
        }
    }
    notifyListeners();
  }

  Function get setSelectedLanguangeLevel => _setSelectedLanguangeLevel;

  // Select city screen

  final Map<String, bool> _cityList = {};
  Map<String, bool> get cityList => _cityList;

  Future<void> _setCityList() async {
    List<String> response = await ApiClient().getCitiesList();
    for (String e in response) {
      _cityList[e] = false;
    }
  }

  bool _selectCityScreenState = false;
  bool get selectCityScreenState => _selectCityScreenState;
  void _setSelectCityScreenState() async {
    if (_selectCityScreenState) {
      _selectCityScreenState = !_selectCityScreenState;
    } else {
      await _setCityList();
      _selectCityScreenState = !_selectCityScreenState;
    }
    notifyListeners();
  }

  Function get setSelectCityScreenState => _setSelectCityScreenState;

  void _onClickCityListItem(int index) {
    _cityList.update(
      _cityList.keys.toList()[index],
      (value) => !_cityList.values.toList()[index],
    );
    _setSelectButtonState();
    notifyListeners();
  }

  Function get onClickCityListItem => _onClickCityListItem;

  bool _selectButtonState = false;
  bool get selectButtonState => _selectButtonState;

  void _setSelectButtonState() {
    for (bool item in _cityList.values.toList()) {
      if (item) {
        _selectButtonState = true;
        break;
      } else {
        _selectButtonState = false;
      }
    }
  }

  // Select skills screen

  bool _selectSkilsScreenState = false;
  bool get selectSkillsScreenState => _selectSkilsScreenState;
  void _setSelectSkillsScreenState() {
    if (_selectSkilsScreenState) {
      _selectSkilsScreenState = !_selectSkilsScreenState;
    } else {
      _getSkillList();
      _selectSkilsScreenState = !_selectSkilsScreenState;
    }
    notifyListeners();
  }

  Function get setSelectSkillsScreenState => _setSelectSkillsScreenState;

  final Map<String, bool> _skillList = {};
  Map<String, bool> get skillList => _skillList;

  Future<void> _getSkillList() async {
    List<String> response = await ApiClient().getSkillsList();
    for (String item in response) {
      _skillList[item] = false;
    }
    notifyListeners();
  }

  void _onClickSkillListItem(int index) {
    _skillList.update(_skillList.keys.toList()[index],
        (value) => !_skillList.values.toList()[index]);
    _setSelectSkillButtonState();
    notifyListeners();
  }

  Function get onClickSkillListItem => _onClickSkillListItem;

  bool _selectSkillButtonState = false;
  bool get selectSkillButtonState => _selectSkillButtonState;
  void _setSelectSkillButtonState() {
    for (bool value in _skillList.values.toList()) {
      if (value) {
        _selectSkillButtonState = true;
        break;
      } else {
        _selectSkillButtonState = false;
      }
    }
  }

  //Save profiledata button

  bool _saveProfileButtonState = false;
  bool get saveProfileButtonState => _saveProfileButtonState;
  void _setSaveProfileButtonState() {
    if (_inputedName != null &&
        _inputedSurName != null &&
        _selectedBirthDay != null &&
        _inputedEmail != null) {
      _saveProfileButtonState = true;
    } else {
      _saveProfileButtonState = false;
    }
  }

  void _onClickSaveProfileButton() {
    if (RegExp(r"(\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6})").hasMatch(_inputedEmail!)) {
      _emailErrorState = false;
      _setSuccessfullyModalWindow();
    } else {
      _emailErrorState = true;
    }
    notifyListeners();
  }

  Function get onClickSaveProfileButton => _onClickSaveProfileButton;

  // Successfully modal window

  bool _successfullyModalWindow = false;
  bool get successfullyModalWindow => _successfullyModalWindow;
  void _setSuccessfullyModalWindow() {
    if (_successfullyModalWindow) {
      _successfullyModalWindow = !_successfullyModalWindow;
      notifyListeners();
    } else {
      _successfullyModalWindow = !_successfullyModalWindow;
    }
  }

  Function get setSuccessfullyModalWindow => _setSuccessfullyModalWindow;
}
