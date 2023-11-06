import 'package:flutter/material.dart';
import 'package:united_market/route/route.dart';

class PageNotifier extends ChangeNotifier {
  String _pageName = PageNames.home.name;

  get pageName => _pageName;

  changePage({required String page}) {
    _pageName = page;
    notifyListeners();
  }
}
