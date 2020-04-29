import 'package:cursos/constants/appColors.dart';
import 'package:cursos/constants/fontStyles.dart';
import 'package:cursos/states/tutorialState.dart';
import 'package:cursos/widgets/uiElements/appButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TutorialSlide extends StatefulWidget {
  TutorialSlide({Key key, this.title, this.illustration, this.content})
      : super(key: key);
  final title;
  final content;
  final illustration;

  @override
  _TutorialSlideState createState() => _TutorialSlideState();
}

class _TutorialSlideState extends State<TutorialSlide> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.title,
                style: screenTitle,
              ),
              Text(
                widget.content,
                textAlign: TextAlign.center,
                style: tutorialContent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TutorialLastSlide extends StatefulWidget {
  TutorialLastSlide({Key key, this.title, this.illustration, this.content})
      : super(key: key);
  final title;
  final content;
  final illustration;

  @override
  _TutorialLastSlide createState() => _TutorialLastSlide();
}

class _TutorialLastSlide extends State<TutorialLastSlide> {
  bool _ignoring = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              style: screenTitle,
            ),
            Text(
              widget.content,
              style: tutorialContent,
            ),
            IgnorePointer(
              ignoring: _ignoring,
              child: AppButton(
                text: 'Continue',
                action: () {
                  _ignoring = true;
                  Provider.of<TutorialState>(context).seeTutorial();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
