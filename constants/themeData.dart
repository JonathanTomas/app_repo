import 'package:cursos/constants/appColors.dart';
import 'package:flutter/material.dart';

ThemeData darkModeThemeData = ThemeData.dark().copyWith(
  accentColor: primaryAccent,
  scaffoldBackgroundColor: primaryColor,
  buttonTheme: ButtonThemeData(buttonColor: Colors.white),
  toggleableActiveColor: primaryAccent,
  toggleButtonsTheme: ToggleButtonsThemeData(disabledColor: secondaryAccent),
);

ThemeData lightModeThemeData = ThemeData.light().copyWith(
  accentColor: primaryAccentLM,
  scaffoldBackgroundColor: primaryColorLM,
  buttonTheme: ButtonThemeData(buttonColor: Colors.white),
  toggleableActiveColor: primaryAccent,
  toggleButtonsTheme: ToggleButtonsThemeData(disabledColor: secondaryAccentLM),
);