import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:flutter_quill/widgets/simple_viewer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:msof_front/api/api_client.dart';
import 'package:msof_front/common/loading.dart';
import 'package:msof_front/common/msof_scaffold.dart';
import 'package:msof_front/models/question/question.dart';
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
  QuillController? quillController;

  @override
  void dispose() {
    quillController!.dispose();
    super.dispose();
  }

  List<Widget> _buildQuestion(focusNode, bool isLoading, Question? question) {
    final widget = <Widget>[];
    if (isLoading) {
      widget.add(Loading());
    } else if (question != null) {
      final title = question.title;
      final document = Document.fromJson(jsonDecode(question.content ?? ''));
      quillController = QuillController(
        document: document,
        selection: const TextSelection.collapsed(offset: 0),
      );

      final questionJson = question.toJson();
      questionJson.remove('title');
      questionJson.remove('content');

      widget.addAll(
        [
          Text(
            '$title',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 12),
          ...questionJson.entries
              .map((entry) => Text('${entry.key}: ${entry.value}'))
              .toList(),
          SizedBox(height: 12),
          TextEditor(
            height: 1000,
            controller: quillController!,
            focusNode: focusNode,
            readOnly: true,
          ),
        ],
      );
    } else {
      widget.add(Center(
        child: Text('No question'),
      ));
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = useProvider(authViewModelProvider);
    final dio = useProvider(dioProvider);
    authViewModel.configAuthorizationHeader(dio);

    final questionViewModel = useProvider(questionViewModelProvider);
    final focusNode = useFocusNode();

    useEffect(() {
      Future.microtask(
          () => questionViewModel.detailQuestion(widget.questionId));
    }, []);

    return MSOFScaffold(
      children: questionViewModel.isLoading
          ? [Loading()]
          : [
              Container(
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
                        questionViewModel
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
              ),
              ..._buildQuestion(
                focusNode,
                questionViewModel.isLoading,
                questionViewModel.question,
              ),
            ],
    );
  }
}
