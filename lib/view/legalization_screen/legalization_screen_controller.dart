import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:migrostore/service/migrostore_api.dart';
import 'package:migrostore/view/menu_screen/menu_screen_controller.dart';
import 'package:provider/provider.dart';

class LegalizationScreenController extends ChangeNotifier {
  // Select city

  final List<DropdownMenuItem> _cityList = [
    DropdownMenuItem(
      value: "Wroclaw",
      child: Text(
        "Wrocław",
        style: GoogleFonts.roboto(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
      ),
    ),
    DropdownMenuItem(
      value: "Warszawa",
      child: Text(
        "Warszawa",
        style: GoogleFonts.roboto(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
      ),
    ),
    DropdownMenuItem(
      value: "Kraków",
      child: Text(
        "Kraków",
        style: GoogleFonts.roboto(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
      ),
    ),
    DropdownMenuItem(
      value: "Gdańsk",
      child: Text(
        "Gdańsk",
        style: GoogleFonts.roboto(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
      ),
    ),
  ];
  List<DropdownMenuItem> get cityList => _cityList;

  // Drop down services list

  final List<DropdownMenuItem> _serviceList = [
    DropdownMenuItem(
      value: "Карта побиту",
      child: Text(
        "Карта побиту",
        style: GoogleFonts.roboto(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
      ),
    ),
    DropdownMenuItem(
      value: "Прискорена видача децизії",
      child: Text(
        "Прискорена видача децизії",
        style: GoogleFonts.roboto(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
      ),
    ),
    DropdownMenuItem(
      value: "Резервація на подачу",
      child: Text(
        "Резервація на подачу",
        style: GoogleFonts.roboto(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
      ),
    ),
    DropdownMenuItem(
      value: "Присяжний переклад",
      child: Text(
        "Присяжний переклад",
        style: GoogleFonts.roboto(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: const Color.fromARGB(255, 24, 24, 24),
        ),
      ),
    ),
  ];
  List<DropdownMenuItem> get serviceList => _serviceList;

  String? _selectedCity;
  String? get selectedCity => _selectedCity;
  void _setSelectedCity(String value) {
    _selectedCity = value;
    _setNextButtonState();
    notifyListeners();
  }

  Function get setSelectedCity => _setSelectedCity;

  String? _selectedService;
  String? get selectedService => _selectedService;
  void _setSelectedService(String value) {
    _selectedService = value;
    _setNextButtonState();
    notifyListeners();
  }

  Function get setSelectedService => _setSelectedService;

  // Next button state

  bool _nextButtonState = false;
  bool get nextButtonState => _nextButtonState;
  void _setNextButtonState() {
    if (_selectedCity != null && _selectedService != null) {
      _nextButtonState = true;
    } else {
      _nextButtonState = false;
    }
  }

  // Legalization data screen state

  bool _legalizationDataScreenState = false;
  bool get legalizationDataScreenState => _legalizationDataScreenState;
  void _setLegalizationDataScreenState() {
    _legalizationDataScreenState = !_legalizationDataScreenState;
    notifyListeners();
  }

  Function get setLegalizationDataScreenState =>
      _setLegalizationDataScreenState;

  // Name input field

  String? _inputedName;
  String? get inputedName => _inputedName;

  void _onChangeInputedName(String value) {
    value.isEmpty ? _inputedName = null : _inputedName = value;
    _setSendButtonState();
    notifyListeners();
  }

  Function get onChangeInputedName => _onChangeInputedName;

  // Phone number input field

  final TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController get phoneNumberController => _phoneNumberController;

  final MaskTextInputFormatter _phoneNumberFormatter = MaskTextInputFormatter(
    mask: "+48 ###-###-###",
    filter: {
      "#": RegExp(
        "[0-9]",
      ),
    },
  );
  MaskTextInputFormatter get phoneNumberFormatter => _phoneNumberFormatter;

  bool _errorPhoneNumberState = false;
  bool get errorPhoneNumberState => _errorPhoneNumberState;
  String? _errorPhoneNumberText;
  String? get errorPhoneNumberText => _errorPhoneNumberText;

  // Email input field

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  String? _inputedEmail;
  String? get inputedEmail => _inputedEmail;
  void _onChangeInputedEmail(String value) {
    value.isEmpty ? _inputedEmail = null : _inputedEmail = value;
    notifyListeners();
  }

  Function get onChangeInputedEmail => _onChangeInputedEmail;

  bool _emailErrorState = false;
  bool get emailErrorState => _emailErrorState;
  final String _emailErrorText = "Неправильний формат пошти";
  String get emailErrorText => _emailErrorText;

  // Selected time

  final List<Map<String, dynamic>> _selectTimeList = [
    {"isSelected": false, "title": "10:00 - 13:00"},
    {"isSelected": false, "title": "13:00 - 16:00"},
    {"isSelected": false, "title": "16:00 - 19:00"}
  ];
  List<Map<String, dynamic>> get selectTimeList => _selectTimeList;

  String _selectedTime = "";

  void _onClickSelectTimeItem(int index) {
    _selectTimeList[index]
        .update("isSelected", (value) => !_selectTimeList[index]["isSelected"]);
    _selectedTime = "";
    for (Map<String, dynamic> element in _selectTimeList) {
      if (element["isSelected"]) {
        if (_selectedTime.isEmpty) {
          _selectedTime += element["title"];
        } else {
          _selectedTime += ', ${element["title"]}';
        }
      }
    }
    notifyListeners();
  }

  Function get onClickSelectTimeItem => _onClickSelectTimeItem;

  // Message input field

  String? _inputedMessage;
  String? get inputedMessage => _inputedMessage;
  void _onChangeInputedMessage(String value) {
    _inputedMessage = value;
    notifyListeners();
  }

  Function get onChangeInputedMessage => _onChangeInputedMessage;

  // Send button state

  bool _sendButtonState = false;
  bool get sendButtonState => _sendButtonState;

  void _setSendButtonState() {
    if (_inputedName == null || _phoneNumberController.text.isEmpty) {
      _sendButtonState = false;
    } else {
      _sendButtonState = true;
    }
    notifyListeners();
  }

  Function get setSendButtonState => _setSendButtonState;

  void _onClickSendButton(BuildContext context) async {
    if (_inputedEmail == null && _phoneNumberController.text.length == 15) {
      _emailErrorState = false;
      _errorPhoneNumberState = false;
      _errorPhoneNumberText = null;
      Map<String, String?> body = {
        'city': _selectedCity,
        'service': _selectedService,
        'name': _inputedName,
        'phone_number': _phoneNumberController.text,
        'email': _inputedEmail,
        'time': _selectedTime.isEmpty ? null : _selectedTime,
        'message': _inputedMessage
      };
      try {
        await MigrostoreApi().sendLegalizationForm(body) == 201
            ? _setLegalizationRequestModalWindowState()
            : null;
      } catch (e) {
        return;
      }
    } else {
      if (_inputedEmail == null) {
        _emailErrorState = false;
        _errorPhoneNumberState = true;
        _errorPhoneNumberText = "Неправильний формат номера";
      } else {
        if (_phoneNumberController.text.length != 15) {
          _errorPhoneNumberState = true;
          _errorPhoneNumberText = "Неправильний формат номера";
        } else {
          _errorPhoneNumberState = false;
          _errorPhoneNumberText = null;
        }
        if (RegExp(r"(\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6})")
            .hasMatch(_inputedEmail!)) {
          _emailErrorState = false;
        } else {
          _emailErrorState = true;
        }
        if (_phoneNumberController.text.length == 15 &&
            RegExp(r"(\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6})")
                .hasMatch(_inputedEmail!)) {
          _emailErrorState = false;
          _errorPhoneNumberState = false;
          _errorPhoneNumberText = null;
          Map<String, String?> body = {
            'city': _selectedCity,
            'service': _selectedService,
            'name': _inputedName,
            'phone_number': _phoneNumberController.text,
            'email': _inputedEmail,
            'time': _selectedTime.isEmpty ? null : _selectedTime,
            'message': _inputedMessage
          };
          try {
            await MigrostoreApi().sendLegalizationForm(body) == 201
                ? _setLegalizationRequestModalWindowState()
                : null;
          } catch (e) {
            return;
          }
        }
      }
    }
    notifyListeners();
  }

  Function get onClickSendButton => _onClickSendButton;

  // Legalization request modal window

  bool _legalizationRequestModalWindowState = false;
  bool get legalizationRequestModalWindowState =>
      _legalizationRequestModalWindowState;
  void _setLegalizationRequestModalWindowState() {
    _legalizationRequestModalWindowState =
        !_legalizationRequestModalWindowState;
    notifyListeners();
  }

  Function get setLegalizationRequestModalWindowState =>
      _setLegalizationRequestModalWindowState;

  // Continue button

  void _onClickContinueButton(BuildContext context) {
    _setLegalizationRequestModalWindowState();
    _setLegalizationDataScreenState();
    Provider.of<MenuScreenController>(context, listen: false)
        .setLegalizationScreenState();
  }

  Function get onClickContinueButton => _onClickContinueButton;
}
