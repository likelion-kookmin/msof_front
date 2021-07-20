import 'package:flutter/material.dart';
import 'package:msof_front/routes.dart';

class QuestionTitleWidget extends StatelessWidget {
  final String title;
  final int id;
  const QuestionTitleWidget({ Key? key, required this.id, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}