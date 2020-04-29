import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FetchCourseContent extends StatefulWidget {
  FetchCourseContent({Key key, this.courseId, this.field, this.style})
      : super(key: key);
  final courseId;
  final field;
  final style;

  String getDataAsString() {
    return courseId[field];
  }

  @override
  _FetchCourseContentState createState() => _FetchCourseContentState();
}

class _FetchCourseContentState extends State<FetchCourseContent> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('courses').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text('Loading...');
        return Text(
          widget.courseId[widget.field],
          style: widget.style,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }
}
