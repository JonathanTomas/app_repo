import 'package:cursos/services/fetchPromosData.dart';
import 'package:flutter/material.dart';

class PromosCaroussel extends StatefulWidget {
  PromosCaroussel({Key key}) : super(key: key);

  @override
  _PromosCarousselState createState() => _PromosCarousselState();
}

class _PromosCarousselState extends State<PromosCaroussel> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 130,
        child: FetchPromosData());
  }
}
