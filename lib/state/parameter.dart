import 'package:flutter/material.dart';

class AppParameterState extends ChangeNotifier {

  int? userId;

  void changeUserId(int? id) {
    userId = id;
    notifyListeners();
  }
}
