import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cursos/constants/fontStyles.dart';
import 'package:cursos/services/fetchCourseContent.dart';
import 'package:flutter/material.dart';

class FetchAuthorData extends StatefulWidget {
  FetchAuthorData({Key key, this.courseId, this.field, this.style})
      : super(key: key);
  final courseId;
  final field;
  final style;

  var result;

  @override
  _FetchAuthorDataState createState() => _FetchAuthorDataState();
}

class _FetchAuthorDataState extends State<FetchAuthorData> {
  @override
  Widget build(BuildContext context) {
    String courseAuthorUid = FetchCourseContent(
      courseId: widget.courseId,
      field: 'author',
      style: screenTitle,
    ).getDataAsString();
    return StreamBuilder(
      stream: Firestore.instance
          .collection('users')
          .document(courseAuthorUid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text('Loading...');
        switch (widget.field) {
          case 'photoURL':
            return Image.network(
              snapshot.data[widget.field],
            );
          case 'userName':
            return Text(
              snapshot.data[widget.field],
              style: authorUserName,
            );
          case 'displayName':
            return Text(
              snapshot.data[widget.field],
              style: authorDisplayName,
            );
          default:
            return Text(
              snapshot.data[widget.field],
              style: authorUserName,
            );
        }
      },
    );
  }
}
