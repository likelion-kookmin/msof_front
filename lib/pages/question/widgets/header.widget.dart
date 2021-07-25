import 'package:flutter/material.dart';
import 'package:msof_front/routes.dart';

class QuestionListHeader extends StatelessWidget {
  const QuestionListHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '질문 목록',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Routes.toNamed(context, Routes.questionCreate);
          },
          child: Text('질문하기'),
        ),
      ],
    );
  }
}
