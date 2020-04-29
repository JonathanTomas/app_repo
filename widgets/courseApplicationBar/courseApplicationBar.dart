import 'package:cursos/constants/fontStyles.dart';
import 'package:cursos/widgets/userWidgets/userProfileImg.dart';
import 'package:flutter/material.dart';

class CourseApplicationBar extends StatefulWidget {
  CourseApplicationBar({Key key, this.courseId}) : super(key: key);
  final courseId;

  @override
  _CourseApplicationBarState createState() => _CourseApplicationBarState();
}

class _CourseApplicationBarState extends State<CourseApplicationBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40, right: 20, bottom: 15, left: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Text('COURSE', style: screenTitle,),
          UserProfileImg(),
        ],
      ),
    );
  }
}
