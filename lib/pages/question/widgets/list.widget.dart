import 'package:flutter/material.dart';
import 'package:msof_front/models/question/question.dart';
import 'package:msof_front/common/loading.dart';
import 'package:msof_front/pages/question/widgets/list_item.widget.dart';

class QuestionListWidget extends StatelessWidget {
  final bool isLoading;
  final List<Question> questions;

  QuestionListWidget({
    Key? key,
    this.isLoading = true,
    required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Loading();
    } else if (questions.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Column(children: [
            if(index == 0) Divider(
              thickness: 0.5,
            ),
            QuestionListItemWidget(question: questions[index]),
            Divider(
              thickness: 0.5,
            ),
          ]);
        },
      );
    } else {
      return Center(
        child: Text('No question'),
      );
    }
  }
}