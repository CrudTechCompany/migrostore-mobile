import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:migrostore/service/migrostore_api.dart';

class SplashScreenController extends ChangeNotifier {
  // Get or set user data
  Future<void> _getUserData() async {
    if (await Hive.boxExists("userInfo")) {
      await Hive.openBox("userInfo");
      try {
        Map<String, String>? result = await MigrostoreApi()
            .refreshToken(Hive.box("userInfo").get("userInfo")["refreshToken"]);
        if (result != null) {
          Box box = Hive.box("userInfo");
          box.get("userInfo")["accessToken"] = result["accessToken"];
          box.get("userInfo")["refreshToken"] = result["refreshToken"];
          Hive.box("userInfo").put("userInfo", box.get("userInfo"));
        } else {
          Hive.box("userInfo").put("userInfo", {
            "isOnboarded": Hive.box("userInfo").get("userInfo")["isOnboarded"],
            "isAuthorized": false,
            "id": null,
            "firstName": "",
            "lastName": "",
            "email": "",
            "birthDate": "",
            "phoneNumber": "",
            "countryOfStay": "",
            "groundOfStay": "",
            "jobSearchCity": "",
            "polishLang": "",
            "engLang": "",
            "skills": "",
            "accessToken": "",
            "refreshToken": "",
          });
        }
      } catch (e) {
        return;
      }
      await Future.delayed(const Duration(seconds: 1));
    } else {
      Box userBox = await Hive.openBox<dynamic>("userInfo");
      await userBox.put("userInfo", {
        "isOnboarded": false,
        "isAuthorized": false,
        "id": null,
        "firstName": "",
        "lastName": "",
        "email": "",
        "birthDate": "",
        "phoneNumber": "",
        "countryOfStay": "",
        "groundOfStay": "",
        "jobSearchCity": "",
        "polishLang": "",
        "engLang": "",
        "skills": "",
        "accessToken": "",
        "refreshToken": "",
      });
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  Future<void> Function() get getUserData => _getUserData;
}
