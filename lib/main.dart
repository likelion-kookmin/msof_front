import 'package:flutter/material.dart';
import 'package:msof_front/color.dart';
import 'package:msof_front/pages/home/home_page.dart';

void main() {
  runApp(MSOF());
}

class MSOF extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MutstackOverflow',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        backgroundColor: Colors.white,
        cardColor: likelionOrange,
        primaryTextTheme: TextTheme(
          button: TextStyle(
            color: Colors.black87,
            decorationColor: Colors.black38,
          ),
          subtitle2: TextStyle(
            color: Colors.blueGrey[900],
          ),
          subtitle1: TextStyle(
            color: Colors.black87,
          ),
          headline1: TextStyle(color: Colors.blueGrey[800]),
        ),
        bottomAppBarColor: Colors.black87,
        iconTheme: IconThemeData(color: Colors.white),
        fontFamily: 'NotoSans',
      ),
      home: HomePage(),
    );
  }
}
