import 'package:cursos/constants/appColors.dart';
import 'package:cursos/constants/themeData.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeState with ChangeNotifier {
  bool _isDarkModeEnabled = false;
  SharedPreferences _prefs;

  ThemeState() {
    themeState();
  }

  ThemeData get currentTheme =>
      _isDarkModeEnabled ? darkModeThemeData : lightModeThemeData;

  bool get isDarkModeEnabled => _isDarkModeEnabled;
  void setDarkMode(bool b) async {
    _isDarkModeEnabled = b;
    _prefs.setBool('isDarkModeEnabled', _isDarkModeEnabled);
    notifyListeners();
  }

  void themeState() async {
    _prefs = await SharedPreferences.getInstance();
    if (_prefs.getBool('isDarkModeEnabled') == true) {
      _isDarkModeEnabled = true;
      notifyListeners();
    } else {
      _isDarkModeEnabled = false;
      notifyListeners();
    }
  }
}
