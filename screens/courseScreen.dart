import 'package:cursos/views/courseContentView.dart';
import 'package:cursos/widgets/courseApplicationBar/courseApplicationBar.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  CourseScreen({Key key, this.courseId}) : super(key: key);
  final courseId;

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              CourseApplicationBar(
                courseId: widget.courseId,
              ),
              CourseContentView(courseId: widget.courseId),
            ],
          ),
        ],
      ),
    );
  }
}
