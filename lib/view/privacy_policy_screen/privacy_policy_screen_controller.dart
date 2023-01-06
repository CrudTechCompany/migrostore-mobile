import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyScreenController extends ChangeNotifier {
  // WebView

  late WebViewController _webViewController;
  WebViewController get webViewController => _webViewController;
  void _setWebViewController(WebViewController controller) {
    _webViewController = controller;
    notifyListeners();
  }

  Function get setWebViewController => _setWebViewController;

  // Load state

  bool _loadState = true;
  bool get loadState => _loadState;
  void _setLoadState() {
    _loadState = !_loadState;
    notifyListeners();
  }

  Function get setLoadState => _setLoadState;
}
