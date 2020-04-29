import 'package:cursos/constants/fontStyles.dart';
import 'package:cursos/states/loginState.dart';
import 'package:cursos/widgets/courseCreation/inputField.dart';
import 'package:cursos/widgets/uiElements/appButton.dart';
import 'package:cursos/widgets/uiElements/customDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SinInForm extends StatefulWidget {
  SinInForm({Key key}) : super(key: key);

  @override
  _SinInFormState createState() => _SinInFormState();
}

class _SinInFormState extends State<SinInForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InputField(
              hint: 'Email',
              errorText: 'Email must not be empty',
              textInputAction: TextInputAction.next,
              textController: _emailController,
              keyboardType: TextInputType.emailAddress,
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
                  if (_formKey.currentState.validate()) {
                    Provider.of<LoginState>(context).handleEmailSignIn(
                        _emailController.value.text,
                        _passwordController.value.text);
                  }
                },
                text: 'Sign in',
                style: redButtonText),
          ],
        ),
      ),
    );
  }
}
