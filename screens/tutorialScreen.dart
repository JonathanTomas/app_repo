import 'package:cursos/constants/appColors.dart';
import 'package:cursos/constants/fontStyles.dart';
import 'package:cursos/states/tutorialState.dart';
import 'package:cursos/widgets/tutorialSlide/tutorialSlide.dart';
import 'package:cursos/widgets/uiElements/appButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TutorialScreen extends StatefulWidget {
  TutorialScreen({Key key}) : super(key: key);

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  PageController controller = PageController(initialPage: 0);
  bool _ignoring = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        PageView(
          controller: controller,
          children: <Widget>[
            TutorialSlide(
              title: 'Tutorial 1',
              content:
                  'This is page 1 of the Tutorial screen. I hope you love it!',
            ),
            TutorialSlide(
              title: 'Tutorial 2',
              content:
                  'On page 2 there is another nice and useful text. This app rocks.',
            ),
            TutorialSlide(
              title: 'Tutorial 3',
              content: 'Wait... There\'s another one on page 3!',
            ),
            TutorialLastSlide(
              title: 'Tutorial 4',
              content: 'Let\'s do this!',
            ),
          ],
        ),
        Container(
          // Pagination dots
          margin: EdgeInsets.only(bottom: 30),
          alignment: Alignment.bottomCenter,
          child: SmoothPageIndicator(
            controller: controller,
            count: 4,
            effect: WormEffect(
              spacing: 25,
              activeDotColor: primaryAccent,
              dotColor: secondaryColor,
              dotWidth: 13,
              dotHeight: 13,
            ),
          ),
        ),
      ],
    ));
  }
}
