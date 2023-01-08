import 'dart:async';

import 'package:flutter/material.dart';

class SignUpScreenController extends ChangeNotifier {
  // Email input field

  bool _emailErrorState = false;
  bool get emailErrorState => _emailErrorState;
  final String _emailErrorText = "Неправильний формат пошти";
  String get emailErrorText => _emailErrorText;

  String? _inputedEmail;
  String? get inputedEmail => _inputedEmail;
  void _onChangedInputedEmail(String value) {
    value.isEmpty ? _inputedEmail = null : _inputedEmail = value;
    _setSendCodeButtonState();
    notifyListeners();
  }

  Function get onChangedInputedEmail => _onChangedInputedEmail;

  // Password input field

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;
  bool _passwordErrorState = false;
  bool get passwordErrorState => _passwordErrorState;
  final String _passwordErrorText = "Мінімум 6 символів";
  String get passwordErrorText => _passwordErrorText;

  String? _inputedPassword;
  String? get inputedPassword => _inputedPassword;
  void _onChangedInputedPassword(String value) {
    value.isEmpty ? _inputedPassword = null : _inputedPassword = value;
    _setSendCodeButtonState();
    notifyListeners();
  }

  Function get onChangedInputedPassword => _onChangedInputedPassword;

  // Confirm password input field

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  bool _confirmPasswordErrorState = false;
  bool get confirmPasswordErrorState => _confirmPasswordErrorState;
  final String _confirmPasswordErrorText = "Паролі не співпадають";
  String get confirmPasswordErrorText => _confirmPasswordErrorText;

  String? _inputedConfirmPassword;
  String? get inputedConfirmPassword => _inputedConfirmPassword;
  void _onChangedInputedConfirmPassword(String value) {
    value.isEmpty
        ? _inputedConfirmPassword = null
        : _inputedConfirmPassword = value;
    _setSendCodeButtonState();
    notifyListeners();
  }

  Function get onChangedInputedConfirmPassword =>
      _onChangedInputedConfirmPassword;

  // Send code button

  bool _sendCodeButtonState = false;
  bool get sendCodeButtonState => _sendCodeButtonState;
  void _setSendCodeButtonState() {
    if (_inputedEmail != null &&
        _inputedPassword != null &&
        _inputedConfirmPassword != null) {
      _sendCodeButtonState = true;
    } else {
      _sendCodeButtonState = false;
    }
  }

  void _onClickSednCodeButton() {
    if (RegExp(r"(\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6})").hasMatch(_inputedEmail!) &&
        _inputedPassword!.length == 6 &&
        _inputedPassword == _inputedConfirmPassword) {
      _emailErrorState = false;
      _passwordErrorState = false;
      _confirmPasswordErrorState = false;
      _setCheckCodeScreenState();
    } else {
      RegExp(r"(\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6})").hasMatch(_inputedEmail!)
          ? _emailErrorState = false
          : _emailErrorState = true;
      _inputedPassword!.length == 6
          ? _passwordErrorState = false
          : _passwordErrorState = true;
      _inputedPassword == _inputedConfirmPassword
          ? _confirmPasswordErrorState = false
          : _confirmPasswordErrorState = true;
    }
    notifyListeners();
  }

  Function get onClickSendCodeButton => _onClickSednCodeButton;

  // Check code screen

  bool _checkCodeScreenState = false;
  bool get checkCodeScreenState => _checkCodeScreenState;
  void _setCheckCodeScreenState() {
    _checkCodeScreenState = !_checkCodeScreenState;
    notifyListeners();
  }

  Function get setCheckCodeScreenState => _setCheckCodeScreenState;

  // Timer periodic

  int _initialTime = 30;
  int get initialTime => _initialTime;
  void _setInitialTime() {
    _initialTime = 30;
    notifyListeners();
  }

  Function get setInitialTime => _setInitialTime;

  Timer? _timer;
  Timer? get timer => _timer;
  void _stopTimer() {
    _timer != null ? _timer!.cancel() : null;
  }

  Function get stopTimer => _stopTimer;

  void _setTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_initialTime > 0) {
          _initialTime--;
          notifyListeners();
        } else {
          _timer!.cancel();
          _timer = null;
        }
      },
    );
  }

  Function get setTimer => _setTimer;
}
