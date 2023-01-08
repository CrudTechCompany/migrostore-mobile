import 'package:flutter/material.dart';
import 'package:migrostore/view/auth_screen/auth_screen_controller.dart';
import 'package:migrostore/view/main_screen/main_screen_controller.dart';
import 'package:provider/provider.dart';

class SignInScreenController extends ChangeNotifier {
  // Email field

  String? _inputedEmail;
  String? get inputedEmail => _inputedEmail;
  void _onChangedInputedEmail(String value) {
    value.isEmpty ? _inputedEmail = null : _inputedEmail = value;
    _setSignInButtonState();
    notifyListeners();
  }

  Function get onChangedInputedEmail => _onChangedInputedEmail;

  bool _emailErrorState = false;
  bool get emailErrorState => _emailErrorState;
  final String _emailErrorText = "Неправильний формат пошти";
  String get emailErrorText => _emailErrorText;

  // Password field
  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;
  String? _inputedPassword;
  String? get inputedPassword => _inputedPassword;
  void _onChangedInputedPassword(String value) {
    value.isEmpty ? _inputedPassword = null : _inputedPassword = value;
    _setSignInButtonState();
    notifyListeners();
  }

  Function get onChangedInputedPassword => _onChangedInputedPassword;

  bool _passwordErrorState = false;
  bool get passwordErrorState => _passwordErrorState;
  final String _passwordErrorText = "Вказано неправильний пароль";
  String get passwordErrorText => _passwordErrorText;

  // SignIn button

  bool _signInButtonState = false;
  bool get signInButtonState => _signInButtonState;
  void _setSignInButtonState() {
    if (_inputedEmail != null && _inputedPassword != null) {
      _signInButtonState = true;
    } else {
      _signInButtonState = false;
    }
  }

  void _onClickSignInButton(BuildContext context) {
    if (RegExp(r"(\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6})").hasMatch(_inputedEmail!) &&
        _inputedPassword!.length == 6) {
      _emailErrorState = false;
      _passwordErrorState = false;
      context.read<AuthScreenController>().setSignInScreenState();
      context.read<MainScreenController>().setIsUserAuthorized();
    } else {
      RegExp(r"(\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6})").hasMatch(_inputedEmail!)
          ? _emailErrorState = false
          : _emailErrorState = true;
      _inputedPassword!.length == 6
          ? _passwordErrorState = false
          : _passwordErrorState = true;
    }
    notifyListeners();
  }

  Function get onClickSignInButton => _onClickSignInButton;
}
