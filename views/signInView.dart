import 'package:cursos/states/loginState.dart';
import 'package:cursos/widgets/authForms/signInForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

class SignInView extends StatefulWidget {
  SignInView({Key key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
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
                SinInForm(),
                Column(
                  children: [
                    SignInButton(Buttons.Google, onPressed: () {
                      Provider.of<LoginState>(context)
                          .login(LoginProvider.GOOGLE);
                    }),
                    SignInButton(Buttons.Facebook, onPressed: () {
                      Provider.of<LoginState>(context)
                          .login(LoginProvider.FACEBOOK);
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
