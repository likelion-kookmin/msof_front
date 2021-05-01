import 'package:flutter/material.dart';
import 'package:msof_front/color.dart';

class Loading extends StatelessWidget {
  const Loading();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          likelionOrangePrimary,
        ),
      ),
    );
  }
}
