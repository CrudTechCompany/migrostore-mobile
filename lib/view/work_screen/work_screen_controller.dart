import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/service/migrostore_api.dart';
import 'package:migrostore/view/menu_screen/menu_screen_controller.dart';
import 'package:provider/provider.dart';

class WorkScreenController extends ChangeNotifier {
  // Scroll controller

  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  // Name field

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;
  // Surname field

  final TextEditingController _surnameController = TextEditingController();
  TextEditingController get surnameController => _surnameController;

  // Phone number field
  final TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;

  // Email field

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

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

  Function get onClickSelectDateField => _onClickSelectDateField;

  // Select state field

  String? _selectedState;
  String? get selectedState => _selectedState;
  void _onChangeSelectedState(String? value) {
    if (value == null) {
      _setSendButtonState();
      return;
    } else {
      _selectedState = value;
      _setSendButtonState();
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

  // Grounds for entry

  String? _selectedEntry;
  String? get selectedEntry => _selectedEntry;

  void _onChangedSelectedEntry(String? value) {
    if (value == null) {
      _setSendButtonState();
      return;
    } else {
      _selectedEntry = value;
      _setSendButtonState();
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
      _setSendButtonState();
      notifyListeners();
    }
  }

  Function get onChangedPolishOrEnglishLevel => _onChangedPolishOrEnglishLevel;

  bool _sendButtonState = false;
  bool get sentButtonState => _sendButtonState;
  void _setSendButtonState() {
    if (_nameController.text.isNotEmpty &&
        _surnameController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _selectedBirthDate != null &&
        _emailController.text.isNotEmpty &&
        _selectedState != null &&
        _selectedEntry != null &&
        _selectedCity != null &&
        _selectedPolishLevel != null &&
        _selectedEnglishLevel != null &&
        _selectedSkill != null) {
      _sendButtonState = true;
    } else {
      _sendButtonState = false;
    }
    notifyListeners();
  }

  Function get setSendButtonState => _setSendButtonState;

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
    _setSendButtonState();
  }

  Function get setSelectedCity => _setSelectedCity;

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
    _setSendButtonState();
  }

  Function get setSelectedSkill => _setSelectedSkill;

  bool _invalidEmailState = false;
  bool get invalidEmailState => _invalidEmailState;
  String? _invalidEmailMessage;
  String? get invalidEmailMessage => _invalidEmailMessage;

  bool _invalidPhoneState = false;
  bool get invalidPhoneState => _invalidPhoneState;
  String? _invalidPhoneMessage;
  String? get invalidPhoneMessage => _invalidPhoneMessage;

  // Successfully window

  bool _successfullyModalWindowState = false;
  bool get successfullyModalWindowState => _successfullyModalWindowState;
  void _setSuccessfullyModalWindowState() {
    _successfullyModalWindowState = !_successfullyModalWindowState;
    notifyListeners();
  }

  Function get setSuccessfullyModalWindowState =>
      _setSuccessfullyModalWindowState;

  void _onClickSendButton(BuildContext context) async {
    if (RegExp(r"(\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6})")
            .hasMatch(_emailController.text) &&
        _phoneController.text.length == 9) {
      _invalidEmailState = false;
      _invalidEmailMessage = null;
      _invalidPhoneState = false;
      _invalidPhoneMessage = null;
      notifyListeners();
      Map<String, String> data = {
        "user_id": "1",
        "name": _nameController.text.trim(),
        "surname": _surnameController.text.trim(),
        "phone_number": "+48${_phoneController.text.trim()}",
        "birth_day": _selectedBirthDate!,
        "email": _emailController.text.trim(),
        "state": _selectedState!,
        "entry_grounds": _selectedEntry!,
        "city": _selectedCity!,
        "polish_skill": _selectedPolishLevel!,
        "english_skill": _selectedEnglishLevel!,
        "skill": _selectedSkill!
      };
      int? status;
      try {
        status = await MigrostoreApi().sendWorkForm(data);
      } catch (e) {
        return;
      }
      if (status == 201) {
        setSuccessfullyModalWindowState();
      } else {
        return;
      }
    } else {
      if (RegExp(r"(\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6})")
          .hasMatch(_emailController.text)) {
        _invalidEmailState = false;
        _invalidEmailMessage = null;
      } else {
        _invalidEmailState = true;
        _invalidEmailMessage = "Неправильний формат пошти";
      }
      if (_phoneController.text.length == 9) {
        _invalidPhoneState = false;
        _invalidPhoneMessage = null;
      } else {
        _invalidPhoneState = true;
        _invalidPhoneMessage = "Неправильний формат номера";
      }
      notifyListeners();
      _scrollController.animateTo(0,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }
  }

  Function get onClickSendButton => _onClickSendButton;

  void _onClickBackToMainScreenButton(BuildContext context) {
    _setSuccessfullyModalWindowState();
    Provider.of<MenuScreenController>(context, listen: false)
        .setWorkScreenState();
  }

  Function get onClickBackToMainScreenButton => _onClickBackToMainScreenButton;

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

  // Initial modal window

  bool _initialModalWindowState = true;
  bool get initialModalWindowState => _initialModalWindowState;

  void _setInitialModalWindowState() {
    _initialModalWindowState = !_initialModalWindowState;
    notifyListeners();
  }

  Function get setInitialModalWindowState => _setInitialModalWindowState;
}
