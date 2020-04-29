import 'package:flutter/material.dart';

class MiniApplicationBar extends StatefulWidget {
  MiniApplicationBar({Key key}) : super(key: key);

  @override
  _MiniApplicationBarState createState() => _MiniApplicationBarState();
}

class _MiniApplicationBarState extends State<MiniApplicationBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40, right: 20, bottom: 15, left: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
