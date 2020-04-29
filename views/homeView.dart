import 'package:cursos/widgets/coursesCards.dart/coursesCards.dart';
import 'package:cursos/widgets/promosCaroussel/promosCaroussel.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          child: ListView(
            addAutomaticKeepAlives: true,
            children: <Widget>[
              PromosCaroussel(),
              Container(
                height: 50,
              ),
              CoursesCards(),
              Container(height: 90),
            ],
          ),
        ),
      ],
    );
  }
}
