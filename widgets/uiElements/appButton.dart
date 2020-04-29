import 'package:cursos/constants/fontStyles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  AppButton({Key key, this.action, this.text, this.style}) : super(key: key);
  final action;
  final text;
  final style;

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      onPressed: (widget.action != null ? widget.action : null),
      child: Text(
        widget.text,
        style: widget.style != null ? widget.style : redButtonText,
      ),
    );
  }
}
