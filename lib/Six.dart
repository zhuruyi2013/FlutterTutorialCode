import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyApp extends StatelessWidget {
//  Widget buildRow() =>
//      Row(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: <Widget>[
//          Expanded(
//            child: Image.asset('images/pic1.jpg'),
//          ),
//          Expanded(
//            flex: 2,
//            child: Image.asset('images/pic2.jpg'),
//          ),
//          Expanded(
//            child: Image.asset('images/pic3.jpg'),
//          ),
//        ],
//      );
//
//  Widget buildColumn() =>
//      // #docregion Column
//  Column(
//    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//    children: [
//      Image.asset('images/pic1.jpg'),
//      Image.asset('images/pic2.jpg'),
//      Image.asset('images/pic3.jpg'),
//    ],
//  );

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Flutter layout demo',
        home: buildHomePage('Strawberry Pavlova Recipe'),
      );
  }

  Widget buildHomePage(String title) {
    final titleText = Container(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'Strawberry Pavlova',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 25.0,
        ),
      ),
    );

    final subTitle = Text(
      'Pavlova is a meringue-based dessert named after the Russian ballerina '
          'Anna Pavlova. Pavlova features a crisp crust and soft, light inside, '
          'topped with fruit and whipped cream.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Georgia',
        fontSize: 10.0,
      ),
    );

    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.black),
        Icon(Icons.star, color: Colors.black),
      ],
    );

    final ratings = Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          stars,
          Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20.0,
            ),
          )
        ],
      ),
    );

    final descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 10.0,
      height: 1.0,
    );

    // DefaultTextStyle.merge() allows you to create a default text
    // style that is inherited by its child and all subsequent children.
    final iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.green[500]),
                Text('PREP:'),
                Text('25 min'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.timer, color: Colors.green[500]),
                Text('COOK:'),
                Text('1 hr'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.green[500]),
                Text('FEEDS:'),
                Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    final leftColumn = Container(
      padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: Column(
        children: [
          titleText,
          subTitle,
          ratings,
          iconList,
        ],
      ),
    );

    final mainImage = Image.asset(
      'images/pavlova.jpg',
      fit: BoxFit.scaleDown,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      // #docregion body
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
          height: 600.0,
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 440.0,
                  child: leftColumn,
                ),
                Expanded(child: Center(child: mainImage,))
              ],
            ),
          ),
        ),
      ),
      // #enddocregion body
    );
  }
}

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}
