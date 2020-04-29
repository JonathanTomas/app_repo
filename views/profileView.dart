import 'package:cursos/widgets/uiElements/logOutButton.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          child: ListView(
            addAutomaticKeepAlives: true,
            children: <Widget>[
              Center(child: LogOutButton()),
            ],
          ),
        ),
      ],
    );
  }
}
