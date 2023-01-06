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
    _index = value;
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
}
