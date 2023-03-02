import 'dart:convert';
import 'dart:io' as io;

import 'package:hive_flutter/hive_flutter.dart';

class MigrostoreApi {
  final io.HttpClient _apiClient = io.HttpClient();
  final String _host =
      "migrostore-mob-app-api-prod.eba-gc3tpb59.eu-central-1.elasticbeanstalk.com";

  // Sign up user

  Future<int> _sendVerificationCode(Map<String, String> data) async {
    io.HttpClientRequest request = await _apiClient.postUrl(
      Uri(
        scheme: "http",
        host: _host,
        path: "/api/v1/signup",
      ),
    );
    request.headers.add("Content-type", "application/json");
    request.write(jsonEncode(data));
    io.HttpClientResponse response = await request.close();
    String body = await response.transform(utf8.decoder).join();
    if (jsonDecode(body)["message"] == null) {
      return jsonDecode(body)["id"] as int;
    } else {
      return -1;
    }
  }

  Future<int> Function(Map<String, String> data) get sendVerificationCode =>
      _sendVerificationCode;

  // Confirm verification code

  Future<int> _confirmVerificationCode(Map<String, dynamic> data) async {
    io.HttpClientRequest request = await _apiClient.postUrl(
      Uri(
        scheme: "http",
        host: _host,
        path: "/api/v1/signup/code/confirm",
      ),
    );
    request.headers.add("Content-Type", "application/json");
    request.write(jsonEncode(data));
    io.HttpClientResponse response = await request.close();
    return response.statusCode;
  }

  Future<int> Function(Map<String, dynamic> data) get confirmVerifacationCode =>
      _confirmVerificationCode;

  // Sign in

  Future<int> _userSignIn(String data) async {
    io.HttpClientRequest request = await _apiClient.postUrl(
      Uri(scheme: "http", host: _host, path: "/api/v1/signin"),
    );
    request.headers.add("Content-Type", "application/x-www-form-urlencoded");
    request.write(data);
    io.HttpClientResponse response = await request.close();
    String responseData = await response.transform(utf8.decoder).join();
    if (response.statusCode == 200) {
      if (Hive.isBoxOpen("userInfo")) {
        Box box = Hive.box("userInfo");
        box.get("userInfo")["isAuthorized"] = true;
        box.get("userInfo")["accessToken"] =
            jsonDecode(responseData)["accessToken"];
        box.get("userInfo")["refreshToken"] =
            jsonDecode(responseData)["refreshToken"];
        Hive.box("userInfo").put("userInfo", box.get("userInfo"));
      } else {
        await Hive.openBox("userInfo").then((value) {
          Box box = Hive.box("userInfo");
          box.get("userInfo")["isAuthorized"] = true;
          box.get("userInfo")["accessToken"] =
              jsonDecode(responseData)["accessToken"];
          box.get("userInfo")["refreshToken"] =
              jsonDecode(responseData)["refreshToken"];
          Hive.box("userInfo").put("userInfo", box.get("userInfo"));
        });
      }
    }
    return response.statusCode;
  }

  Future<int> Function(String data) get userSignIn => _userSignIn;

  // Send legalization form

  Future<int> _sendLegalizationForm(Map<String, String?> data) async {
    io.HttpClientRequest request = await _apiClient.postUrl(Uri(
        scheme: "https",
        host: "app.migrostore.pl",
        path: "/api/v1/legalization/create"));
    request.headers.add("Content-Type", "application/json; charset=utf-8");
    request.write(jsonEncode(data));
    io.HttpClientResponse response = await request.close();
    return response.statusCode;
  }

  Future<int> Function(Map<String, String?> data) get sendLegalizationForm =>
      _sendLegalizationForm;

  // Send work form

  Future<int> _sendWorkForm(Map<String, String> data) async {
    io.HttpClientRequest request = await _apiClient.postUrl(
      Uri(
          scheme: "https",
          host: "app.migrostore.pl",
          path: "/api/v1/works/create"),
    );
    request.headers.add("Content-Type", "application/json; charset=utf-8");
    request.write(jsonEncode(data));
    io.HttpClientResponse response = await request.close();
    return response.statusCode;
  }

  Future<int> Function(Map<String, String> data) get sendWorkForm =>
      _sendWorkForm;

  // User profile

  Future<Map<String, dynamic>?> _getUserInfo(
      String userToken, String refreshToken) async {
    io.HttpClientRequest request = await _apiClient
        .getUrl(Uri(scheme: "http", host: _host, path: "/api/v1/profile"));
    request.headers.add("Content-Type", "application/json");
    request.headers.add("Authorization", "Bearer $userToken");
    io.HttpClientResponse response = await request.close();
    if (response.statusCode == 401) {
      Map<String, String>? data = await _refreshToken(refreshToken);
      if (data != null) {
        if (Hive.isBoxOpen("userInfo")) {
          Box box = Hive.box("userInfo");
          box.get("userInfo")["accessToken"] = data["accessToken"];
          box.get("userInfo")["refreshToken"] = data["refreshToken"];
          Hive.box("userInfo").put("userInfo", box.get("userInfo"));
        } else {
          await Hive.openBox("userInfo").then((value) {
            Box box = value;
            box.get("userInfo")["accessToken"] = data["accessToken"];
            box.get("userInfo")["refreshToken"] = data["refreshToken"];
            Hive.box("userInfo").put("userInfo", box.get("userInfo"));
          });
        }
        _getUserInfo(data["accessToken"]!, data["refreshToken"]!);
      } else {
        return null;
      }
    } else {
      String data = await response.transform(utf8.decoder).join();
      return {
        "id": jsonDecode(data)["id"],
        "firstName": jsonDecode(data)["firstName"],
        "lastName": jsonDecode(data)["lastName"],
        "birthDate": jsonDecode(data)["birthDate"],
        "phoneNumber": jsonDecode(data)["phoneNumber"],
        "countryOfStay": jsonDecode(data)["countryOfStay"],
        "groundOfStay": jsonDecode(data)["groundOfStay"],
        "jobSearchCity": jsonDecode(data)["jobSearchCity"],
        "polishLang": jsonDecode(data)["polishLang"],
        "engLang": jsonDecode(data)["engLang"],
        "skills": jsonDecode(data)["skills"]
      };
    }
    return null;
  }

  Future<Map<String, dynamic>?> Function(String userToken, String refreshToken)
      get getUserInfo => _getUserInfo;

  // Refresh token

  Future<Map<String, String>?> _refreshToken(String refreshToken) async {
    io.HttpClientRequest request = await _apiClient.postUrl(
      Uri(
        scheme: "http",
        host: _host,
        path: "/api/v1/signin/refresh",
      ),
    );
    request.headers.add("Content-Type", "application/json; charset=utf-8");
    request.write(jsonEncode({"refreshToken": refreshToken}));
    io.HttpClientResponse response = await request.close();
    String data = await response.transform(utf8.decoder).join();
    if (response.statusCode == 200) {
      return {
        "accessToken": jsonDecode(data)["accessToken"],
        "refreshToken": jsonDecode(data)["refreshToken"]
      };
    } else {
      return null;
    }
  }

  Future<Map<String, String>?> Function(String refreshToken) get refreshToken =>
      _refreshToken;

  // Update profile

  Future<int> _updateProfile(Map<String, String?> data) async {
    io.HttpClientRequest request = await _apiClient.putUrl(
      Uri(
        scheme: "http",
        host: _host,
        path: "/api/v1/profile/update",
      ),
    );
    request.headers.add("Content-Type", "application/json; charset=utf-8");
    request.headers.add("Authorization",
        "Bearer ${Hive.box("userInfo").get("userInfo")["accessToken"]}");
    request.write(jsonEncode(data));
    io.HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      Map<String, String>? refreshResult = await _refreshToken(
          Hive.box("userInfo").get("userInfo")["refreshToken"]);
      if (refreshResult != null) {
        if (Hive.isBoxOpen("userInfo")) {
          Box box = Hive.box("userInfo");
          box.get("userInfo")["accessToken"] = refreshResult["accessToken"];
          box.get("userInfo")["refreshToken"] = refreshResult["refreshToken"];
          Hive.box("userInfo").put("userInfo", box.get("userInfo"));
        } else {
          await Hive.openBox("userInfo").then((value) {
            Box box = value;
            box.get("userInfo")["accessToken"] = refreshResult["accessToken"];
            box.get("userInfo")["refreshToken"] = refreshResult["refreshToken"];
            Hive.box("userInfo").put("userInfo", box.get("userInfo"));
          });
        }
        _updateProfile(data);
      } else {
        return response.statusCode;
      }
    }
    return response.statusCode;
  }

  Future<int> Function(Map<String, String?> data) get updateProfile =>
      _updateProfile;

  // Delete user

  Future<int> _deleteUser(String accessToken) async {
    io.HttpClientRequest request = await _apiClient.deleteUrl(
      Uri(
        scheme: "http",
        host: _host,
        path: "/api/v1/user/delete",
      ),
    );
    request.headers.add("Content-Type", "application/json");
    request.headers.add("Authorization", "Bearer $accessToken");
    io.HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      Map<String, String>? refreshResult = await _refreshToken(
          Hive.box("userInfo").get("userInfo")["refreshToken"]);
      if (refreshResult != null) {
        if (Hive.isBoxOpen("userInfo")) {
          Box box = Hive.box("userInfo");
          box.get("userInfo")["accessToken"] = refreshResult["accessToken"];
          box.get("userInfo")["refreshToken"] = refreshResult["refreshToken"];
          Hive.box("userInfo").put("userInfo", box.get("userInfo"));
        } else {
          await Hive.openBox("userInfo").then((value) {
            Box box = value;
            box.get("userInfo")["accessToken"] = refreshResult["accessToken"];
            box.get("userInfo")["refreshToken"] = refreshResult["refreshToken"];
            Hive.box("userInfo").put("userInfo", box.get("userInfo"));
          });
        }
      }
      return response.statusCode;
    }
  }

  Future<int> Function(String accessToken) get deleteUser => _deleteUser;

  // Reset password

  Future<int> _sendResetPassword(Map<String, String> data) async {
    io.HttpClientRequest request = await _apiClient.postUrl(
        Uri(scheme: "http", host: _host, path: "/api/v1/user/password/new"));
    request.headers.add("Content-Type", "application/json; charset=utf-8");
    request.write(jsonEncode(data));
    io.HttpClientResponse response = await request.close();
    String result = await response.transform(utf8.decoder).join();
    if (response.statusCode == 200) {
      return jsonDecode(result)["id"];
    } else {
      return -1;
    }
  }

  Future<int> Function(Map<String, String> data) get sendResetPassword =>
      _sendResetPassword;

  // Reset verification code

  Future<int> _confirmNewPassword(Map<String, dynamic> data) async {
    io.HttpClientRequest request = await _apiClient.postUrl(
      Uri(
          scheme: "http",
          host: _host,
          path: "/api/v1/user/password/new/verify"),
    );
    request.headers.add("Content-Type", "application/json; charset=utf-8");
    request.write(jsonEncode(data));
    io.HttpClientResponse response = await request.close();
    return response.statusCode;
  }

  Future<int> Function(Map<String, dynamic> data) get confirmNewPassword =>
      _confirmNewPassword;

  Future<List<int>> _createResume(Map<String, dynamic> data) async {
    if (!Hive.isBoxOpen("userInfo")) {
      await Hive.openBox("userInfo");
    }

    io.HttpClientRequest request = await _apiClient.postUrl(
      Uri(scheme: "http", host: _host, path: "/api/v1/profile/cv/create"),
    );
    request.headers.add("Content-Type", "application/json; charset=utf-8");
    request.headers.add("Authorization",
        "Bearer ${Hive.box("userInfo").get("userInfo")["accessToken"]}");
    request.write(jsonEncode(data));
    io.HttpClientResponse response = await request.close();
    List<int> result = await response.toList().then((value) {
      List<int> tempo = [];
      for (List<int> el in value) {
        for (int item in el) {
          tempo.add(item);
        }
      }
      return tempo;
    });
    if (response.statusCode == 200) {
      return result;
    } else {
      Map<String, String>? refreshResult = await _refreshToken(
          Hive.box("userInfo").get("userInfo")["refreshToken"]);
      if (refreshResult != null) {
        if (Hive.isBoxOpen("userInfo")) {
          Box box = Hive.box("userInfo");
          box.get("userInfo")["accessToken"] = refreshResult["accessToken"];
          box.get("userInfo")["refreshToken"] = refreshResult["refreshToken"];
          Hive.box("userInfo").put("userInfo", box.get("userInfo"));
        } else {
          await Hive.openBox("userInfo").then((value) {
            Box box = value;
            box.get("userInfo")["accessToken"] = refreshResult["accessToken"];
            box.get("userInfo")["refreshToken"] = refreshResult["refreshToken"];
            Hive.box("userInfo").put("userInfo", box.get("userInfo"));
          });
        }
        _createResume(data);
      } else {
        return result;
      }
    }
    return result;
  }

  Future<List<int>> Function(Map<String, dynamic> data) get createResume =>
      _createResume;
}
