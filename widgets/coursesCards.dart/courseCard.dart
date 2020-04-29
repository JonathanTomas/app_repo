import 'package:cursos/constants/appColors.dart';
import 'package:cursos/constants/fontStyles.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class CourseCard extends StatefulWidget {
  CourseCard(
      {Key key, this.title, this.level, this.price, this.lessonsNum, this.img})
      : super(key: key);

  final String title;
  final String level;
  final String price;
  final String lessonsNum;
  final String img;

  @override
  _CourseCardState createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  LinearGradient _colorizeCard() {
    switch (widget.level) {
      case "Rookie":
        return rookieGradient;
      case "Intermediate":
        return intermediateGradient;
      case "Senior":
        return seniorGradient;
      case "Professional":
        return professionalGradient;
      default:
        return professionalGradient;
    }
  }

  Color _colorizeLevelBox() {
    switch (widget.level) {
      case "Rookie":
        return rookieColorLight;
      case "Intermediate":
        return intermediateColorLight;
      case "Senior":
        return seniorColorLight;
      case "Professional":
        return professionalColorLight;
      default:
        return professionalColorLight;
    }
  }

  Color _colorizeLevelText() {
    switch (widget.level) {
      case "Rookie":
        return rookieColorDark;
      case "Intermediate":
        return intermediateColorDark;
      case "Senior":
        return seniorColorDark;
      case "Professional":
        return professionalColorDark;
      default:
        return professionalColorDark;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GradientCard(
          margin: EdgeInsets.all(0),
          gradient: _colorizeCard(),
          child: Container(
            padding: EdgeInsets.all(10),
            height: 80,
            child: Center(
                //child: Image.network(widget.img),
                ),
          ),
        ),
        Text(
          widget.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: courseCardTitle,
        ),
        Container(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: _colorizeLevelBox(),
              borderRadius: BorderRadius.circular(2)),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          child: Text(
            widget.level,
            style: courseCardLevel.copyWith(color: _colorizeLevelText()),
          ),
        ),
      ],
    );
  }
}
