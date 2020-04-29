import 'package:cursos/states/themeState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DarkModeSwitch extends StatefulWidget {
  DarkModeSwitch({Key key}) : super(key: key);

  @override
  _DarkModeSwitchState createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ThemeState>(
        builder: (context, state, child) {
          return Switch(
            value: state.isDarkModeEnabled,
            onChanged: (_) {
              state.setDarkMode(!state.isDarkModeEnabled);
            },
          );
        },
      ),
    );
  }
}
