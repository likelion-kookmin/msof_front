import 'package:flutter/material.dart';
import 'package:msof_front/models/question/question.dart';
import 'package:msof_front/pages/question/widgets/statistics.widget.dart';
import 'package:msof_front/pages/question/widgets/title.widget.dart';
import 'package:characters/characters.dart';


class QuestionListItemWidget extends StatelessWidget {
  final Question question;

  const QuestionListItemWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
      child: Row(
        children: [
          QuestionStatisticsWidget(question: question),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QuestionTitleWidget(
                id: question.id ?? -1,
                title: question.title ?? '',
              ),
              Text(
                '${question.content.toString().characters.take(30)}...',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



// ListTile(
//       title: Text('${question.title}'),
//       onTap: 
//     );
//   }