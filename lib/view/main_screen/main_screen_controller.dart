import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:migrostore/view/app_screen/app_screen_controller.dart';
import 'package:migrostore/view/menu_screen/menu_screen.dart';
import 'package:migrostore/view/menu_screen/menu_screen_controller.dart';
import 'package:migrostore/view/profile_screen/profile_screen.dart';
import 'package:migrostore/view/profile_screen/profile_screen_controller.dart';
import 'package:migrostore/view/settings_screen/settings_screen_controller.dart';
import 'package:provider/provider.dart';
import '../settings_screen/settings_screen.dart';

class MainScreenController extends ChangeNotifier {
  // Navigation bar index

  int _index = 0;
  int get index => _index;
  void _setIndex(BuildContext context, int value) async {
    if (value == 1) {
      if (Hive.isBoxOpen("userName")) {
        if (Hive.box("userInfo").get("userInfo")["isAuthorized"]) {
          _index = value;
        } else {
          Provider.of<AppScreenController>(context, listen: false)
              .setAuthScreenState();
          _index = 0;
        }
      } else {
        await Hive.openBox("userInfo").then((box) {
          if (box.get("userInfo")["isAuthorized"]) {
            _index = value;
          } else {
            Provider.of<AppScreenController>(context, listen: false)
                .setAuthScreenState();
            _index = 0;
          }
        });
      }
    } else {
      _index = value;
    }
    notifyListeners();
  }

  Function get setIndex => _setIndex;

  // Navigation bar state
  bool _navigationBarState = true;
  bool get navigationBarState => _navigationBarState;
  void _setNavigationBarState() {
    _navigationBarState = !_navigationBarState;
    notifyListeners();
  }

  Function get setNavigationBarState => _setNavigationBarState;

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
}
