import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ResumeScreenController extends ChangeNotifier {
  // Resume step one

  bool _resumeStepOneScreenState = false;
  bool get resumeStepOneScreenState => _resumeStepOneScreenState;
  void _setResumeStepOneScreenState() {
    _resumeStepOneScreenState = !_resumeStepOneScreenState;
    notifyListeners();
  }

  Function get setResumeStepOneScreenState => _setResumeStepOneScreenState;

  // Resume name field

  final TextEditingController _resumeNameController = TextEditingController();
  TextEditingController get resumeNameController => _resumeNameController;

  bool _stepOneScreenNextButtonState = false;
  bool get stepOneScreenNextButtonState => _stepOneScreenNextButtonState;
  void _setStepOneScreenNextButtonState() {
    _resumeNameController.text.isEmpty
        ? _stepOneScreenNextButtonState = false
        : _stepOneScreenNextButtonState = true;
    notifyListeners();
  }

  Function get setStepOneScreenNextButtonState =>
      _setStepOneScreenNextButtonState;

  void _onClickStepOneScreenNextButton(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    _setResumeStepTwoScreenState();
  }

  Function get onClickStepOneScreenNextButton =>
      _onClickStepOneScreenNextButton;

  // Resume step two

  bool _resumeStepTwoScreenState = false;
  bool get resumeStepTwoScreenState => _resumeStepTwoScreenState;
  void _setResumeStepTwoScreenState() {
    _resumeStepTwoScreenState = !_resumeStepTwoScreenState;
    notifyListeners();
  }

  Function get setResumeStepTwoScreenState => _setResumeStepTwoScreenState;

  // Scroll controller

  final ScrollController _stepTwoScreenScrollController = ScrollController();
  ScrollController get stepTwoScrollController =>
      _stepTwoScreenScrollController;

  // Name field

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;
  // Surname field

  final TextEditingController _surNameController = TextEditingController();
  TextEditingController get surNameController => _surNameController;

  // Select birthday date

  String? _selectedBirthDayDate;
  String? get selectedBirthDayDate => _selectedBirthDayDate;
  void _onClickBirthDayField(BuildContext context) async {
    _onClickOutSidePhoneNumberField();
    FocusScope.of(context).requestFocus(FocusNode());
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
          _selectedBirthDayDate = null;
          value.day > 9
              ? _selectedBirthDayDate = value.day.toString()
              : _selectedBirthDayDate = "0${value.day}";
          value.month > 9
              ? _selectedBirthDayDate =
                  "${_selectedBirthDayDate!}-${value.month}"
              : _selectedBirthDayDate =
                  "${_selectedBirthDayDate!}-0${value.month}";
          _selectedBirthDayDate = "${_selectedBirthDayDate!}-${value.year}";
          _setStepTwoScreenNextButtonState();
          notifyListeners();
        }
      },
    );
  }

  Function get onClickBirthDayField => _onClickBirthDayField;

  // Email field

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;
  bool _emailErrorState = false;
  bool get emailErrorState => _emailErrorState;
  final String _emailErrorText = "Неправильний формат пошти";
  String get emailErrorText => _emailErrorText;

  // Phone number filed

  final TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;
  bool _phoneNumberPrefixState = false;
  bool get phoneNumberPrefixState => _phoneNumberPrefixState;
  void _onClickPhoneNUmberField() {
    if (_phoneNumberPrefixState) {
      return;
    } else {
      _phoneNumberPrefixState = true;
      notifyListeners();
    }
  }

  Function get onClickPhoneNumberFiled => _onClickPhoneNUmberField;

  void _onClickOutSidePhoneNumberField() {
    if (_phoneController.text.isEmpty) {
      _phoneNumberPrefixState = false;
      notifyListeners();
    } else {
      return;
    }
  }

  Function get onClickOutSidePhoneNumberField =>
      _onClickOutSidePhoneNumberField;

  // Select state dropdown button

  String? _selectedState;
  String? get selectedState => _selectedState;
  void _setSelectedState(String? value) {
    if (value == null) {
      return;
    } else {
      _selectedState = value;
      _setStepTwoScreenNextButtonState();
      notifyListeners();
    }
  }

  Function get setSelectedState => _setSelectedState;

  final List<DropdownMenuItem<String>> _stateList = [
    DropdownMenuItem(
      value: "Ukraina",
      child: Row(
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
            padding: EdgeInsets.only(left: 10.0.w),
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
    DropdownMenuItem(
      value: "Polska",
      child: Row(
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
            padding: EdgeInsets.only(left: 10.0.w),
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
    DropdownMenuItem(
      value: "Czechy",
      child: Row(
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
            padding: EdgeInsets.only(left: 10.0.w),
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
    DropdownMenuItem(
      value: "Słowacja",
      child: Row(
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
            padding: EdgeInsets.only(left: 10.0.w),
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
    DropdownMenuItem(
      value: "Niemcy",
      child: Row(
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
            padding: EdgeInsets.only(left: 10.0.w),
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
  ];
  List<DropdownMenuItem<String>> get stateList => _stateList;

  // Select language screen

  bool _selectLanguageScreenState = false;
  bool get selectLanguageScreenState => _selectLanguageScreenState;
  void _setSelectLanguageScreenState(BuildContext context) {
    _onClickOutSidePhoneNumberField();
    FocusScope.of(context).requestFocus(FocusNode());
    if (_selectLanguageScreenState) {
      _addLanguageButtonState = false;
      _languageList.forEach(
        (key, value) {
          _languageList.update(key, (value) => false);
        },
      );
      _selectLanguageScreenState = !_selectLanguageScreenState;
    } else {
      _selectLanguageScreenState = !_selectLanguageScreenState;
    }

    notifyListeners();
  }

  Function get setSelectLanguageScreenState => _setSelectLanguageScreenState;

  final Map<String, bool> _languageList = {
    "англійська": false,
    "польська": false,
    "iспанська": false,
    "китайська": false,
    "французька": false,
    "українська": false,
    "німецька": false,
    "чеська": false,
    "корейська": false,
    "португальська": false
  };
  Map<String, bool> get languageList => _languageList;

  void _onCliclLanguageListItem(int index) {
    _languageList.forEach((key, value) {
      if (key == _languageList.keys.toList()[index]) {
        _languageList.update(key, (value) => true);
        _addLanguageButtonState = true;
      } else {
        _languageList.update(key, (value) => false);
      }
    });
    notifyListeners();
  }

  Function get onClickLanguageListItem => _onCliclLanguageListItem;

  // Add languange button

  bool _addLanguageButtonState = false;
  bool get addLanguageButtonState => _addLanguageButtonState;

  void _onClickAddLanguageButton() {
    _addLanguageButtonState = false;
    _languageList.forEach(
      (key, value) {
        if (value) {
          _addedLanguagesList[key] = null;
        }
        _languageList.update(key, (value) => false);
      },
    );
    _selectLanguageScreenState = !_selectLanguageScreenState;
    _setStepTwoScreenNextButtonState();
    notifyListeners();
  }

  Function get onClickAddLanguageButton => _onClickAddLanguageButton;

  final Map<String, String?> _addedLanguagesList = {};
  Map<String, String?> get addedLanguagesList => _addedLanguagesList;

  // Language level list

  final List<DropdownMenuItem<String>> _languageLevelList = [
    DropdownMenuItem(
      value: "A1 – Początkujący",
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
      value: "A2 – Podstawowy",
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
      value: "B1 – Średnio zaawansowany",
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
      value: "B2 – Ponad średnio zaawansowany",
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
      value: "C1 – Zaawansowany",
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
    DropdownMenuItem(
      value: "C2 – Biegły",
      child: Text(
        "C2",
        style: GoogleFonts.roboto(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
      ),
    ),
    DropdownMenuItem(
      value: "Ojczysty",
      child: Text(
        "Рідний",
        style: GoogleFonts.roboto(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
      ),
    ),
  ];
  List<DropdownMenuItem<String>> get languageLevelList => _languageLevelList;

  void _onClickLanguageLevelListItem(String? selectedValue, int index) {
    if (selectedValue == null) {
      return;
    } else {
      _addedLanguagesList.update(
          _addedLanguagesList.keys.toList()[index], (value) => selectedValue);
      _setStepTwoScreenNextButtonState();
      notifyListeners();
    }
  }

  Function get onClickLanguageLevelListItem => _onClickLanguageLevelListItem;

  // Delete selected language from list

  void _onClickDeleteLanguageIcon(BuildContext context, int index) {
    _onClickOutSidePhoneNumberField();
    FocusScope.of(context).requestFocus(FocusNode());
    _addedLanguagesList.remove(_addedLanguagesList.keys.toList()[index]);
    _setStepTwoScreenNextButtonState();
    notifyListeners();
  }

  Function get onClickDeleteLanguageIcon => _onClickDeleteLanguageIcon;

  // Step two next button

  bool _stepTwoScreenNextButtonState = false;
  bool get stepTwoScreenNextButtonState => _stepTwoScreenNextButtonState;
  void _setStepTwoScreenNextButtonState() {
    bool tempo = false;
    for (String? value in _addedLanguagesList.values.toList()) {
      if (value == null) {
        tempo = false;
        break;
      } else {
        tempo = true;
      }
    }
    if (_nameController.text.isNotEmpty &&
        _surNameController.text.isNotEmpty &&
        _selectedBirthDayDate != null &&
        _emailController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _selectedState != null &&
        _addedLanguagesList.isNotEmpty &&
        tempo) {
      _stepTwoScreenNextButtonState = true;
    } else {
      _stepTwoScreenNextButtonState = false;
    }
    notifyListeners();
  }

  Function get setStepTwoScreenNextButtonState =>
      _setStepTwoScreenNextButtonState;
  // Image picker

  File? _pickedImage;
  File? get pickedImage => _pickedImage;
  void _deletePickedImage(BuildContext context) {
    _onClickOutSidePhoneNumberField();
    FocusScope.of(context).requestFocus(FocusNode());
    _pickedImage = null;
    notifyListeners();
  }

  Function get deletePickedImage => _deletePickedImage;

  void _onClickPickImage(BuildContext context) async {
    _onClickOutSidePhoneNumberField();
    FocusScope.of(context).requestFocus(FocusNode());
    try {
      XFile? result =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (result == null) {
        return;
      } else {
        await ImageCropper().cropImage(
          sourcePath: result.path,
          compressQuality: 70,
          aspectRatio: const CropAspectRatio(ratioX: 3, ratioY: 4),
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
          uiSettings: [
            Platform.isAndroid
                ? AndroidUiSettings(
                    hideBottomControls: true,
                  )
                : IOSUiSettings(
                    minimumAspectRatio: 3 / 4,
                    aspectRatioLockEnabled: true,
                    rotateButtonsHidden: true,
                    hidesNavigationBar: true,
                    aspectRatioPickerButtonHidden: true,
                    doneButtonTitle: "Вибрати",
                    cancelButtonTitle: "Закрити",
                  ),
          ],
        ).then(
          (value) {
            if (value == null) {
              return;
            } else {
              _pickedImage = File(value.path);
              notifyListeners();
            }
          },
        );
      }
    } catch (e) {
      return;
    }
  }

  Function get onClickPickImage => _onClickPickImage;

  void _onClickStepTwoScreenNextButton(BuildContext context) {
    if (RegExp(r"(\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6})")
        .hasMatch(_emailController.text)) {
      _emailErrorState = false;
      FocusScope.of(context).requestFocus(FocusNode());

      _setStepThreeScreenState();
    } else {
      _emailErrorState = true;
      notifyListeners();
      _stepTwoScreenScrollController.animateTo(
        200.0.h,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );
    }
  }

  Function get onClickStepTwoScreenNextButton =>
      _onClickStepTwoScreenNextButton;

  // Step three screen

  bool _stepThreeScreenState = false;
  bool get stepThreeScreenState => _stepThreeScreenState;
  void _setStepThreeScreenState() {
    _stepThreeScreenState = !_stepThreeScreenState;
    notifyListeners();
  }

  Function get setStepThreeScreenState => _setStepThreeScreenState;

  // Added work experience

  final List<Map<String, String>> _workExperienceList = [];
  List<Map<String, String>> get workExperienceList => _workExperienceList;

  // Add work experience screen

  bool _addWorkExperienceScreenState = false;
  bool get addWorkExperienceScreenState => _addWorkExperienceScreenState;
  void _setAddWorkExperienceScreenState() {
    if (_addWorkExperienceScreenState) {
      _positionController.clear();
      _companyController.clear();
      _selectedStartDate = null;
      _selectedEndDate = null;
      _checkBoxState = false;
      _editedWorkExperienceItemIndex = null;
      _addWorkExperienceButtonState = false;
      _addWorkExperienceScreenState = !_addWorkExperienceScreenState;
    } else {
      _addWorkExperienceScreenState = !_addWorkExperienceScreenState;
    }

    notifyListeners();
  }

  Function get setAddWorkExperienceScreenState =>
      _setAddWorkExperienceScreenState;

  void _onClickStartEndDateField(BuildContext context, String type) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
        DateTime.now().year - 100,
        DateTime.now().month,
        DateTime.now().day,
      ),
      lastDate: DateTime.now(),
    ).then(
      (value) {
        if (value == null) {
          return;
        } else {
          switch (type) {
            case "start_date":
              {
                _selectedStartDate = null;
                value.day > 9
                    ? _selectedStartDate = value.day.toString()
                    : _selectedStartDate = "0${value.day}";
                value.month > 9
                    ? _selectedStartDate =
                        "${_selectedStartDate!}-${value.month}"
                    : _selectedStartDate =
                        "${_selectedStartDate!}-0${value.month}";
                _selectedStartDate = "${_selectedStartDate!}-${value.year}";
                break;
              }
            case "end_date":
              {
                _selectedEndDate = null;
                value.day > 9
                    ? _selectedEndDate = value.day.toString()
                    : _selectedEndDate = "0${value.day}";
                value.month > 9
                    ? _selectedEndDate = "${_selectedEndDate!}-${value.month}"
                    : _selectedEndDate = "${_selectedEndDate!}-0${value.month}";
                _selectedEndDate = "${_selectedEndDate!}-${value.year}";
                break;
              }
          }
          _setAddWorkExperienceButtonState();
          notifyListeners();
        }
      },
    );
  }

  Function get onClickStartEndDateField => _onClickStartEndDateField;

  // Position field

  final TextEditingController _positionController = TextEditingController();
  TextEditingController get positionController => _positionController;

  // Сompany field

  final TextEditingController _companyController = TextEditingController();
  TextEditingController get companyController => _companyController;

  // Start date

  String? _selectedStartDate;
  String? get selectedStartDate => _selectedStartDate;

  // End date

  String? _selectedEndDate;
  String? get selectedEndDate => _selectedEndDate;

  // Checkbox state

  bool _checkBoxState = false;
  bool get checkBoxState => _checkBoxState;
  void _setCheckBoxState(bool value) {
    _checkBoxState = value;
    _selectedEndDate = null;
    _setAddWorkExperienceButtonState();
    notifyListeners();
  }

  Function get setCheckBoxState => _setCheckBoxState;

  // Add work experience button

  bool _addWorkExperienceButtonState = false;
  bool get addWorkExperienceButtonState => _addWorkExperienceButtonState;

  void _setAddWorkExperienceButtonState() {
    if (checkBoxState) {
      if (_positionController.text.isNotEmpty &&
          _companyController.text.isNotEmpty &&
          _selectedStartDate != null) {
        _selectedEndDate = null;
        _addWorkExperienceButtonState = true;
      } else {
        _addWorkExperienceButtonState = false;
      }
    } else {
      if (_positionController.text.isNotEmpty &&
          _companyController.text.isNotEmpty &&
          _selectedStartDate != null &&
          _selectedEndDate != null) {
        _addWorkExperienceButtonState = true;
      } else {
        _addWorkExperienceButtonState = false;
      }
    }
    notifyListeners();
  }

  Function get setAddWorkExperienceButtonState =>
      _setAddWorkExperienceButtonState;

  int? _editedWorkExperienceItemIndex;
  void _setEditedIndex(int index) {
    _editedWorkExperienceItemIndex = index;
  }

  void _onClickAddWorkExperienceButton() {
    if (_editedWorkExperienceItemIndex == null) {
      _workExperienceList.add(
        {
          "position": _positionController.text,
          "company": _companyController.text,
          "start_date": _selectedStartDate!,
          "end_date": _selectedEndDate == null ? "зараз" : _selectedEndDate!,
        },
      );
    } else {
      _workExperienceList[_editedWorkExperienceItemIndex!]["position"] =
          _positionController.text;
      _workExperienceList[_editedWorkExperienceItemIndex!]["company"] =
          _companyController.text;
      _workExperienceList[_editedWorkExperienceItemIndex!]["start_date"] =
          _selectedStartDate!;
      _workExperienceList[_editedWorkExperienceItemIndex!]["end_date"] =
          _selectedEndDate == null ? "зараз" : _selectedEndDate!;
    }
    _positionController.clear();
    _companyController.clear();
    _selectedStartDate = null;
    _selectedEndDate = null;
    _checkBoxState = false;
    _editedWorkExperienceItemIndex = null;
    _addWorkExperienceButtonState = false;
    _setAddWorkExperienceScreenState();
  }

  Function get onClickAddWorkExperienceButton =>
      _onClickAddWorkExperienceButton;

  // Delete added work experience

  void _onClickAddedWorkExperienceDeleteIcon(int index) {
    _workExperienceList.remove(_workExperienceList[index]);
    notifyListeners();
  }

  Function get onClickAddedWorkExperienceDeleteIcon =>
      _onClickAddedWorkExperienceDeleteIcon;

  // Edit added work experience

  void _onClickAddedWorkExperienceEditButton(int index) {
    _positionController.text = _workExperienceList[index]["position"]!;
    _companyController.text = _workExperienceList[index]["company"]!;
    _selectedStartDate = _workExperienceList[index]["start_date"]!;
    _selectedEndDate = _workExperienceList[index]["end_date"]! == "зараз"
        ? null
        : _workExperienceList[index]["end_date"]!;
    _workExperienceList[index]["end_date"] == "зараз"
        ? _checkBoxState = true
        : _checkBoxState = false;
    _setEditedIndex(index);
    _addWorkExperienceButtonState = true;
    _setAddWorkExperienceScreenState();
  }

  Function get onClickAddedWorkExperienceEditButton =>
      _onClickAddedWorkExperienceEditButton;

  // Step four screen

  bool _stepFourScreenState = false;
  bool get stepFourScreenState => _stepFourScreenState;
  void _setStepFourScreenState() {
    _stepFourScreenState = !_stepFourScreenState;
    notifyListeners();
  }

  Function get setStepFourScreenState => _setStepFourScreenState;

  // Added education

  final List<Map<String, String>> _addedEducationList = [];
  List<Map<String, String>> get addedEducationList => _addedEducationList;

  // Education screen

  bool _educationScreenState = false;
  bool get educationScreenState => _educationScreenState;
  void _setEducationScreenState() {
    if (_educationScreenState) {
      _specialityController.clear();
      _institutionControlller.clear();
      _educationLevelControlller.clear();
      _startEducationDate = null;
      _endEducationDate = null;
      _educationScreenCheckBoxState = false;
      _addEducationButtonState = false;
      _educationEditIndex = null;
    }
    _educationScreenState = !_educationScreenState;
    notifyListeners();
  }

  Function get setEducationScreenState => _setEducationScreenState;

  // Speciality filed

  final TextEditingController _specialityController = TextEditingController();
  TextEditingController get specialityController => _specialityController;

  // Institution field

  final TextEditingController _institutionControlller = TextEditingController();
  TextEditingController get institutionControlller => _institutionControlller;

  // Education level

  final TextEditingController _educationLevelControlller =
      TextEditingController();
  TextEditingController get educationLevelControlller =>
      _educationLevelControlller;

  // Start and End education date fields

  String? _startEducationDate;
  String? get startEducationDate => _startEducationDate;

  String? _endEducationDate;
  String? get endEducationDate => _endEducationDate;

  void _onClickStartEndEducationDate(BuildContext context, String type) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
        DateTime.now().year - 100,
        DateTime.now().month,
        DateTime.now().day,
      ),
      lastDate: DateTime.now(),
    ).then(
      (value) {
        if (value == null) {
          return;
        } else {
          switch (type) {
            case "start_date":
              {
                _startEducationDate = null;
                value.day > 9
                    ? _startEducationDate = value.day.toString()
                    : _startEducationDate = "0${value.day}";
                value.month > 9
                    ? _startEducationDate =
                        "${_startEducationDate!}-${value.month}"
                    : _startEducationDate =
                        "${_startEducationDate!}-0${value.month}";
                _startEducationDate = "${_startEducationDate!}-${value.year}";
                break;
              }
            case "end_date":
              {
                _endEducationDate = null;
                value.day > 9
                    ? _endEducationDate = value.day.toString()
                    : _endEducationDate = "0${value.day}";
                value.month > 9
                    ? _endEducationDate = "${_endEducationDate!}-${value.month}"
                    : _endEducationDate =
                        "${_endEducationDate!}-0${value.month}";
                _endEducationDate = "${_endEducationDate!}-${value.year}";
                break;
              }
          }
          _setAddEducationButtonState();
          notifyListeners();
        }
      },
    );
  }

  Function get onClickStartEndEducationDate => _onClickStartEndEducationDate;

  // Check box state

  bool _educationScreenCheckBoxState = false;
  bool get educationScreenCheckBoxState => _educationScreenCheckBoxState;
  void _setEducationScreenCheckBoxState(bool value) {
    _educationScreenCheckBoxState = value;
    _endEducationDate = null;
    _setAddEducationButtonState();
    notifyListeners();
  }

  Function get setEducationScreenCheckBoxState =>
      _setEducationScreenCheckBoxState;

  // Add education button

  bool _addEducationButtonState = false;
  bool get addEducationButtonState => _addEducationButtonState;

  void _setAddEducationButtonState() {
    if (_educationScreenCheckBoxState) {
      if (_specialityController.text.isNotEmpty &&
          _institutionControlller.text.isNotEmpty &&
          educationLevelControlller.text.isNotEmpty &&
          _startEducationDate != null) {
        _addEducationButtonState = true;
      } else {
        _addEducationButtonState = false;
      }
    } else {
      if (_specialityController.text.isNotEmpty &&
          _institutionControlller.text.isNotEmpty &&
          _educationLevelControlller.text.isNotEmpty &&
          _startEducationDate != null &&
          _endEducationDate != null) {
        _addEducationButtonState = true;
      } else {
        _addEducationButtonState = false;
      }
    }
    notifyListeners();
  }

  Function get setAddEducationButtonState => _setAddEducationButtonState;

  // Click add education button

  void _onClickAddEducationButton() {
    if (_educationEditIndex == null) {
      _addedEducationList.add(
        {
          "speciality": _specialityController.text,
          "institution": _institutionControlller.text,
          "education_level": _educationLevelControlller.text,
          "start_date": _startEducationDate!,
          "end_date": _endEducationDate == null ? "зараз" : _endEducationDate!,
        },
      );
    } else {
      _addedEducationList[_educationEditIndex!]["speciality"] =
          _specialityController.text;
      _addedEducationList[_educationEditIndex!]["institution"] =
          _institutionControlller.text;
      _addedEducationList[_educationEditIndex!]["education_level"] =
          _educationLevelControlller.text;
      _addedEducationList[_educationEditIndex!]["start_date"] =
          _startEducationDate!;
      _addedEducationList[_educationEditIndex!]["end_date"] =
          _endEducationDate == null ? "зараз" : _endEducationDate!;
    }
    _specialityController.clear();
    _institutionControlller.clear();
    _educationLevelControlller.clear();
    _startEducationDate = null;
    _endEducationDate = null;
    _educationScreenCheckBoxState = false;
    _addEducationButtonState = false;
    _educationEditIndex = null;
    _setEducationScreenState();
  }

  Function get onClickAddEducationButton => _onClickAddEducationButton;

  // Delete added education

  void _onClickAddedEducationListDeleteIcon(int index) {
    _addedEducationList.remove(_addedEducationList[index]);
    notifyListeners();
  }

  Function get onClickAddedEducationListDeleteIcon =>
      _onClickAddedEducationListDeleteIcon;

  // Education item index for editing

  int? _educationEditIndex;

  // Click education edit icon

  void _onClickEducationItemEditIcon(int index) {
    _educationEditIndex = index;
    _specialityController.text = _addedEducationList[index]["speciality"]!;
    _institutionControlller.text = _addedEducationList[index]["institution"]!;
    _educationLevelControlller.text =
        _addedEducationList[index]["education_level"]!;
    _startEducationDate = _addedEducationList[index]["start_date"]!;
    _endEducationDate = _addedEducationList[index]["end_date"]! == "зараз"
        ? null
        : _addedEducationList[index]["end_date"]!;
    _addedEducationList[index]["end_date"] == "зараз"
        ? _educationScreenCheckBoxState = true
        : _educationScreenCheckBoxState = false;
    _addEducationButtonState = true;
    _setEducationScreenState();
  }

  Function get onClickEducationItemEditIcon => _onClickEducationItemEditIcon;

  // Step five screen

  bool _stepFiveScreenState = false;
  bool get stepFiveScreenState => _stepFiveScreenState;
  void _setStepFiveScreenState() {
    _stepFiveScreenState = !_stepFiveScreenState;
    notifyListeners();
  }

  Function get setStepFiveScreenState => _setStepFiveScreenState;

  // Qualification field

  final TextEditingController _qualificationController =
      TextEditingController();
  TextEditingController get qualificationController => _qualificationController;

  // Create resume button state

  bool _createResumeButtonState = false;
  bool get createResumeButtonState => _createResumeButtonState;
  void _setCreateResumeButtonState() {
    _qualificationController.text.isNotEmpty
        ? _createResumeButtonState = true
        : _createResumeButtonState = false;
    notifyListeners();
  }

  Function get setCreateResumeButtonState => _setCreateResumeButtonState;

  // Create resume screen

  bool _createResumeScreenState = false;
  bool get createResumeScreenState => _createResumeScreenState;
  void _setCreateResumeScreenState() {
    Map<String, String?> tempoLanguaguesList = {};
    if (_addedLanguagesList.isNotEmpty) {
      _addedLanguagesList.forEach(
        (key, value) {
          switch (key) {
            case "англійська":
              {
                tempoLanguaguesList["angielski"] = value;
                break;
              }
            case "польська":
              {
                tempoLanguaguesList["polski"] = value;
                break;
              }
            case "iспанська":
              {
                tempoLanguaguesList["hiszpański"] = value;
                break;
              }
            case "китайська":
              {
                tempoLanguaguesList["chiński"] = value;
                break;
              }
            case "французька":
              {
                tempoLanguaguesList["francuski"] = value;
                break;
              }
            case "українська":
              {
                tempoLanguaguesList["ukraiński"] = value;
                break;
              }
            case "німецька":
              {
                tempoLanguaguesList["niemiecki"] = value;
                break;
              }
            case "чеська":
              {
                tempoLanguaguesList["czeski"] = value;
                break;
              }
            case "корейська":
              {
                tempoLanguaguesList["koreański"] = value;
                break;
              }
            case "португальська":
              {
                tempoLanguaguesList["portugalski"] = value;
                break;
              }
          }
        },
      );
    }
    List<Map<String, String>> _tempoWorkExperience = [];
    if (_workExperienceList.isNotEmpty) {
      for (Map<String, String> element in _workExperienceList) {
        _tempoWorkExperience.add({
          "position": element["position"]!,
          "company": element["company"]!,
          "start_date": element["start_date"]!,
          "end_date":
              element["end_date"] == "зараз" ? "teraz" : element["end_date"]!,
        });
      }
    }

    List<Map<String, String>> _tempoEducation = [];
    if (_addedEducationList.isNotEmpty) {
      for (Map<String, String> element in _addedEducationList) {
        _tempoEducation.add({
          "speciality": element["speciality"]!,
          "institution": element["institution"]!,
          "start_date": element["start_date"]!,
          "end_date":
              element["end_date"] == "зараз" ? "teraz" : element["end_date"]!,
        });
      }
    }

    Map<String, dynamic> user_resume = {
      "user_id":1,
      "resume_name":
          "${_resumeNameController.text.trim().replaceAll(" ", "_")}_${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}.pdf",
      "name": _nameController.text.trim(),
      "surname": _surNameController.text.trim(),
      "birth_date": _selectedBirthDayDate,
      "email": emailController.text,
      "phone_number": "+${_phoneController.text}",
      "selected_state": _selectedState,
      "selected_language": tempoLanguaguesList,
      "work_experience": _tempoWorkExperience,
      "education": _tempoEducation,
      "qualification": _qualificationController.text,
      "photo": _pickedImage
    };
    print(user_resume);
    _createResumeScreenState = !_createResumeScreenState;
    notifyListeners();
  }

  Function get setCreateResumeScreenState => _setCreateResumeScreenState;

  // Close icon

  void _onClickCloseIcon() {
    _setResumeStepOneScreenState();
    _setResumeStepTwoScreenState();
    _setStepThreeScreenState();
    _setStepFourScreenState();
    _setStepFiveScreenState();
    _setCreateResumeScreenState();
  }

  Function get onClickCloseIcon => _onClickCloseIcon;

  // View Pdf document

  bool _pdfDocumentViewScreenState = false;
  bool get pdfDocumentViewScreenState => _pdfDocumentViewScreenState;
  void _setPdfDocumentViewScreenState() {
    _pdfDocumentViewScreenState = !_pdfDocumentViewScreenState;
    notifyListeners();
  }

  Function get setPdfDocumentViewScreenState => _setPdfDocumentViewScreenState;
}
