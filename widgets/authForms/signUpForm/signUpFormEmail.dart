import 'package:cursos/constants/fontStyles.dart';
import 'package:cursos/widgets/authForms/signUpForm/signUpFormDisplayName.dart';
import 'package:cursos/widgets/courseCreation/inputField.dart';
import 'package:cursos/widgets/uiElements/appButton.dart';
import 'package:cursos/widgets/uiElements/customDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpFormEmail extends StatefulWidget {
  SignUpFormEmail({Key key}) : super(key: key);

  @override
  _SignUpFormEmailState createState() => _SignUpFormEmailState();
}

class _SignUpFormEmailState extends State<SignUpFormEmail> {
  final _emailController = TextEditingController();
  bool isUsed;

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
            Container(
              height: 20,
            ),
            AppButton(
                action: () {
                  checkIfUsed().then((value) {
                    if (_formKey.currentState.validate() && isUsed == false) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              SignUpFormDisplayName(
                                email: _emailController.value.text,
                              )));
                    } else if (_formKey.currentState.validate() &&
                        isUsed == true) {
                      showContent(
                          context,
                          'Email already in use',
                          'Email address ${_emailController.value.text} is already linked to an existing account. Please, try again with another email address.',
                          'Try again',
                          'pop',
                          '',
                          null);
                    }
                  });
                },
                text: 'Sign up',
                style: redButtonText),
          ],
        ),
      ),
    );
  }

  Future checkIfUsed() async {
    QuerySnapshot querySnapshot =
        await Firestore.instance.collection("users").getDocuments();
    var list = querySnapshot.documents;

    for (var element in list) {
      if (element.data['email'] == _emailController.value.text) {
        isUsed = true;
        break;
      } else {
        isUsed = false;
      }
    }
  }
}
