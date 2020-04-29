import 'package:cursos/constants/fontStyles.dart';
import 'package:cursos/services/fetchAuthorData.dart';
import 'package:cursos/services/fetchCourseContent.dart';
import 'package:flutter/material.dart';

class CourseContentView extends StatefulWidget {
  CourseContentView({Key key, this.courseId}) : super(key: key);
  final courseId;

  @override
  _CourseContentViewState createState() => _CourseContentViewState();
}

class _CourseContentViewState extends State<CourseContentView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                height: 180,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    Image.network(
                      'https://www.solucionex.com/sites/default/files/posts/imagen/article_01360_.png',
                      color: Colors.black.withOpacity(0.4),
                      colorBlendMode: BlendMode.multiply,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: FetchCourseContent(
                        courseId: widget.courseId,
                        field: 'title',
                        style: screenTitle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(height: 20),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: CircleAvatar(
                    child: FetchAuthorData(
                      courseId: widget.courseId,
                      field: 'photoURL',
                      style: screenTitle,
                    ),
                  ),
                ),
                Text(
                  '     By ',
                  style: authorUserName,
                ),
                FetchAuthorData(
                  courseId: widget.courseId,
                  field: 'userName',
                  style: screenTitle,
                ),
                Text(
                  '   -   ',
                  style: authorDisplayName,
                ),
                FetchAuthorData(
                  courseId: widget.courseId,
                  field: 'displayName',
                  style: screenTitle,
                ),
              ],
            ),
            Container(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: FetchCourseContent(
                courseId: widget.courseId,
                field: 'description',
                style: tutorialContent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
