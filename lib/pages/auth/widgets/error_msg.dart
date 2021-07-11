import 'package:flutter/material.dart';

class ErrorMsg extends StatelessWidget {
  ErrorMsg(this.msg);

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        msg,
        style: TextStyle(
          color: Colors.red[400],
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
