import 'package:cursos/widgets/applicationBar/miniApplicationBar.dart';
import 'package:cursos/widgets/userWidgets/userProfileImg.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              MiniApplicationBar(),
              UserProfileImg(radius: 60.0),
            ],
          ),
        ],
      ),
    );
  }
}