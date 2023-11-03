import 'dart:math';

import 'package:flutter/material.dart';
import 'package:united_store/constants.dart';

class AppSettingState extends ChangeNotifier {

  ColorSeed colorSelected = ColorSeed.baseColor;
  ThemeMode themeMode = ThemeMode.dark;
  bool useMaterial3 = true;

  void setThemeMode(BuildContext context) {
    if ( View.of(context).platformDispatcher.platformBrightness == Brightness.light ) {
      themeMode = ThemeMode.light;
      return;
    }
    themeMode = ThemeMode.dark;
  }

  bool useLightMode(BuildContext context) {

    switch (themeMode) {
      case ThemeMode.system:
        return View.of(context).platformDispatcher.platformBrightness == Brightness.light;
      case ThemeMode.light:
        return true;
      case ThemeMode.dark:
        return false;
    }
  }

  void changeBrightness(bool useLightMode) {
    themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  void changeColor(int value) {
    colorSelected = ColorSeed.values[value];
    notifyListeners();
  }

  void changeMaterial() {
    useMaterial3 = !useMaterial3;
    notifyListeners();
  }
}
