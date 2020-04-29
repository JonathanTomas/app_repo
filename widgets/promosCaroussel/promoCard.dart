import 'package:cursos/constants/appColors.dart';
import 'package:cursos/constants/fontStyles.dart';
import 'package:cursos/widgets/uiElements/appButton.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class CardItem extends StatefulWidget {
  CardItem({Key key, this.title1, this.title2, this.btnText, this.img, this.color, this.marginVertical}) : super(key: key);

  final String title1;
  final String title2;
  final String btnText;
  final String img;
  final String color;
  final double marginVertical;

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {

  LinearGradient _colorizeCard() {
    switch (widget.color) {
      case "red":
        return redGradient;
      case "green":
        return greenGradient;
      case "gold":
        return goldGradient;
      default:
        return redGradient;
    }
  }

  TextStyle _colorizeBtn() {
    switch (widget.color) {
      case "red":
        return redButtonText;
      case "green":
        return greenButtonText;
      case "gold":
        return goldButtonText;
      default:
        return redButtonText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientCard(
      gradient: _colorizeCard(),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInBack,
              margin: EdgeInsets.symmetric(vertical: widget.marginVertical),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(height: 4,),
                  Text(
                    widget.title1,
                    style: cardTitle,
                  ),
                  Text(
                    widget.title2,
                    style: cardTitle,
                  ),
                  AppButton(
                    text: widget.btnText,
                    style: _colorizeBtn(),
                    action: () {},
                  ),
                ],
              ),
            ),
             Image.network(
               widget.img,
               width: 100,
               height: 100,
             ),
          ],
        ),
      ),
    );
  }
}
