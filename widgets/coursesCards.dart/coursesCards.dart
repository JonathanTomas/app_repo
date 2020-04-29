import 'package:cursos/services/fetchCoursesData.dart';
import 'package:flutter/material.dart';

class CoursesCards extends StatefulWidget {
  CoursesCards({Key key}) : super(key: key);

  @override
  _CoursesCardsState createState() => _CoursesCardsState();
}

class _CoursesCardsState extends State<CoursesCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        child: FetchCoursesData());
  }
}
