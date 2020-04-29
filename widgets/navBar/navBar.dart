import 'package:cursos/constants/appColors.dart';
import 'package:cursos/widgets/navBar/menuItem.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  NavBar({Key key, this.notifyParent}) : super(key: key);

  final Function(int) notifyParent;

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List items = [
    MenuItem(index: 0, pos: -1.0, name: "success", color: primaryAccent),
    MenuItem(index: 1, pos: -0.5, name: "success", color: primaryAccent),
    MenuItem(index: 2, pos: 0.0, name: "success", color: primaryAccent),
    MenuItem(index: 3, pos: 0.5, name: "success", color: primaryAccent),
    MenuItem(index: 4, pos: 1.0, name: "success", color: primaryAccent),
  ];

  MenuItem active;

  FlareControls _controller;

  @override
  void initState() {
    super.initState();
    active = items[0];
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: primaryColor,
            blurRadius: 100.0,
            spreadRadius: 200.0,
            offset: Offset(
              0.0,
              170.0,
            ),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        child: Container(
          height: 65,
          color: secondaryColor,
          child: Stack(
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(milliseconds: 100),
                alignment: Alignment(active.pos, -1),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  height: 6,
                  width: w * 0.2,
                  color: active.color,
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: items.map((item) {
                    return _flare(item);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _flare(MenuItem item) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 0.7,
        child: Padding(
          padding: EdgeInsets.only(top: 6),
          child: FlareActor(
            'assets/flareIcons/${item.name}.flr',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            controller: _controller,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          active = item;
        });
        widget.notifyParent(active.index);
      },
    );
  }
}
