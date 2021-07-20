
import 'package:flutter/material.dart';
import 'package:msof_front/models/question/question.dart';
import 'package:msof_front/pages/question/widgets/statistic_item.widget.dart';

class QuestionStatisticsWidget extends StatelessWidget {
  final Question question;
  const QuestionStatisticsWidget({ Key? key, required this.question }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QuestionStatisticItemWidget(
          category: 'views',
          count: question.viewed_count ?? 0,
        ),
        QuestionStatisticItemWidget(
          category: 'like',
          count: question.liked_count ?? 0,
        ),
        QuestionStatisticItemWidget(
          category: 'dislike',
          count: question.disliked_count ?? 0,
        ),
      ],
    );
  }
}
