// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:migrostore/service/migrostore_api.dart';
import 'package:migrostore/view/app_screen/app_screen_controller.dart';
import 'package:migrostore/view/auth_screen/auth_screen_controller.dart';
import 'package:provider/provider.dart';

class SignInScreenController extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  bool _signInButtonState = false;
  bool get signInButtonState => _signInButtonState;
  void _setNextButtonState() {
    _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty
        ? _signInButtonState = true
        : _signInButtonState = false;
    notifyListeners();
  }

  Function get setNextButtonState => _setNextButtonState;

  bool _invalidEmailState = false;
  bool get invalidEmailState => _invalidEmailState;
  String? _invalidEmailMessage;
  String? get invalidEmailMessage => _invalidEmailMessage;

  bool _invalidPasswordState = false;
  bool get invalidPasswordState => _invalidPasswordState;
  String? _invalidPasswordMessage;
  String? get invalidPasswordMessage => _invalidPasswordMessage;

  void _onClickSigninButton(BuildContext context) async {
    int? status;
    if (RegExp(r"(\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6})")
            .hasMatch(_emailController.text) &&
        _passwordController.text.length >= 6) {
      try {
        status = await MigrostoreApi().userSignIn(
            "username=${_emailController.text.trim()}&password=${_passwordController.text.trim()}");
      } catch (e) {
        return;
      }
      if (status == 200) {
        Map<String, dynamic>? userInfo = await MigrostoreApi().getUserInfo(
            Hive.box("userInfo").get("userInfo")["accessToken"],
            Hive.box("userInfo").get("userInfo")["refreshToken"]);
        if (Hive.isBoxOpen("userInfo")) {
          if (userInfo != null) {
            Box box = Hive.box("userInfo");
            box.get("userInfo")["id"] = userInfo["id"];
            box.get("userInfo")["firstName"] = userInfo["firstName"];
            box.get("userInfo")["lastName"] = userInfo["lastName"];
            box.get("userInfo")["birthDate"] = userInfo["birthDate"];
            box.get("userInfo")["phoneNumber"] = userInfo["phoneNumber"];
            box.get("userInfo")["countryOfStay"] = userInfo["countryOfStay"];
            box.get("userInfo")["groundOfStay"] = userInfo["groundOfStay"];
            box.get("userInfo")["jobSearchCity"] = userInfo["jobSearchCity"];
            box.get("userInfo")["polishLang"] = userInfo["polishLang"];
            box.get("userInfo")["engLang"] = userInfo["engLang"];
            box.get("userInfo")["skills"] = userInfo["skills"];
            box.get("userInfo")["email"] = _emailController.text.trim();
            Hive.box("userInfo").put("userInfo", box.get("userInfo"));
          }
        } else {
          if (userInfo != null) {
            await Hive.openBox("userInfo").then((value) {
              Box box = Hive.box("userInfo");
              box.get("userInfo")["id"] = userInfo["id"];
              box.get("userInfo")["firstName"] = userInfo["firstName"];
              box.get("userInfo")["lastName"] = userInfo["lastName"];
              box.get("userInfo")["birthDate"] = userInfo["birthDate"];
              box.get("userInfo")["phoneNumber"] = userInfo["phoneNumber"];
              box.get("userInfo")["countryOfStay"] = userInfo["countryOfStay"];
              box.get("userInfo")["groundOfStay"] = userInfo["groundOfStay"];
              box.get("userInfo")["jobSearchCity"] = userInfo["jobSearchCity"];
              box.get("userInfo")["polishLang"] = userInfo["polishLang"];
              box.get("userInfo")["engLang"] = userInfo["engLang"];
              box.get("userInfo")["skills"] = userInfo["skills"];
              box.get("userInfo")["email"] = _emailController.text.trim();
              Hive.box("userInfo").put("userInfo", box.get("userInfo"));
            });
          }
        }
        Provider.of<AuthScreenController>(context, listen: false)
            .setSignInScreenState();
        Provider.of<AppScreenController>(context, listen: false)
            .setAuthScreenState();
      } else if (status == 401) {
        _invalidEmailState = true;
        _invalidEmailMessage = "Перевірте правильність введення пошти";
        _invalidPasswordState = true;
        _invalidPasswordMessage = "Перевірте правильність введення пароля";
        notifyListeners();
      }
    } else {
      if (RegExp(r"(\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6})")
          .hasMatch(_emailController.text)) {
        _invalidEmailState = false;
        _invalidEmailMessage = null;
      } else {
        _invalidEmailMessage = "Неправильний формат пошти";
        _invalidEmailState = true;
      }
      if (_passwordController.text.length < 6) {
        _invalidPasswordState = true;
        _invalidPasswordMessage = "Мінімум 6 символів";
      } else {
        _invalidPasswordState = false;
        _invalidPasswordMessage = null;
      }
      notifyListeners();
    }
  }

  Function get onClickSignInButton => _onClickSigninButton;

  bool _obscureState = true;
  bool get obscureState => _obscureState;
  void _setObscureState() {
    _obscureState = !_obscureState;
    notifyListeners();
  }

  Function get setObscureState => _setObscureState;

  // Reset password screen

  bool _resetPasswordScreenState = false;
  bool get resetPasswordScreenState => _resetPasswordScreenState;
  void _setResetPasswordScreenState() {
    _resetPasswordScreenState = !_resetPasswordScreenState;
    notifyListeners();
  }

  Function get setResetPasswordScreenState => _setResetPasswordScreenState;
}
