import 'package:cursos/constants/fontStyles.dart';
import 'package:cursos/screens/signInScreen.dart';
import 'package:cursos/widgets/authForms/signUpForm/signUpFormBirth.dart';
import 'package:cursos/widgets/courseCreation/inputField.dart';
import 'package:cursos/widgets/uiElements/appButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cursos/widgets/uiElements/customDialog.dart';

class SignUpFormDisplayName extends StatefulWidget {
  SignUpFormDisplayName({Key key, this.email}) : super(key: key);
  final email;

  @override
  _SignUpFormDisplayNameState createState() => _SignUpFormDisplayNameState();
}

class _SignUpFormDisplayNameState extends State<SignUpFormDisplayName> {
  final _displayNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return WillPopScope(
      onWillPop: () {
        showContent(
            context,
            'Are you sure?',
            'There are just a few more steps to get into the app. Do you still want to go back?',
            'Continue',
            'pop',
            'Go back',
            SignInScreen());
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Full name and password',
                      style: screenTitle,
                    ),
                    Container(
                      height: 20,
                    ),
                    InputField(
                      hint: 'Full name',
                      errorText: 'Name must not be empty',
                      textInputAction: TextInputAction.next,
                      textController: _displayNameController,
                      keyboardType: TextInputType.text,
                    ),
                    Container(
                      height: 10,
                    ),
                    InputField(
                      hint: 'Password',
                      errorText: 'Password must not be empty',
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      textController: _passwordController,
                      passwordVisible: false,
                    ),
                    Container(
                      height: 20,
                    ),
                    AppButton(
                        action: () {
                          if (_formKey.currentState.validate() &&
                              _passwordController.value.text.length >= 6) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SignUpFormBirth(
                                      email: widget.email,
                                      displayName:
                                          _displayNameController.value.text,
                                      password: _passwordController.value.text,
                                    )));
                          }
                        },
                        text: 'Continue',
                        style: redButtonText),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
