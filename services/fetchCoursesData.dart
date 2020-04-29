import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cursos/screens/courseScreen.dart';
import 'package:cursos/widgets/coursesCards.dart/courseCard.dart';
import 'package:flutter/material.dart';

class FetchCoursesData extends StatefulWidget {
  const FetchCoursesData({Key key, this.field, this.style}) : super(key: key);
  final field;
  final style;

  @override
  _FetchCoursesDataState createState() => _FetchCoursesDataState();
}

class _FetchCoursesDataState extends State<FetchCoursesData> {
  final Firestore db = Firestore.instance;
  Stream cards;

  int currentPage = 1;

  @override
  void initState() {
    _queryDb();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: cards,
      initialData: [],
      builder: (context, AsyncSnapshot snapshot) {
        List cardsList = snapshot.data.toList();

        if (cardsList.length == 0) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 0,
              childAspectRatio: 4 / 3.65),
          itemCount: cardsList.length,
          itemBuilder: (context, int currentIndex) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseScreen(
                      courseId: cardsList[currentIndex],
                    ),
                  ),
                );
              },
              child: _buildCourseDeck(cardsList[currentIndex]),
            );
          },
        );
      },
    );
  }

  void _queryDb() {
    Query query = db.collection('courses');

    cards =
        query.snapshots().map((list) => list.documents.map((doc) => doc.data));
        // query.where('field', isEqualTo: 'field').snapshots().map((list) => list.documents.map((doc) => doc.data));
  }

  _buildCourseDeck(Map data) {
    return CourseCard(
      title: data['title'],
      level: data['level'],
      price: data['price'],
      lessonsNum: data['lessonsNum'],
      img: data['img'],
    );
  }
}
