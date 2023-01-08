import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/services/api_client/api_client.dart';

class WorkScreenController extends ChangeNotifier {
  // initial Modal window

  bool _initialModalWindowState = true;
  bool get initialModalWindowState => _initialModalWindowState;
  void _setInitialModalWindowState() {
    _initialModalWindowState = !_initialModalWindowState;
    notifyListeners();
  }

  Function get setInitialModalWindowState => _setInitialModalWindowState;

  // Name text field

  String? _inputedName;
  String? get inputedName => _inputedName;
  void _onChangedInputedName(String value) {
    value.isEmpty ? _inputedName = null : _inputedName = value;
    notifyListeners();
  }

  Function get onChangedInputedName => _onChangedInputedName;

  // Surname text field

  String? _inputedSurName;
  String? get inputedSurName => _inputedSurName;
  void _onChangedInputedSurName(String value) {
    value.isEmpty ? _inputedSurName = null : _inputedSurName = value;
    notifyListeners();
  }

  Function get onChangedInputedSurName => _onChangedInputedSurName;

  // Phone text field

  String? _inputedPhoneNumber;
  String? get inputedPhoneNumber => _inputedPhoneNumber;
  void _onChangedInputedPhoneNumber(String value) {
    value.isEmpty ? _inputedPhoneNumber = null : _inputedPhoneNumber = value;
    notifyListeners();
  }

  Function get onChangedInputedPhoneNumber => _onChangedInputedPhoneNumber;

  // Select birthday date

  String? _selectedDate;
  String? get selectedDate => _selectedDate;
  void _setSelectedDate(BuildContext context) async {
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
      (value) {
        if (value == null) {
          return;
        } else {
          _selectedDate = null;
          value.day > 9
              ? _selectedDate = value.day.toString()
              : _selectedDate = "0${value.day}";
          value.month > 9
              ? _selectedDate = "${_selectedDate!}-${value.month}"
              : _selectedDate = "${_selectedDate!}-0${value.month}";
          _selectedDate = "${_selectedDate!}-${value.year}";
          notifyListeners();
        }
      },
    );
  }

  Function get setSelectedDate => _setSelectedDate;

  // Email text field

  String? _inputedEmail;
  String? get inputedEmail => _inputedEmail;
  void _onChangedInputedEmail(String value) {
    value.isEmpty ? _inputedEmail = null : _inputedEmail = value;
    notifyListeners();
  }

  Function get onChangedInputedEmail => _onChangedInputedEmail;

  // State dropdown button

  String? _selectedState;
  String? get selectedState => _selectedState;
  void _onChangedSelectedState(String? value) {
    if (value == null) {
      return;
    } else {
      _selectedState = value;
      notifyListeners();
    }
  }

  Function get onChangedSelectedState => _onChangedSelectedState;

  final List<DropdownMenuItem<String>> _stateList = [
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
  List<DropdownMenuItem<String>> get stateList => _stateList;

  // Grounds for entry

  String? _selectedEntry;
  String? get selectedEntry => _selectedEntry;

  void _onChangedSelectedEntry(String? value) {
    if (value == null) {
      return;
    } else {
      _selectedEntry = value;
      notifyListeners();
    }
  }

  Function get onChangedSelectedEntry => _onChangedSelectedEntry;

  final List<DropdownMenuItem<String>> _entryList = [
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
  List<DropdownMenuItem<String>> get entryList => _entryList;

  // Select city screen

  bool _selectCityScreenState = false;
  bool get selectCityScreenState => _selectCityScreenState;
  final Map<String, bool> _cityList = {};
  Map<String, bool> get cityList => _cityList;
  void _setSelectCityScreenState() async {
    if (_selectCityScreenState) {
      _selectCityScreenState = !_selectCityScreenState;
    } else {
      _selectCityScreenState = !_selectCityScreenState;
      await ApiClient().getCitiesList().then(
        (value) {
          for (String element in value) {
            _cityList[element] = false;
          }
        },
      );
    }
    notifyListeners();
  }

  Function get setSelectCityScreenState => _setSelectCityScreenState;

  // Select button state

  bool _citySelectButtonState = false;
  bool get citySelectButtonState => _citySelectButtonState;
  void _setCitySelectButtonState() {
    for (bool value in _cityList.values.toList()) {
      if (value) {
        _citySelectButtonState = true;
        break;
      } else {
        _citySelectButtonState = false;
      }
    }
  }

  // Click city list item

  void _onClickCityListItem(int index) {
    _cityList.update(_cityList.keys.toList()[index],
        (value) => !_cityList.values.toList()[index]);
    _setCitySelectButtonState();
    notifyListeners();
  }

  Function get onClickCityListItem => _onClickCityListItem;

  // English or polish level list

  String? _selectedPolishLevel;
  String? get selectedPolishLevel => _selectedPolishLevel;

  String? _selectedEnglishLevel;
  String? get selectedEnglishLevel => _selectedEnglishLevel;

  final List<DropdownMenuItem<String>> _levelList = [
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
  List<DropdownMenuItem<String>> get levelList => _levelList;

  // Select skill screen

  bool _selectSkillScreenState = false;
  bool get selectSkillScreenState => _selectSkillScreenState;
  void _setSelectSkillScreenState() async {
    if (_selectSkillScreenState) {
      _selectSkillScreenState = !_selectSkillScreenState;
    } else {
      await ApiClient().getSkillsList().then(
        (value) {
          for (String element in value) {
            _skillList[element] = false;
          }
        },
      );
      _selectSkillScreenState = !_selectSkillScreenState;
    }
    notifyListeners();
  }

  Function get setSelectSkillScreenState => _setSelectSkillScreenState;

  final Map<String, bool> _skillList = {};
  Map<String, bool> get skillList => _skillList;

  void _onClickSkillListItem(int index) {
    _skillList.update(_skillList.keys.toList()[index],
        (value) => !_skillList.values.toList()[index]);
    _setSelectSkillButtonState();
    notifyListeners();
  }

  Function get onClickSkillListItem => _onClickSkillListItem;

  // Select skill button

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
}
