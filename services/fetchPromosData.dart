import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cursos/widgets/promosCaroussel/promoCard.dart';
import 'package:flutter/material.dart';

class FetchPromosData extends StatefulWidget {
  const FetchPromosData({Key key, this.field, this.style}) : super(key: key);
  final field;
  final style;

  @override
  _FetchPromosDataState createState() => _FetchPromosDataState();
}

class _FetchPromosDataState extends State<FetchPromosData> {
  final PageController controller =
      PageController(viewportFraction: 0.7, initialPage: 1);
  final Firestore db = Firestore.instance;
  Stream slides;

  int currentPage = 1;

  @override
  void initState() {
    _queryDb();

    controller.addListener(() {
      int next = controller.page.round();

      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: slides,
      initialData: [],
      builder: (context, AsyncSnapshot snapshot) {
        List slideList = snapshot.data.toList();

        if (slideList.length == 0) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return PageView.builder(
          controller: controller,
          itemCount: slideList.length,
          itemBuilder: (context, int currentIndex) {
            bool active = currentIndex == currentPage;
            return _buildPromoSlide(slideList[currentIndex], active);
          },
        );
      },
    );
  }

  Stream _queryDb() {
    Query query = db.collection('promos');

    slides =
        query.snapshots().map((list) => list.documents.map((doc) => doc.data));
  }

  _buildPromoSlide(Map data, bool active) {
    final double top = active ? 1 : 5;
    final Duration duration = Duration(milliseconds: 300);

    return AnimatedContainer(
      height: 100,
      duration: duration,
      curve: Curves.easeInBack,
      margin: EdgeInsets.only(top: top, bottom: top),
      child: CardItem(
        title1: data['title1'],
        title2: data['title2'],
        btnText: data['btnText'],
        img: data['img'],
        color: data['color'],
        marginVertical: active ? 17 : 12,
      ),
    );
  }
}
