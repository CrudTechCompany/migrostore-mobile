import 'package:flutter/material.dart';
import 'package:migrostore/view/setting_screen/settings_screen.dart';
import 'package:migrostore/view/setting_screen/settings_screen_controller.dart';
import 'package:provider/provider.dart';
import '../menu_screen/menu_screen.dart';
import '../menu_screen/menu_screen_controller.dart';
import '../profile_screen/profile_screen.dart';
import '../profile_screen/profile_screen_controller.dart';

class MainScreenController extends ChangeNotifier {
  // Navigation bar index

  int _index = 0;
  int get index => _index;
  void _setIndex(int value) {
    if (value == 1) {
      _setIsUserAuthorized();
      _index = 0;
    } else {
      _index = value;
    }

    notifyListeners();
  }

  Function get setIndex => _setIndex;

  // Navigation bar screens

  final List<Widget> _screens = [
    ChangeNotifierProvider(
      create: (_) => MenuScreenController(),
      child: const MenuScreen(),
    ),
    ChangeNotifierProvider(
      create: (_) => ProfileScreenController(),
      child: const ProfileScreen(),
    ),
    ChangeNotifierProvider(
      create: (_) => SettingsScreenController(),
      child: const SettingsScreen(),
    ),
  ];
  List<Widget> get screens => _screens;

  // Legalization screen

  bool _legalizationScreenState = false;
  bool get legalizationScreenState => _legalizationScreenState;

  void _setLegalizationScreenState() {
    _legalizationScreenState = !_legalizationScreenState;
    notifyListeners();
  }

  Function get setLegalizationScreenState => _setLegalizationScreenState;

  // Help screen

  bool _helpScreenState = false;
  bool get helpScreenState => _helpScreenState;
  void _setHelpScreenState() {
    _helpScreenState = !_helpScreenState;
    notifyListeners();
  }

  Function get setHelpScreenState => _setHelpScreenState;

  // Auth screen state

  // bool _authScreenState = false;
  // bool get authScreenState => _authScreenState;
  // void _setAuthScreenState() {
  //   _authScreenState = !_authScreenState;
  // }

  // Function get setAuthScreenState => _setAuthScreenState;

  // Find work screen state

  bool _workScreenState = false;
  bool get workScreenState => _workScreenState;
  void _setWorkScreenState() {
    _workScreenState = !_workScreenState;
    notifyListeners();
  }

  Function get setWorkScreenState => _setWorkScreenState;

  // Is the user authorized check

  bool _isUserAuthorized = true;
  bool get isUserAuthorazed => _isUserAuthorized;
  void _setIsUserAuthorized() {
    _isUserAuthorized = !_isUserAuthorized;
    notifyListeners();
  }

  Function get setIsUserAuthorized => _setIsUserAuthorized;

  // Resume screen

  bool _resumeScreenState = false;
  bool get resumeScreenState => _resumeScreenState;
  void _setResumeScreenState() {
    _resumeScreenState = !_resumeScreenState;
    notifyListeners();
  }

  Function get setResumeScreenState => _setResumeScreenState;
}
