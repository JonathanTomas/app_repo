import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SetCourseData {
  SetCourseData(
      {this.img,
      this.lessonsNum,
      this.level,
      this.price,
      this.title,
      this.description,
      this.category});

  String img, lessonsNum, level, price, title, category, description;
  final _db = Firestore.instance;
  FirebaseUser _user;
  FirebaseUser currentUser() => _user;

  void createRecord() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser _user = await _auth.currentUser();
    final uid = _user.uid;
    DocumentReference ref = await _db.collection("courses").add({
      'title': title,
      'description': description,
      'category': category,
      'author': uid,
      'img': img,
      'lessonsNum': lessonsNum,
      'level': level,
      'price': price,
    });
  }
}
