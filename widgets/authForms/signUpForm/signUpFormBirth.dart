import 'package:cursos/constants/appColors.dart';
import 'package:cursos/constants/fontStyles.dart';
import 'package:cursos/widgets/authForms/signUpForm/signUpFormUserName.dart';
import 'package:cursos/widgets/courseCreation/inputField.dart';
import 'package:cursos/widgets/uiElements/appButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SignUpFormBirth extends StatefulWidget {
  SignUpFormBirth({Key key, this.email, this.displayName, this.password})
      : super(key: key);
  final email;
  final displayName;
  final password;

  @override
  _SignUpFormBirthState createState() => _SignUpFormBirthState();
}

class _SignUpFormBirthState extends State<SignUpFormBirth> {
  final _dateController = TextEditingController();
  DateTime _birthDate;
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Birth date',
                    style: screenTitle,
                  ),
                  Container(
                    height: 20,
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      DatePicker.showDatePicker(context,
                          theme: DatePickerTheme(
                              cancelStyle:
                                  authorUserName.copyWith(color: primaryColor),
                              doneStyle: authorUserName,
                              headerColor: secondaryColor,
                              backgroundColor: primaryColor,
                              itemStyle: authorDisplayName),
                          showTitleActions: true,
                          minTime:
                              DateTime.now().subtract(Duration(days: 47450)),
                          maxTime: DateTime.now(),
                          onChanged: (date) {}, onConfirm: (date) {
                        setBirthDate(date);
                        _birthDate = date;
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: IgnorePointer(
                      child: InputField(
                        hint: 'Birth date',
                        errorText: 'Birth must not be empty',
                        textInputAction: TextInputAction.next,
                        textController: _dateController,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  AppButton(
                      action: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SignUpFormUserName(
                                    email: widget.email,
                                    displayName: widget.displayName,
                                    password: widget.password,
                                    birthDate: _birthDate,
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
    );
  }

  void setBirthDate(DateTime date) {
    setState(() {
      _dateController.text =
          '${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    });
  }
}
