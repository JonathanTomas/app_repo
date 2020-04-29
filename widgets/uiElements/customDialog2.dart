import 'package:cursos/constants/appColors.dart';
import 'package:flutter/material.dart';
import 'package:cursos/constants/fontStyles.dart';
import 'package:image_picker/image_picker.dart';

var result = ImageSource.gallery;

showChoiceDialog(context, String title, String description, String buttonText,
    dynamic action, String secondButtonText, dynamic secondAction) {
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
        child: Stack(
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
                    title,
                    style: screenTitle,
                  ),
                  SizedBox(height: 16.0),
                  Text(description,
                      textAlign: TextAlign.center, style: authorDisplayName),
                  SizedBox(height: 24.0),
                  Divider(
                    color: Colors.white10,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FlatButton(
                          onPressed: () {
                            result = ImageSource.gallery;
                          },
                          child: Text(
                            buttonText,
                            style: redButtonText,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            result = ImageSource.camera;
                          },
                          child: Text(
                            secondButtonText,
                            style: redButtonText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
