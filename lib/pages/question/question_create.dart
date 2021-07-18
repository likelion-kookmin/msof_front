import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zefyrka/zefyrka.dart';

import 'package:msof_front/api/api_client.dart';
import 'package:msof_front/common/loading.dart';
import 'package:msof_front/common/msof_scaffold.dart';
import 'package:msof_front/pages/auth_viewmodel.dart';
import 'package:msof_front/pages/question/widgets/text_editor.dart';
import 'package:msof_front/routes.dart';

import 'widgets/widgets.dart';
import 'question_viewmodel.dart';

class QuestionCreatePage extends StatefulHookWidget {
  final int? questionId;

  const QuestionCreatePage({Key? key, this.questionId}) : super(key: key);

  @override
  _QuestionCreatePageState createState() => _QuestionCreatePageState();
}

class _QuestionCreatePageState extends State<QuestionCreatePage> {
  ZefyrController? contentController;

  @override
  void dispose() {
    contentController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = useProvider(authViewModelProvider);
    final dio = useProvider(dioProvider);
    authViewModel.configAuthorizationHeader(dio);
    final questionViewModel = useProvider(questionViewModelProvider);

    final titleFocusNode = useFocusNode();
    final titleController = useTextEditingController();
    final focusNode = useFocusNode();
    final scrollController = useScrollController();

    // Fetch question
    useEffect(() {
      if (widget.questionId != null) {
        Future.microtask(() {
          questionViewModel.detailQuestion(widget.questionId!).then((value) {
            final question = questionViewModel.question!;
            titleController.text = question.title ?? '';
            contentController = ZefyrController(
                NotusDocument.fromJson(jsonDecode(question.content ?? '')));
            setState(() {});
          });
        });
      } else {
        contentController = ZefyrController();
        setState(() {});
      }
    }, []);

    return MSOFScaffold(
      children: questionViewModel.isLoading && contentController == null
          ? [Loading()]
          : [
              ListView(
                shrinkWrap: true,
                controller: scrollController,
                children: [
                  TextFormField(
                    controller: titleController,
                    focusNode: titleFocusNode,
                    decoration: InputDecoration(
                      hintText: 'Title',
                    ),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(height: 12),
                  TextEditor(
                    controller: contentController!,
                    focusNode: focusNode,
                    readOnly: false,
                    scrollController: scrollController,
                  ),
                  SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () async {
                      final title = titleController.text;
                      final content = jsonEncode(
                        contentController!.document.toDelta().toJson(),
                      );
                      if (widget.questionId != null) {
                        await questionViewModel.updateQuestion(
                            widget.questionId!, title, content);
                        Routes.toNamed(
                          context,
                          Routes.questionDetail,
                          pathParameters: {
                            Routes.question.pathParameterId: widget.questionId,
                          },
                          replaceCurrent: true,
                        );
                      } else {
                        await questionViewModel.createQuestion(title, content);
                        Routes.toNamed(
                          context,
                          Routes.questionList,
                          replaceCurrent: true,
                        );
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ],
    );
  }
}
