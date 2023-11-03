import 'package:flutter/material.dart';
import 'package:united_store/route/route.dart';

class PageNotifier extends ChangeNotifier {
  String _pageName = PageNames.main.name;

  get pageName => _pageName;

  changePage({required String page}) {
    _pageName = page;
    notifyListeners();
  }
}
