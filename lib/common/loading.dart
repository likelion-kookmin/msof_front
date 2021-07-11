import 'package:flutter/material.dart';
import 'package:msof_front/color.dart';

class Loading extends StatelessWidget {
  final Color? color;

  const Loading({this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? likelionOrangePrimary,
        ),
      ),
    );
  }
}
