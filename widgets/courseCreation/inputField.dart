import 'package:cursos/constants/appColors.dart';
import 'package:cursos/constants/fontStyles.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  InputField({
    Key key,
    this.hint,
    this.errorText,
    this.charCount,
    this.maxLines,
    this.textInputAction,
    this.textController,
    this.keyboardType,
    this.passwordVisible,
  }) : super(key: key);
  final hint;
  final errorText;
  final charCount;
  final maxLines;
  final textInputAction;
  final textController;
  final keyboardType;
  final passwordVisible;

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  TextEditingController myController = TextEditingController();
  int currentLength = 0;
  bool _passwordVisible;
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    myController.addListener(() {
      currentLength = myController.text.length;
      setState(() {});
    });
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.passwordVisible != null ? !_passwordVisible : false,
      keyboardType: widget.keyboardType,
      controller: widget.textController,
      cursorColor: secondaryColor,
      style:
          authorUserName.copyWith(fontSize: 13, fontFamily: 'Poppins Medium'),
      maxLength: widget.charCount,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: secondaryColor, width: 0.6),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: secondaryColor, width: 0.6),
          borderRadius: BorderRadius.circular(4),
        ),
        errorStyle: authorDisplayName.copyWith(fontSize: 11),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: secondaryColor, width: 0.6),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: secondaryColor, width: 0.6),
          borderRadius: BorderRadius.circular(4),
        ),
        hintText: widget.hint,
        hintStyle: authorDisplayName.copyWith(fontSize: 13),
        suffix: widget.charCount != null
            ? Container(
                margin: EdgeInsets.only(left: 6),
                width: 53,
                child: Text(
                  '$currentLength/${widget.charCount}',
                  textAlign: TextAlign.right,
                ),
              )
            : null,
        suffixIcon: widget.keyboardType == TextInputType.visiblePassword
            ? IconButton(
                icon: Icon(!_passwordVisible
                    ? Icons.visibility_off
                    : Icons.visibility),
                color: _passwordVisible ? Colors.white : secondaryColor,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : null,
        counter: Text(''),
        counterStyle: authorDisplayName.copyWith(fontSize: 13),
      ),
      maxLines: widget.maxLines != null ? widget.maxLines : 1,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: (value) {
        if (widget.textInputAction == TextInputAction.done) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      validator: (value) {
        switch (widget.hint) {
          case 'Email':
            if (value.isNotEmpty && !EmailValidator.validate(value)) {
              return 'Email is invalid';
            }
            break;
          case 'Password':
            if (value.length < 6) {
              return 'Password is too weak';
            }
            break;
          case 'Username':
            if (value.contains(' ')) {
              return 'Username cannot contain blank spaces';
            }
            break;
          default:
        }
        if (value.isEmpty) {
          return widget.errorText;
        }
        return null;
      },
    );
  }
}
