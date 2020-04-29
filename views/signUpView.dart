import 'package:cursos/states/loginState.dart';
import 'package:cursos/widgets/authForms/signUpForm/signUpFormEmail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  SignUpView({Key key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Consumer<LoginState>(
            builder: (BuildContext context, LoginState value, Widget child) {
              if (value.isLoading()) {
                return CircularProgressIndicator();
              } else {
                return child;
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'LOGO',
                  style: TextStyle(fontSize: 60, fontFamily: 'Poppins Bold'),
                ),
                Container(
                  height: 30,
                ),
                SignUpFormEmail(),
              ],
            ),
          ),
        ),
      ],

    );
  }
}
