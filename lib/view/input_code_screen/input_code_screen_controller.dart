// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:migrostore/service/migrostore_api.dart';
import 'package:migrostore/view/sign_up_screen/sign_up_screen_controller.dart';
import 'package:provider/provider.dart';

class InputCodeScreenController extends ChangeNotifier {
  bool _signUpButtonState = false;
  bool get signUpButtonState => _signUpButtonState;

  String? _userCode;
  void _setSignUpButtonState(String value) {
    _userCode = value;
    if (value.length == 4) {
      _signUpButtonState = true;
    } else {
      _signUpButtonState = false;
    }
    notifyListeners();
  }

  Function get setSignUpButtonState => _setSignUpButtonState;

  void _onClickSignUpButton(BuildContext context) async {
    Map<String, dynamic> data = {
      "id": Provider.of<SignUpScreenController>(context, listen: false).userId
          as int,
      "code": _userCode!
    };
    int? status;
    try {
      status = await MigrostoreApi().confirmVerifacationCode(data);
    } catch (e) {
      return;
    }
    if (status == 200) {
      try {
        int signInStatus = await MigrostoreApi().userSignIn(
            "username=${Provider.of<SignUpScreenController>(context, listen: false).emailController.text.trim()}&password=${Provider.of<SignUpScreenController>(context, listen: false).passwordController.text.trim()}");
        if (signInStatus == 200) {
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
              box.get("userInfo")["email"] =
                  Provider.of<SignUpScreenController>(context, listen: false)
                      .emailController
                      .text
                      .trim();
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
                box.get("userInfo")["countryOfStay"] =
                    userInfo["countryOfStay"];
                box.get("userInfo")["groundOfStay"] = userInfo["groundOfStay"];
                box.get("userInfo")["jobSearchCity"] =
                    userInfo["jobSearchCity"];
                box.get("userInfo")["polishLang"] = userInfo["polishLang"];
                box.get("userInfo")["engLang"] = userInfo["engLang"];
                box.get("userInfo")["skills"] = userInfo["skills"];
                box.get("userInfo")["email"] =
                    Provider.of<SignUpScreenController>(context, listen: false)
                        .emailController
                        .text
                        .trim();
                Hive.box("userInfo").put("userInfo", box.get("userInfo"));
              });
            }
          }
          _setSuccessfullyModalWindowState();
        }
      } catch (e) {
        return;
      }
    } else {
      _setInvalidCodeState();
    }
  }

  Function get onClickSignUpButton => _onClickSignUpButton;

  // Error code
  bool _invalidCodeState = false;
  bool get invalidCodeState => _invalidCodeState;
  void _setInvalidCodeState() {
    _invalidCodeState = !_invalidCodeState;
    notifyListeners();
  }

  // Successfully modal window

  bool _successfullyModalWindowState = false;
  bool get sucessfullyModalWindowState => _successfullyModalWindowState;
  void _setSuccessfullyModalWindowState() {
    _successfullyModalWindowState = !_successfullyModalWindowState;
    notifyListeners();
  }

  Function get setSuccessfullyModalWindowState =>
      _setSuccessfullyModalWindowState;
}
