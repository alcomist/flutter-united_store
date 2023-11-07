import 'package:flutter/material.dart';
import 'package:united_market/route/route.dart';

class PageNotifier extends ChangeNotifier {
  String _pageName = PageNames.home.name;
  int? _userId;

  get pageName => _pageName;
  get userId => _userId;

  changePage({required String page}) {
    _pageName = page;
    notifyListeners();
  }

  setUserId(int id) {
    _userId = id;
  }
}
