import 'package:cursos/constants/fontStyles.dart';
import 'package:cursos/services/fetchUserData.dart';
import 'package:cursos/widgets/userWidgets/userProfileImg.dart';
import 'package:flutter/material.dart';

class ApplicationBar extends StatefulWidget {
  ApplicationBar({Key key, this.viewName}) : super(key: key);
  final viewName;

  @override
  _ApplicationBarState createState() => _ApplicationBarState();
}

class _ApplicationBarState extends State<ApplicationBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40, right: 20, bottom: 15, left: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          Column(
            children: <Widget>[
              Text(
                widget.viewName,
                style: screenTitle,
              ),
              FetchUserData(
                field: 'plan',
                style: screenSubtitle,
              ),
            ],
          ),
          GestureDetector(
            child: UserProfileImg(),
            onTap: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
    );
  }
}
