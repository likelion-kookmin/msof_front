import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zefyrka/zefyrka.dart';

import 'package:msof_front/api/api_client.dart';
import 'package:msof_front/common/loading.dart';
import 'package:msof_front/common/msof_scaffold.dart';
import 'package:msof_front/pages/auth_viewmodel.dart';
import 'package:msof_front/pages/question/question_viewmodel.dart';
import 'package:msof_front/pages/question/widgets/text_editor.dart';
import 'package:msof_front/routes.dart';

class QuestionDetail extends StatefulHookWidget {
  final int questionId;

  const QuestionDetail({Key? key, required this.questionId}) : super(key: key);

  @override
  _QuestionDetailState createState() => _QuestionDetailState();
}

class _QuestionDetailState extends State<QuestionDetail> {
  ZefyrController? contentController;

  @override
  void dispose() {
    contentController?.dispose();
    super.dispose();
  }

  Widget _buildButton(context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Routes.toNamed(
                context,
                Routes.questionUpdate,
                pathParameters: {
                  Routes.question.pathParameterId: widget.questionId,
                },
              );
            },
            child: Text('Edit'),
          ),
          SizedBox(
            width: 5,
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .read(questionViewModelProvider)
                  .deleteQuestion(widget.questionId)
                  .then(
                    (value) => Routes.toNamed(
                      context,
                      Routes.questionList,
                    ),
                  );
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = useProvider(authViewModelProvider);
    final dio = useProvider(dioProvider);
    authViewModel.configAuthorizationHeader(dio);
    final questionViewModel = useProvider(questionViewModelProvider);

    final focusNode = useFocusNode();
    final scrollController = useScrollController();

    // Fetch question
    useEffect(() {
      Future.microtask(() {
        questionViewModel.detailQuestion(widget.questionId).then((value) {
          final question = questionViewModel.question!;
          contentController = ZefyrController(
              NotusDocument.fromJson(jsonDecode(question.content ?? '')));
          setState(() {});
        });
      });
    }, []);

    final question = questionViewModel.question;

    return MSOFScaffold(
      children: questionViewModel.isLoading || contentController == null
          ? [Loading()]
          : question == null
              ? [Center(child: Text('No question'))]
              : [
                  ListView(
                    shrinkWrap: true,
                    controller: scrollController,
                    children: [
                      _buildButton(context),
                      Text(
                        '${question.title}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 12),
                      ...question
                          .toJson()
                          .entries
                          // .where((entry) =>
                          // !['title', 'content'].contains(entry.key))
                          .map((entry) => Text('${entry.key}: ${entry.value}'))
                          .toList(),
                      SizedBox(height: 12),
                      TextEditor(
                        controller: contentController!,
                        focusNode: focusNode,
                        readOnly: true,
                        scrollController: scrollController,
                      ),
                    ],
                  ),
                ],
    );
  }
}
