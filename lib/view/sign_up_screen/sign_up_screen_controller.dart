import 'package:flutter/material.dart';
import 'package:migrostore/service/migrostore_api.dart';

class SignUpScreenController extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  bool _sendCodeButtonState = false;
  bool get sendCodeButtonState => _sendCodeButtonState;
  void _setSendCodeButtonState() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty) {
      _sendCodeButtonState = true;
    } else {
      _sendCodeButtonState = false;
    }
    notifyListeners();
  }

  Function get setSendCodeButtonState => _setSendCodeButtonState;

  bool _invalidEmailState = false;
  bool get invalidEmailState => _invalidEmailState;
  String? _invalidEmailMessage;
  String? get invalidEmailMessage => _invalidEmailMessage;

  bool _invalidPasswordState = false;
  bool get invalidPasswordState => _invalidPasswordState;
  String? _invalidPasswordMessage;
  String? get invalidPasswordMessage => _invalidPasswordMessage;

  bool _invalidConfirmPasswordState = false;
  bool get invalidConfirmPasswordState => _invalidConfirmPasswordState;
  String? _invalidConfirmPasswordMessage;
  String? get invalidConfirmPasswordMessage => _invalidConfirmPasswordMessage;

  int? _userId;
  int? get userId => _userId;

  void _onClickSendCodeButton() async {
    if (RegExp(r"(\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6})")
            .hasMatch(_emailController.text) &&
        _passwordController.text.length >= 6 &&
        _confirmPasswordController.text == _passwordController.text) {
      _invalidEmailState = false;
      _invalidEmailMessage = null;
      _invalidPasswordState = false;
      _invalidPasswordMessage = null;
      _invalidConfirmPasswordState = false;
      _invalidConfirmPasswordMessage = null;
      notifyListeners();
      try {
        _userId = await MigrostoreApi().sendVerificationCode({
          "email": _emailController.text,
          "password": _passwordController.text,
        });
      } catch (e) {
        return;
      }
      if (_userId == -1) {
        _invalidEmailState = true;
        _invalidEmailMessage = "Ця пошта вже зайнята";
        notifyListeners();
      } else {
        _setCodeScreenState();
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
      if (_passwordController.text.length >= 6) {
        _invalidPasswordState = false;
        _invalidPasswordMessage = null;
      } else {
        _invalidPasswordState = true;
        _invalidPasswordMessage = "Мінімум 6 символів";
      }
      if (_passwordController.text == _confirmPasswordController.text) {
        _invalidConfirmPasswordState = false;
        _invalidConfirmPasswordMessage = null;
      } else {
        _invalidConfirmPasswordState = true;
        _invalidConfirmPasswordMessage = "Паролі не співпадають";
      }
      notifyListeners();
    }
  }

  Function get onClickSendCodeButton => _onClickSendCodeButton;

  // Code screen

  bool _codeScreenState = false;
  bool get codeScreenState => _codeScreenState;
  void _setCodeScreenState() {
    _codeScreenState = !_codeScreenState;
    notifyListeners();
  }

  Function get setCodeScreenState => _setCodeScreenState;

  bool _obscurePasswordState = true;
  bool get obscurePasswordState => _obscurePasswordState;
  void _setObscurePasswordState() {
    _obscurePasswordState = !_obscurePasswordState;
    notifyListeners();
  }

  Function get setObscurePasswordState => _setObscurePasswordState;

  bool _obscureConfirmPasswordState = true;
  bool get obscureConfirmPasswordState => _obscureConfirmPasswordState;
  void _setObscureConfirmPasswordState() {
    _obscureConfirmPasswordState = !_obscureConfirmPasswordState;
    notifyListeners();
  }

  Function get setObscureConfirmPasswordState =>
      _setObscureConfirmPasswordState;
}
