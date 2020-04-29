import 'package:cursos/widgets/courseCreation/courseCreationDataForm.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class CourseCreationView extends StatefulWidget {
  CourseCreationView({Key key}) : super(key: key);

  @override
  _CourseCreationViewState createState() => _CourseCreationViewState();
}

class _CourseCreationViewState extends State<CourseCreationView> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          child: KeyboardAvoider(
            autoScroll: true,
            duration: Duration(milliseconds: 50),
            focusPadding: 20,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: <Widget>[
                CourseCreationDataForm(),
                Container(height: 90),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
