import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FetchUserData extends StatefulWidget {
  const FetchUserData({Key key, this.field, this.style}) : super(key: key);
  final field;
  final style;

  @override
  _FetchUserDataState createState() => _FetchUserDataState();
}

class _FetchUserDataState extends State<FetchUserData> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
    return StreamBuilder<DocumentSnapshot>(
      stream:
          Firestore.instance.collection('users').document(user.uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          Map data = snapshot.data.data;
          return Text(
            data[widget.field],
            style: widget.style,
          );
        }
        return Text('');
      },
    );
  }
}
