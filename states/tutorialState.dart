import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutorialState with ChangeNotifier {
  SharedPreferences _prefs;

  bool _tutorialSeen = false;

  TutorialState() {
    tutorialState();
  }

  bool isTutorialSeen() => _tutorialSeen;

  void seeTutorial() {
    _prefs.setBool('isTutorialSeen', true);
    _tutorialSeen = true;
    notifyListeners();
  }

  void tutorialState() async {
    _prefs = await SharedPreferences.getInstance();
    if (_prefs.getBool('isTutorialSeen') == true) {
      _tutorialSeen = true;
      notifyListeners();
    } else {
      _tutorialSeen = false;
      notifyListeners();
    }
  }
}
