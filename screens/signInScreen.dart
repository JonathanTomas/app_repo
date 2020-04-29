import 'package:cursos/constants/appColors.dart';
import 'package:cursos/constants/fontStyles.dart';
import 'package:cursos/views/signInView.dart';
import 'package:cursos/views/signUpView.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  int _currentIndex = 0;
  final List<Widget> _content = [SignInView(), SignUpView()];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        body: Stack(
          children: <Widget>[
            _content[_currentIndex],
            Container(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  setChild();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: secondaryColor, width: 0.5))),
                  child: _currentIndex == 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Don\'t you have an account yet? ',
                              style: authorDisplayName.copyWith(fontSize: 12),
                            ),
                            Text(
                              '  Sign up',
                              style: authorUserName.copyWith(fontSize: 12),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Do you already have an account? ',
                              style: authorDisplayName.copyWith(fontSize: 12),
                            ),
                            Text(
                              '  Sign in',
                              style: authorUserName.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setChild() {
    if (_currentIndex == 0) {
      setState(() {
        _currentIndex = 1;
      });
    } else {
      setState(() {
        _currentIndex = 0;
      });
    }
  }
}
