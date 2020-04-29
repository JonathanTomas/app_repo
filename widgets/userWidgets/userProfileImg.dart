import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileImg extends StatelessWidget {
  const UserProfileImg({Key key, this.radius}) : super(key: key);
  final radius;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
    return StreamBuilder<DocumentSnapshot>(
      stream:
          Firestore.instance.collection('users').document(user.uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          Map data = snapshot.data.data;
          return ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                data['photoURL'] != null
                    ? data['photoURL']
                    : 'https://firebasestorage.googleapis.com/v0/b/cursos-ee3d1.appspot.com/o/default_images%2Fprofile_picture.png?alt=media&token=bfd6cb48-b2c9-4f2d-a064-71baf7c8e716',
              ),
              radius: radius,
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
