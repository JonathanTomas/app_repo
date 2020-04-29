import 'package:cursos/views/courseCreationView.dart';
import 'package:cursos/views/homeView.dart';
import 'package:cursos/views/profileView.dart';
import 'package:cursos/widgets/applicationBar/ApplicationBar.dart';
import 'package:cursos/widgets/navBar/navBar.dart';
import 'package:cursos/widgets/sideDrawer/sideDrawer.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatefulWidget {
  AppScreen({Key key}) : super(key: key);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _currentIndex = 0;
  final List<Widget> _content = [
    HomeView(),
    ProfileView(),
    HomeView(),
    HomeView(),
    HomeView(),
  ];
  final List<String> _viewNames = [
    'HOME',
    'PROFILE',
    'SETTINGS',
    'CREATE COURSE',
    'TEST2',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: SideDrawer(),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                ApplicationBar(viewName: _viewNames[_currentIndex]),
                Expanded(
                  child: IndexedStack(
                    children: <Widget>[
                      HomeView(),
                      ProfileView(),
                      HomeView(),
                      CourseCreationView(),
                      HomeView(),
                    ],
                    index: _currentIndex,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: NavBar(
                  notifyParent: refresh,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  refresh(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
