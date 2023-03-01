import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:migrostore/service/migrostore_api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class ResumeScreenController extends ChangeNotifier {
  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  // CV name screen

  bool _cvNameScreenState = false;
  bool get cvNameScreenState => _cvNameScreenState;
  void _setCvNameScreenState() {
    _cvNameScreenState = !_cvNameScreenState;
    notifyListeners();
  }

  Function get setCvNameScreenState => _setCvNameScreenState;

  final TextEditingController _cvNameController = TextEditingController();
  TextEditingController get cvNameController => _cvNameController;

  bool _cvNameScreenNextButtonState = false;
  bool get cvNameScreenNextButtonState => _cvNameScreenNextButtonState;
  void _setCvNameScreenNextButtonState() {
    _cvNameController.text.isNotEmpty
        ? _cvNameScreenNextButtonState = true
        : _cvNameScreenNextButtonState = false;
    notifyListeners();
  }

  Function get setCvNameScreenNextButtonState =>
      _setCvNameScreenNextButtonState;

  void _onClickCvNameScreenNextButton() {
    _setBasicInfoScreenState();
  }

  Function get onClickCvNameScreenNextButton => _onClickCvNameScreenNextButton;

  // Basic info screen

  bool _basicInfoScreenState = false;
  bool get basicInfoScreenState => _basicInfoScreenState;
  void _setBasicInfoScreenState() {
    _basicInfoScreenState = !_basicInfoScreenState;
    notifyListeners();
  }

  Function get setBasicInfoScreenState => _setBasicInfoScreenState;

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _surnameController = TextEditingController();
  TextEditingController get surnameController => _surnameController;

  String? _selectedBirthday;
  String? get selectedBirthday => _selectedBirthday;

  void _onClickSelectBirthdayButton(BuildContext context) async {
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
          _selectedBirthday = null;
          value.day > 9
              ? _selectedBirthday = value.day.toString()
              : _selectedBirthday = "0${value.day}";
          value.month > 9
              ? _selectedBirthday = "${_selectedBirthday!}-${value.month}"
              : _selectedBirthday = "${_selectedBirthday!}-0${value.month}";
          _selectedBirthday = "${_selectedBirthday!}-${value.year}";
          notifyListeners();
          _setBasicInfoScreenNextButtonState();
        }
      },
    );
  }

  Function get onClickSelectBirthdayButton => _onClickSelectBirthdayButton;

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController get phoneNumberController => _phoneNumberController;

  String? _selectedState;
  String? get selectedState => _selectedState;

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

  void _onClickSelectStateButton(String? value) {
    if (value == null) {
      return;
    } else {
      _selectedState = value;
      notifyListeners();
      _setBasicInfoScreenNextButtonState();
    }
  }

  Function get onClickSelectStateButton => _onClickSelectStateButton;

  bool _selectLanguageScreenState = false;
  bool get selectLanguageScreenState => _selectLanguageScreenState;
  void _setSelectLanguageScreenState() {
    _languageList.forEach((key, value) {
      _languageList.update(key, (value) => false);
    });
    _selectLanguageScreenState = !_selectLanguageScreenState;
    notifyListeners();
  }

  Function get setSelectLanguageScreenState => _setSelectLanguageScreenState;

  final List<Map<String, String?>> _selectedLanguagesList = [];
  List<Map<String, String?>> get selectedLanguagesList =>
      _selectedLanguagesList;

  final Map<String, bool> _languageList = {
    "Англійська": false,
    "Польська": false,
    "Iспанська": false,
    "Китайська": false,
    "Французька": false,
    "Українська": false,
    "Німецька": false,
    "Чеська": false,
    "Корейська": false,
    "Португальська": false
  };
  Map<String, bool> get languageList => _languageList;

  void _onClickListItem(int index) {
    String item = _languageList.keys.toList()[index];
    _languageList.forEach(
      (key, value) {
        if (key == item) {
          _languageList.update(key, (value) => true);
          _selectedLanguage = item;
        } else {
          _languageList.update(key, (value) => false);
        }
      },
    );
    _setSelectButtonState();
    notifyListeners();
  }

  Function get onClickListItem => _onClickListItem;

  bool _selectButtonState = false;
  bool get selectButtonState => _selectButtonState;
  void _setSelectButtonState() {
    for (bool value in _languageList.values.toList()) {
      if (value) {
        _selectButtonState = true;
        break;
      } else {
        _selectButtonState = false;
      }
    }
  }

  String? _selectedLanguage;

  void _onClickSelectButton(BuildContext context) {
    bool isExistSelectedLanguage = false;
    for (Map<String, String?> item
        in context.read<ResumeScreenController>().selectedLanguagesList) {
      if (item["language"] == _selectedLanguage) {
        isExistSelectedLanguage = true;
        break;
      }
    }
    if (isExistSelectedLanguage) {
      context.read<ResumeScreenController>().setSelectLanguageScreenState();
      _languageList.forEach((key, value) {
        _languageList.update(key, (value) => false);
      });
    } else {
      context
          .read<ResumeScreenController>()
          .selectedLanguagesList
          .add({"language": _selectedLanguage!, "level": null});
      _languageList.forEach((key, value) {
        _languageList.update(key, (value) => false);
      });
      context.read<ResumeScreenController>().setSelectLanguageScreenState();
    }
  }

  Function get onClickSelectButton => _onClickSelectButton;

  final List<DropdownMenuItem<String?>> _languageLevelList = [
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
  List<DropdownMenuItem<String?>> get languageLevelList => _languageLevelList;

  void _onClickLanguageListItem(String? value, int index) {
    _selectedLanguagesList[index]["level"] = value;
    _setBasicInfoScreenNextButtonState();
  }

  Function get onClickLanguageListItem => _onClickLanguageListItem;

  void _onClickDeleteLanguageButton(int index) {
    _selectedLanguagesList.removeAt(index);
    _languageList.forEach((key, value) {
      _languageList.update(key, (value) => false);
    });
    notifyListeners();
    _setBasicInfoScreenNextButtonState();
  }

  Function get onClickDeleteLanguageButton => _onClickDeleteLanguageButton;

  File? _pickedImage;
  File? get pickedImage => _pickedImage;

  void _onClickPickImage(BuildContext context) async {
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
              _setBasicInfoScreenNextButtonState();
            }
          },
        );
      }
    } catch (e) {
      return;
    }
  }

  Function get onClickPickImage => _onClickPickImage;

  void _deletePickedImage(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    _pickedImage = null;
    _setBasicInfoScreenNextButtonState();
    notifyListeners();
  }

  Function get deletePickedImage => _deletePickedImage;

  bool _basicInfoScreenNextButtonState = false;
  bool get basicInfoScreenNextButtonState => _basicInfoScreenNextButtonState;
  void _setBasicInfoScreenNextButtonState() {
    if (_selectedLanguagesList.isEmpty) {
      _basicInfoScreenNextButtonState = false;
      return;
    } else {
      bool isExistLanguageLevel = false;
      for (Map<String, String?> item in _selectedLanguagesList) {
        if (item["level"] == null) {
          break;
        } else {
          isExistLanguageLevel = true;
        }
      }
      if (_nameController.text.isNotEmpty &&
          _surnameController.text.isNotEmpty &&
          _selectedBirthday != null &&
          _emailController.text.isNotEmpty &&
          _phoneNumberController.text.isNotEmpty &&
          _selectedState != null &&
          _selectedLanguagesList.isNotEmpty &&
          isExistLanguageLevel &&
          _pickedImage != null) {
        _basicInfoScreenNextButtonState = true;
      } else {
        _basicInfoScreenNextButtonState = false;
      }
    }
    notifyListeners();
  }

  Function get setBasinInfoScreenNextButtonState =>
      _setBasicInfoScreenNextButtonState;

  bool _invalidEmailState = false;
  bool get invalidEmailState => _invalidEmailState;

  String? _invalidEmailMessage;
  String? get invalidEmailMessage => _invalidEmailMessage;

  bool _invalidPhoneNumberState = false;
  bool get invalidPhoneNumberState => _invalidPhoneNumberState;

  String? _invalidPhoneNUmberMessage;
  String? get invalidPhoneNumberMessage => _invalidPhoneNUmberMessage;

  void _onClickBasicInfoScreenNextButton(BuildContext context) async {
    if (RegExp(r"(\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6})")
            .hasMatch(_emailController.text) &&
        _phoneNumberController.text[0] == "+") {
      _invalidEmailState = false;
      _invalidEmailMessage = null;
      _invalidPhoneNumberState = false;
      _invalidPhoneNUmberMessage = null;
      notifyListeners();
      _setWorkExperienceScreenState();
    } else {
      if (RegExp(r"(\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6})")
          .hasMatch(_emailController.text)) {
        _invalidEmailState = false;
        _invalidEmailMessage = null;
      } else {
        _invalidEmailState = true;
        _invalidEmailMessage = "Неправильний формат пошти";
      }
      if (phoneNumberController.text[0] == "+") {
        _invalidPhoneNumberState = false;
        _invalidPhoneNUmberMessage = null;
      } else {
        _invalidPhoneNumberState = true;
        _invalidPhoneNUmberMessage = "Неправильний формат номера";
      }
      await _scrollController.animateTo(
        180.0.h,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );
      notifyListeners();
    }
  }

  Function get onClickBasicInfoScreenNextButton =>
      _onClickBasicInfoScreenNextButton;

  // Work experience screen

  bool _workExperienceScreenState = false;
  bool get workExperienceScreenState => _workExperienceScreenState;
  void _setWorkExperienceScreenState() {
    _workExperienceScreenState = !_workExperienceScreenState;
    notifyListeners();
  }

  Function get setWorkExperienceScreenState => _setWorkExperienceScreenState;

  final List<Map<String, String?>> _workExperienceList = [];
  List<Map<String, String?>> get workExperienceList => _workExperienceList;

  void _onClickDeleteIcon(int index) {
    _workExperienceList.removeAt(index);
    notifyListeners();
  }

  Function get onClickDeleteIcon => _onClickDeleteIcon;

  int? _editIndex;
  int? get editIndex => _editIndex;
  void _setEditIndex(int? index) {
    _editIndex = index;
    notifyListeners();
  }

  Function get setEditIndex => _setEditIndex;

  void _onClickEditIcon(int index) {
    _setAddWorkExperienceScreenState();
    _editIndex = index;
    _positionController.text = _workExperienceList[index]["position"]!;
    _companyController.text = _workExperienceList[index]["company"]!;
    _selectedStartDate = _workExperienceList[index]["startDate"];
    _selectedEndDate = _workExperienceList[index]["endDate"] == "teraz"
        ? null
        : _workExperienceList[index]["endDate"];
    _checkBoxState = _selectedEndDate == null ? true : false;
    _setAddButtonState();
  }

  Function get onClickEditIcon => _onClickEditIcon;

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
      _addButtonState = false;
    }
    _addWorkExperienceScreenState = !_addWorkExperienceScreenState;
    notifyListeners();
  }

  Function get setAddWorkExperienceScreenState =>
      _setAddWorkExperienceScreenState;

  final TextEditingController _positionController = TextEditingController();
  TextEditingController get positionController => _positionController;

  final TextEditingController _companyController = TextEditingController();
  TextEditingController get companyController => _companyController;

  String? _selectedStartDate;
  String? get selectedStartDate => _selectedStartDate;

  void _onClickStartDateButton(BuildContext context) async {
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
          _selectedStartDate = null;
          value.month > 9
              ? _selectedStartDate = value.month.toString()
              : _selectedStartDate = "0${value.month}";
          _selectedStartDate = "${_selectedStartDate!}-${value.year}";
          _setAddButtonState();
          notifyListeners();
        }
      },
    );
  }

  Function get onClickStartDateButton => _onClickStartDateButton;

  String? _selectedEndDate;
  String? get selectedEndDate => _selectedEndDate;

  void _onClickEndDateButton(BuildContext context) async {
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
          _selectedEndDate = null;
          value.month > 9
              ? _selectedEndDate = value.month.toString()
              : _selectedEndDate = "0${value.month}";
          _selectedEndDate = "${_selectedEndDate!}-${value.year}";
          _setAddButtonState();
          notifyListeners();
        }
      },
    );
  }

  Function get onClickEndDateButton => _onClickEndDateButton;

  bool _checkBoxState = false;
  bool get checkBoxState => _checkBoxState;
  void _setCheckBoxState(bool value) {
    if (value) {
      _selectedEndDate = null;
    }
    _checkBoxState = value;
    _setAddButtonState();
    notifyListeners();
  }

  Function get setCheckBoxState => _setCheckBoxState;

  bool _addButtonState = false;
  bool get addButtonState => _addButtonState;
  void _setAddButtonState() {
    if (_checkBoxState) {
      if (_positionController.text.isNotEmpty &&
          _companyController.text.isNotEmpty &&
          _selectedStartDate != null) {
        _addButtonState = true;
      } else {
        _addButtonState = false;
      }
    } else {
      if (_positionController.text.isNotEmpty &&
          _companyController.text.isNotEmpty &&
          _selectedStartDate != null &&
          _selectedEndDate != null) {
        _addButtonState = true;
      } else {
        _addButtonState = false;
      }
    }
    notifyListeners();
  }

  Function get setAddButtonState => _setAddButtonState;

  void _onClickAddButton(BuildContext context) {
    if (_editIndex == null) {
      _workExperienceList.add({
        "position": _positionController.text,
        "company": _companyController.text,
        "startDate": _selectedStartDate,
        "endDate": _checkBoxState ? "teraz" : _selectedEndDate!
      });
      _positionController.clear();
      _companyController.clear();
      _selectedStartDate = null;
      _selectedEndDate = null;
      _checkBoxState = false;
    } else {
      _workExperienceList[_editIndex!] = {
        "position": _positionController.text,
        "company": _companyController.text,
        "startDate": _selectedStartDate,
        "endDate": _checkBoxState ? "teraz" : _selectedEndDate!
      };
    }
    _editIndex = null;
    _setAddWorkExperienceScreenState();
  }

  Function get onClickAddButton => _onClickAddButton;

  // Education screen

  bool _educationScreenState = false;
  bool get educationScreenState => _educationScreenState;

  void _setEducationScreenState() {
    _educationScreenState = !_educationScreenState;
    notifyListeners();
  }

  Function get setEducationScreenState => _setEducationScreenState;

  final List<Map<String, String>> _educationList = [];
  List<Map<String, String>> get educationList => _educationList;

  void _onClickDeleteEducationIcon(int index) {
    _educationList.removeAt(index);
    notifyListeners();
  }

  Function get onClickDeleteEducationIcon => _onClickDeleteEducationIcon;

  int? _editEducationIndex;

  void _onClickEditEducationIcon(int index) {
    _editEducationIndex = index;
    _specialityController.text = _educationList[index]["speciality"]!;
    _institutionController.text = _educationList[index]["institution"]!;
    _educationLevelController.text = _educationList[index]["educationLevel"]!;
    _startEducationDate = _educationList[index]["startDate"];
    _endEducationDate = _educationList[index]["endDate"] == "teraz"
        ? null
        : _educationList[index]["endDate"];
    _addEducationCheckboxState = _endEducationDate == null ? true : false;
    _setAddEducationButtonState();
    _setAddEducationScreenState();
  }

  Function get onClickEditEducationIcon => _onClickEditEducationIcon;

  // Add education screen

  bool _addEducationScreenState = false;
  bool get addEducationScreenState => _addEducationScreenState;
  void _setAddEducationScreenState() {
    if (_addEducationScreenState) {
      _specialityController.clear();
      _institutionController.clear();
      _educationLevelController.clear();
      _startEducationDate = null;
      _endEducationDate = null;
      _addEducationCheckboxState = false;
      _addEducationButtonState = false;
      _editEducationIndex = null;
    }
    _addEducationScreenState = !_addEducationScreenState;
    notifyListeners();
  }

  Function get setAddEducationScreenState => _setAddEducationScreenState;

  final TextEditingController _specialityController = TextEditingController();
  TextEditingController get specialityController => _specialityController;

  final TextEditingController _institutionController = TextEditingController();
  TextEditingController get institutionController => _institutionController;

  final TextEditingController _educationLevelController =
      TextEditingController();
  TextEditingController get educationLevelController =>
      _educationLevelController;

  String? _startEducationDate;
  String? get startEducationDate => _startEducationDate;

  String? _endEducationDate;
  String? get endEducationDate => _endEducationDate;

  bool _addEducationCheckboxState = false;
  bool get addEducationCheckboxState => _addEducationCheckboxState;
  void _setAddEducationCheckboxState(bool? value) {
    if (value == null) {
      return;
    } else {
      _addEducationCheckboxState = value;
      _endEducationDate = null;
      _setAddEducationButtonState();
      notifyListeners();
    }
  }

  Function get setAddEducationCheckboxState => _setAddEducationCheckboxState;

  void _onClickStartEducationButton(BuildContext context) async {
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
          _startEducationDate = null;
          value.day > 9
              ? _startEducationDate = value.day.toString()
              : _startEducationDate = "0${value.day}";
          value.month > 9
              ? _startEducationDate =
                  _startEducationDate! + value.month.toString()
              : _startEducationDate = "${_startEducationDate!}-0${value.month}";
          _startEducationDate = "${_startEducationDate!}-${value.year}";
          _setAddEducationButtonState();
          notifyListeners();
        }
      },
    );
  }

  Function get onClickStartEducationButton => _onClickStartEducationButton;

  void _onClickEndEducationButton(BuildContext context) async {
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
          _endEducationDate = null;
          value.day > 9
              ? _endEducationDate = value.day.toString()
              : _endEducationDate = "0${value.day}";
          value.month > 9
              ? _endEducationDate = _endEducationDate! + value.month.toString()
              : _endEducationDate = "${_endEducationDate!}-0${value.month}";
          _endEducationDate = "${_endEducationDate!}-${value.year}";
          _setAddEducationButtonState();
          notifyListeners();
        }
      },
    );
  }

  Function get onClickEndEducationButton => _onClickEndEducationButton;

  bool _addEducationButtonState = false;
  bool get addEducationButtonState => _addEducationButtonState;
  void _setAddEducationButtonState() {
    if (_addEducationCheckboxState) {
      if (_specialityController.text.isNotEmpty &&
          _institutionController.text.isNotEmpty &&
          _educationLevelController.text.isNotEmpty &&
          _startEducationDate != null) {
        _addEducationButtonState = true;
      } else {
        _addEducationButtonState = false;
      }
    } else {
      if (_specialityController.text.isNotEmpty &&
          _institutionController.text.isNotEmpty &&
          _educationLevelController.text.isNotEmpty &&
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

  void _onClickAddEducationButton() {
    if (_editEducationIndex == null) {
      _educationList.add({
        "speciality": _specialityController.text,
        "institution": _institutionController.text,
        "educationLevel": _educationLevelController.text,
        "startDate": _startEducationDate!,
        "endDate": _addEducationCheckboxState ? "teraz" : _endEducationDate!,
      });
    } else {
      _educationList[_editEducationIndex!] = {
        "speciality": _specialityController.text,
        "institution": _institutionController.text,
        "educationLevel": _educationLevelController.text,
        "startDate": _startEducationDate!,
        "endDate": _addEducationCheckboxState ? "teraz" : _endEducationDate!,
      };
    }
    _specialityController.clear();
    _institutionController.clear();
    _educationLevelController.clear();
    _startEducationDate = null;
    _endEducationDate = null;
    _addEducationCheckboxState = false;
    _addEducationButtonState = false;
    _editEducationIndex = null;
    _setAddEducationScreenState();
  }

  Function get onClickAddEducationButton => _onClickAddEducationButton;

  //Qualification screen

  bool _qualificationScreenState = false;
  bool get qualificationScreenState => _qualificationScreenState;
  void _setQualificationScreenState() {
    _qualificationScreenState = !_qualificationScreenState;
    notifyListeners();
  }

  Function get setQualificationScreenState => _setQualificationScreenState;

  final TextEditingController _qualificationController =
      TextEditingController();
  TextEditingController get qualificationController => _qualificationController;

  bool _createButtonState = false;
  bool get createButtonState => _createButtonState;
  void _setCreateButtonState() {
    _qualificationController.text.isEmpty
        ? _createButtonState = false
        : _createButtonState = true;
    notifyListeners();
  }

  Function get setCreateButtonState => _setCreateButtonState;

  void _onClickCreateButton() async {
    _setPreloaderScreenState();
    if (!Hive.isBoxOpen("userInfo")) {
      await Hive.openBox("userInfo");
    }
    List<Map<String, String>> tempoLang = [];
    for (Map<String, String?> item in _selectedLanguagesList) {
      if (item["language"] == "Англійська") {
        item["language"] = "Angielski";
      }
      if (item["language"] == "Польська") {
        item["language"] = "Polski";
      }
      if (item["language"] == "Iспанська") {
        item["language"] = "Hiszpański";
      }
      if (item["language"] == "Китайська") {
        item["language"] = "Сhiński";
      }
      if (item["language"] == "Французька") {
        item["language"] = "Francuski";
      }
      if (item["language"] == "Українська") {
        item["language"] = "Ukraiński";
      }
      if (item["language"] == "Німецька") {
        item["language"] = "Niemiecki";
      }
      if (item["language"] == "Чеська") {
        item["language"] = "Czeski";
      }
      if (item["language"] == "Корейська") {
        item["language"] = "koreański";
      }
      if (item["language"] == "Португальська") {
        item["language"] = "Portugalski";
      }
      tempoLang.add({"language": item["language"]!, "level": item["level"]!});
    }
    Map<String, String> tempoWork = {};
    for (Map<String, String?> el in _workExperienceList) {
      tempoWork.addAll({
        "position": el["position"]!,
        "company": el["company"]!,
        "startDate": el["startDate"]!,
        "endDate": el["endDate"]!
      });
    }
    Map<String, dynamic> data = {
      "id": Hive.box("userInfo").get("userInfo")["id"],
      "cvName": _cvNameController.text,
      "firstName": _nameController.text,
      "lastName": _surnameController.text,
      "birthday": _selectedBirthday,
      "email": _emailController.text,
      "phone": _phoneNumberController.text,
      "selectedState": _selectedState,
      "userSelectedLanguages": tempoLang,
      "userWorkExperiences": _workExperienceList,
      "userEducations": _educationList,
      "userQualification": _qualificationController.text,
      "image": _pickedImage == null
          ? null
          : base64Encode(
              File(_pickedImage!.path).readAsBytesSync(),
            )
    };
    List<int> result = [];
    try {
      result = await MigrostoreApi().createResume(data);
    } catch (e) {
      return;
    }
    if (result.isNotEmpty) {
      _pdfFile = result;
      _setPreloaderScreenState();
      _setSuccessfullyScreenState();
    }
  }

  Function get onClickCreateButton => _onClickCreateButton;

  List<int> _pdfFile = [];
  // Preloader screen

  bool _preloaderScreenState = false;
  bool get preloaderScreenState => _preloaderScreenState;

  void _setPreloaderScreenState() {
    _preloaderScreenState = !_preloaderScreenState;
    notifyListeners();
  }

  Function get setPreloaderScreenState => _setPreloaderScreenState;

  // Successfully screen

  bool _successfullyScreenState = false;
  bool get successfullyScreenState => _successfullyScreenState;

  void _setSuccessfullyScreenState() {
    _successfullyScreenState = !_successfullyScreenState;
    notifyListeners();
  }

  Function get setSuccessfullyScreenState => _setSuccessfullyScreenState;

  void _onClickSaveButton() async {
    Directory? downloadDirectory;
    if (Platform.isIOS) {
      downloadDirectory = await getApplicationDocumentsDirectory();
      File file = File(
          "${downloadDirectory.path}/migrostore_cv_${DateTime.now().microsecondsSinceEpoch}.pdf");
      file.writeAsBytesSync(_pdfFile);
    } else {
      downloadDirectory = await getExternalStorageDirectory();
      File file = File(
          "/storage/emulated/0/Download/migrostore_cv_${DateTime.now().microsecondsSinceEpoch}.pdf");
      file.writeAsBytesSync(_pdfFile);
    }
    _setSuccessfullyModalWindowState();
  }

  Function get onClickSaveButton => _onClickSaveButton;

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
