import 'package:cursos/widgets/uiElements/darkModeSwitch.dart';
import 'package:cursos/widgets/uiElements/logOutButton.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DarkModeSwitch(),
            LogOutButton(),
          ],
        ),
      ),
    );
  }
}
