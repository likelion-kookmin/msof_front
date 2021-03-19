import 'package:flutter/material.dart';
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
        fontFamily: 'NotoSans',
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}
