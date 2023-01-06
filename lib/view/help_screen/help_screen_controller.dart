import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreenController extends ChangeNotifier {
  final List<Map<String, String>> _items = [
    {
      "icon": "assets/medicine_icon.svg",
      "title": "Державна медична допомога",
      "link": "https://www.gov.pl/web/ua/derzhavna-medychna-dopomoha",
    },
    {
      "icon": "assets/education_icon.svg",
      "title": "Освіта і наука",
      "link": "https://www.gov.pl/web/ua/osvita-i-nauka",
    },
    {
      "icon": "assets/payment_icon.svg",
      "title": "Соціальні виплати",
      "link": "https://www.gov.pl/web/ua/Sotsialni-vyplaty",
    },
    {
      "icon": "assets/law_icon.svg",
      "title": "Безкошковна юридична допомога",
      "link": "https://www.gov.pl/web/ua/Yurydychna-dopomoha",
    },
    {
      "icon": "assets/legalization_icon.svg",
      "title": "Легальне перебування",
      "link": "https://www.gov.pl/web/ua/Lehalne-perebuvannya-v-Polshchi",
    },
  ];
  List<Map<String, String>> get items => _items;

  void _onClickItem(int index) async {
    await launchUrl(Uri.parse(items[index]["link"]!),
        mode: LaunchMode.externalApplication);
  }

  Function get onClickItem => _onClickItem;
}
