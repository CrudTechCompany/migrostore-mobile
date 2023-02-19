import 'package:flutter/material.dart';
import 'package:migrostore/service/migrostore_api.dart';

class ResetPasswordScreenController extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  bool _sendCodeButtonState = false;
  bool get sendCodeButtonState => _sendCodeButtonState;
  void _setSendCodeButtonState() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
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

  int? _userId;
  int? get userId => _userId;

  void _onClickSendCodeButton() async {
    if (RegExp(r"(\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6})")
            .hasMatch(_emailController.text.trim()) &&
        _passwordController.text.length >= 6) {
      _invalidEmailState = false;
      _invalidEmailMessage = null;
      _invalidPasswordState = false;
      _invalidPasswordMessage = null;
      Map<String, String> data = {
        "email": _emailController.text.trim(),
        "newPassword": _passwordController.text.trim(),
      };
      int result = await MigrostoreApi().sendResetPassword(data);
      if (result == -1) {
        _invalidEmailState = true;
        _invalidEmailMessage = "Перевірте правильність пошти";
        notifyListeners();
      } else {
        _userId = result;
        _setResetCodeScreenState();
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
      if (_passwordController.text.length == 6) {
        _invalidPasswordState = false;
        _invalidPasswordMessage = null;
      } else {
        _invalidPasswordState = true;
        _invalidPasswordMessage = "Мінімум 6 символів";
      }
      notifyListeners();
    }
  }

  Function get onClickSendCodeButton => _onClickSendCodeButton;

  bool _obscurePasswordState = true;
  bool get obscurePasswordState => _obscurePasswordState;
  void _setObscurePasswordState() {
    _obscurePasswordState = !_obscurePasswordState;
    notifyListeners();
  }

  Function get setObscurePasswordState => _setObscurePasswordState;

  // Reset code screen
  bool _resetCodeScreenState = false;
  bool get resetCodeScreenState => _resetCodeScreenState;
  void _setResetCodeScreenState() {
    _resetCodeScreenState = !_resetCodeScreenState;
    notifyListeners();
  }

  Function get setResetCodeScreenState => _setResetCodeScreenState;
}
