import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:msof_front/common/msof_scaffold.dart';
import 'package:msof_front/pages/question/question_viewmodel.dart';
import 'package:msof_front/pages/question/widgets/list.widget.dart';
import 'package:msof_front/routes.dart';

class QuestionListPage extends HookWidget {
  const QuestionListPage({Key? key}) : super(key: key);

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
        QuestionListWidget(
            isLoading: questionViewModel.isLoading,
            questions: questionViewModel.questions ?? []),
      ],
    );
  }
}
