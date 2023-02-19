import 'package:flutter/material.dart';
import 'package:migrostore/service/migrostore_api.dart';
import 'package:migrostore/view/reset_password_screen/reset_password_screen_controller.dart';
import 'package:provider/provider.dart';

class ResetCodeScreenController extends ChangeNotifier {
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
      "id": Provider.of<ResetPasswordScreenController>(context, listen: false)
          .userId!,
      "code": _userCode!
    };
    int? status;
    try {
      status = await MigrostoreApi().confirmNewPassword(data);
    } catch (e) {
      return;
    }
    if (status == 200) {
      _setSuccessfullyModalWindowState();
    } else if (status == 400) {
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
  bool get successfullyModalWindowState => _successfullyModalWindowState;
  void _setSuccessfullyModalWindowState() {
    _successfullyModalWindowState = !_successfullyModalWindowState;
    notifyListeners();
  }

  Function get setSuccessfullyModalWindowState =>
      _setSuccessfullyModalWindowState;
}
