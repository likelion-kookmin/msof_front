import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:msof_front/common/loading.dart';
import 'package:msof_front/common/msof_scaffold.dart';
import 'package:msof_front/models/question/question.dart';
import 'package:msof_front/pages/question/question_viewmodel.dart';
import 'package:msof_front/routes.dart';

class QuestionListPage extends HookWidget {
  const QuestionListPage({Key? key}) : super(key: key);

  Widget _buildQuestions(bool isLoading, List<Question>? questions) {
    if (isLoading) {
      return Loading();
    } else if (questions != null && questions.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          return ListTile(
            title: Text('${question.title}'),
            onTap: () {
              Routes.toNamed(
                context,
                Routes.questionDetail,
                pathParameters: {
                  Routes.question.pathParameterId: question.id,
                },
              );
            },
          );
        },
      );
    } else {
      return Center(
        child: Text('No question'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final questionViewModel = useProvider(questionViewModelProvider);

    useEffect(() {
      Future.microtask(() => questionViewModel.listQuestions());
    }, []);

    return MSOFScaffold(
      children: [
        ElevatedButton(
          onPressed: () {
            Routes.toNamed(context, Routes.questionCreate);
          },
          child: Text('Create'),
        ),
        _buildQuestions(
          questionViewModel.isLoading,
          questionViewModel.questions,
        ),
      ],
    );
  }
}
