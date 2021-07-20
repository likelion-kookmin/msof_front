import 'package:flutter/material.dart';

class QuestionStatisticItemWidget extends StatelessWidget {
  final String category;
  final int count;
  const QuestionStatisticItemWidget({
    Key? key,
    required this.category,
    required this.count
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Column(
        children: [
          Text(
            '$count',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 17,
            ),
          ),
          Text(
            '$category',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 10,
            ),
          ),
        ]
      ),
    );
  }
}