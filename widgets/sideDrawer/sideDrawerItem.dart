import 'package:cursos/constants/appColors.dart';
import 'package:cursos/constants/fontStyles.dart';
import 'package:flutter/material.dart';

class SideDrawerItem extends StatelessWidget {
  const SideDrawerItem({Key key, this.icon, this.text, this.action})
      : super(key: key);
  final icon;
  final text;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        action();
      },
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              icon,
              color: secondaryColor,
            ),
            onPressed: () {},
          ),
          Text(
            text,
            style: drawerItem,
          )
        ],
      ),
    );
  }
}
