import 'package:cursos/constants/appColors.dart';
import 'package:flutter/material.dart';
import 'package:cursos/constants/fontStyles.dart';

showContent(context, String title, String description, String buttonText,
    String action, String secondButtonText, Widget secondAction) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context, title, description, buttonText, action,
            secondButtonText, secondAction),
      );
    },
  );
}

dialogContent(
    BuildContext context,
    String titleText,
    String descriptionText,
    String buttonText,
    String action,
    String secondButtonText,
    Widget secondAction) {
  return Stack(
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(
          top: 30,
          bottom: 10,
          left: 10,
          right: 10,
        ),
        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: primaryColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              titleText,
              style: screenTitle,
            ),
            SizedBox(height: 16.0),
            Text(descriptionText,
                textAlign: TextAlign.center, style: authorDisplayName),
            SizedBox(height: 24.0),
            Divider(
              color: Colors.white10,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: secondButtonText != ''
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {
                      if (action == "pop") {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      buttonText,
                      style: redButtonText,
                    ),
                  ),
                  secondButtonText != ''
                      ? FlatButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => secondAction,
                              ),
                            );
                          },
                          child: Text(
                            secondButtonText,
                            style: redButtonText,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
