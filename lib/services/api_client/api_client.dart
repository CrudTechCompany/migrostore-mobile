import 'dart:convert';
import 'dart:io' as io;

class ApiClient {
  final io.HttpClient _apiClient = io.HttpClient();
  final String _host = "app.migrostore.pl";

  // List of cities

  Future<List<String>> _getCitiesList() async {
    List<String> tempo = [];

    io.HttpClientRequest request = await _apiClient.getUrl(
      Uri(
        scheme: "https",
        host: _host,
        path: "/api/v1/cities",
      ),
    );
    io.HttpClientResponse response = await request.close();
    String result = "";
    await response.transform(utf8.decoder).forEach(
      (element) {
        result += element;
      },
    );
    for (var element in (jsonDecode(result) as List<dynamic>)) {
      tempo.add(element);
    }
    _apiClient.close();
    return tempo;
  }

  Future<List<String>> Function() get getCitiesList => _getCitiesList;

  // List of skills

  Future<List<String>> _getSkillsList() async {
    List<String> tempo = [];
    io.HttpClientRequest request = await _apiClient.getUrl(
      Uri(
        scheme: "https",
        host: _host,
        path: "/api/v1/skills",
      ),
    );
    io.HttpClientResponse response = await request.close();
    String result = "";
    await response.transform(utf8.decoder).forEach(
      (element) {
        result += element;
      },
    );
    for (var element in (jsonDecode(result) as List<dynamic>)) {
      tempo.add(element);
    }
    _apiClient.close();
    return tempo;
  }

  Future<List<String>> Function() get getSkillsList => _getSkillsList;

  // Сreate a legalization request

  Future<int> _createLegalizationRequest(Map<String, String?> body) async {
    io.HttpClientRequest request = await _apiClient.postUrl(
      Uri(scheme: "https", host: _host, path: "/api/v1/legalization/create"),
    );
    request.headers.set("Accept", "application/json");
    request.headers.set("Content-type", "application/json; charset=UTF-8");
    request.write(jsonEncode(body));
    io.HttpClientResponse response = await request.close();
    _apiClient.close();
    return response.statusCode;
  }

  Future<int> Function(Map<String, String?> body)
      get createLegalizationRequest => _createLegalizationRequest;
}
