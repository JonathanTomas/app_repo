import 'package:cursos/states/loginState.dart';
import 'package:cursos/widgets/uiElements/appButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogOutButton extends StatefulWidget {
  LogOutButton({Key key}) : super(key: key);

  @override
  _LogOutButtonState createState() => _LogOutButtonState();
}

class _LogOutButtonState extends State<LogOutButton> {
  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: 'Sign out',
      action: () {
        Provider.of<LoginState>(context).logout();
      },
    );
  }
}
