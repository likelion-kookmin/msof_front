import 'package:flutter/material.dart';
import 'package:msof_front/common/mouse_hover.dart';
import 'package:msof_front/routes.dart';

class QuestionListItemTitleWidget extends StatelessWidget {
  final String title;
  final int id;
  const QuestionListItemTitleWidget(
      {Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseHover(
      opacityAnimation: false,
      child: GestureDetector(
        onTap: () {
          Routes.toNamed(
            context,
            Routes.questionDetail,
            pathParameters: {
              Routes.question.pathParameterId: id,
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            '$title',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.orange[600],
            ),
          ),
        ),
      ),
    );
  }
}
