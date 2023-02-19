import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:migrostore/service/migrostore_api.dart';

class ProfileScreenController extends ChangeNotifier {
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;
  void _setIsInitialized() {
    _isInitialized = !_isInitialized;
    notifyListeners();
  }

  Function get setIsInitialized => _setIsInitialized;

  void _setInitialState() {
    _nameController.text =
        Hive.box("userInfo").get("userInfo")["firstName"] ?? "";
    _surnameController.text =
        Hive.box("userInfo").get("userInfo")["lastName"] ?? "";
    _phoneController.text =
        Hive.box("userInfo").get("userInfo")["phoneNumber"] ?? "";
    _selectedBirthDate = Hive.box("userInfo").get("userInfo")["birthDate"];
    _emailController.text = Hive.box("userInfo").get("userInfo")["email"] ?? "";
    _selectedState = Hive.box("userInfo").get("userInfo")["countryOfStay"];
    _selectedEntry = Hive.box("userInfo").get("userInfo")["groundOfStay"];
    _selectedCity = Hive.box("userInfo").get("userInfo")["jobSearchCity"];
    _selectedPolishLevel = Hive.box("userInfo").get("userInfo")["polishLang"];
    _selectedEnglishLevel = Hive.box("userInfo").get("userInfo")["engLang"];
    _selectedSkill = Hive.box("userInfo").get("userInfo")["skills"];
    _phoneController.text.isEmpty
        ? _hintTextState = true
        : _hintTextState = false;
    _setSendButtonState();
  }

  Function get setInitializedState => _setInitialState;

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _surnameController = TextEditingController();
  TextEditingController get surnameController => _surnameController;

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;

  // Select date field

  String? _selectedBirthDate;
  String? get selectedBirthDate => _selectedBirthDate;

  void _onClickSelectDateField(BuildContext context) async {
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
          _selectedBirthDate = null;
          value.day > 9
              ? _selectedBirthDate = value.day.toString()
              : _selectedBirthDate = "0${value.day}";
          value.month > 9
              ? _selectedBirthDate = "${_selectedBirthDate!}-${value.month}"
              : _selectedBirthDate = "${_selectedBirthDate!}-0${value.month}";
          _selectedBirthDate = "${_selectedBirthDate!}-${value.year}";
          _setSendButtonState();
          notifyListeners();
        }
      },
    );
  }

  // Select state field

  String? _selectedState;
  String? get selectedState => _selectedState;
  void _onChangeSelectedState(String? value) {
    if (value == null) {
      return;
    } else {
      _selectedState = value;
      notifyListeners();
    }
  }

  Function get onChangeSelectedState => _onChangeSelectedState;

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

  Function get onClickSelectDateField => _onClickSelectDateField;

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
  void _setSelectCityScreenState() {
    _selectCityScreenState = !_selectCityScreenState;
    notifyListeners();
  }

  Function get setSelectCityScreenState => _setSelectCityScreenState;

  String? _selectedCity;
  String? get selectedCity => _selectedCity;
  void _setSelectedCity(String? value) {
    if (value == null) {
      _selectedCity = null;
    } else {
      if (_selectedCity == null) {
        _selectedCity = value;
      } else {
        _selectedCity = "${_selectedCity!}, $value";
      }
    }
  }

  Function get setSelectedCity => _setSelectedCity;

  // English or polish level list

  String? _selectedPolishLevel;
  String? get selectedPolishLevel => _selectedPolishLevel;

  String? _selectedEnglishLevel;
  String? get selectedEnglishLevel => _selectedEnglishLevel;

  final List<DropdownMenuItem<String>> _levelList = [
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
    DropdownMenuItem(
      value: "C1",
      child: Text(
        "C1",
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

  void _onChangedPolishOrEnglishLevel(String type, String? value) {
    if (value == null) {
      return;
    } else {
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
  }

  Function get onChangedPolishOrEnglishLevel => _onChangedPolishOrEnglishLevel;

  // Select skill screen

  bool _selectSkillScreenState = false;
  bool get selectSkillScreenState => _selectSkillScreenState;
  void _setSelectSkillScreenState() {
    _selectSkillScreenState = !_selectSkillScreenState;
    notifyListeners();
  }

  Function get setSelectSkillScreenState => _setSelectSkillScreenState;

  String? _selectedSkill;
  String? get selectedSkill => _selectedSkill;
  void _setSelectedSkill(String? value) {
    if (value == null) {
      _selectedSkill = null;
    } else {
      if (_selectedSkill == null) {
        _selectedSkill = value;
      } else {
        _selectedSkill = "${_selectedSkill!}, $value";
      }
    }
  }

  Function get setSelectedSkill => _setSelectedSkill;

  bool _sendButtonState = false;
  bool get sentButtonState => _sendButtonState;
  void _setSendButtonState() {
    if (_nameController.text.isNotEmpty &&
        _surnameController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _selectedBirthDate != null &&
        _emailController.text.isNotEmpty) {
      _sendButtonState = true;
    } else {
      _sendButtonState = false;
    }
    notifyListeners();
  }

  Function get setSendButtonState => _setSendButtonState;

  void _onClickSendButton() async {
    if (!Hive.isBoxOpen("userInfo")) {
      await Hive.openBox("userInfo");
    }
    Map<String, String?> data = {
      "firstName": _nameController.text.trim(),
      "lastName": _surnameController.text.trim(),
      "birthDate": _selectedBirthDate!,
      "phoneNumber": _phoneController.text,
      "countryOfStay": _selectedState,
      "groundOfStay": _selectedEntry,
      "jobSearchCity": _selectedCity,
      "polishLang": _selectedPolishLevel,
      "engLang": _selectedEnglishLevel,
      "skills": _selectedSkill
    };
    int? result;
    try {
      result = await MigrostoreApi().updateProfile(data);
    } catch (e) {
      return;
    }

    if (result == 200) {
      Box box = Hive.box("userInfo");
      box.get("userInfo")["firstName"] = _nameController.text.trim();
      box.get("userInfo")["lastName"] = _surnameController.text.trim();
      box.get("userInfo")["phoneNumber"] = _phoneController.text;
      box.get("userInfo")["birthDate"] = _selectedBirthDate;
      box.get("userInfo")["countryOfStay"] = _selectedState;
      box.get("userInfo")["groundOfStay"] = _selectedEntry;
      box.get("userInfo")["jobSearchCity"] = _selectedCity;
      box.get("userInfo")["polishLang"] = _selectedPolishLevel;
      box.get("userInfo")["engLang"] = _selectedEnglishLevel;
      box.get("userInfo")["skills"] = _selectedSkill;
      Hive.box("userInfo").put("userInfo", box.get("userInfo"));
      _setSuccessfullyModalWindowState();
    }
  }

  Function get onClickSendButton => _onClickSendButton;

  // Hint text for phone input

  bool _hintTextState = true;
  bool get hintTextState => _hintTextState;
  void _setHintTextState() {
    if (_phoneController.text.isEmpty) {
      _hintTextState = false;
    } else {
      return;
    }
    notifyListeners();
  }

  Function get setHintTextState => _setHintTextState;

  void _onClickOutside() {
    if (_phoneController.text.isEmpty) {
      _hintTextState = true;
    } else {
      _hintTextState = false;
    }
    notifyListeners();
  }

  Function get onClickOutside => _onClickOutside;

  // Successfully modal window

  bool _successfullyModalWindowState = false;
  bool get successfullyModalWindowState => _successfullyModalWindowState;
  void _setSuccessfullyModalWindowState() {
    _successfullyModalWindowState = !_successfullyModalWindowState;
    notifyListeners();
  }

  Function get setSuccessfullyModalWindowState =>
      _setSuccessfullyModalWindowState;
}
