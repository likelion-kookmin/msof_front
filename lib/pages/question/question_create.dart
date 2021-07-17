import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:msof_front/api/api_client.dart';
import 'package:msof_front/common/loading.dart';
import 'package:msof_front/common/msof_scaffold.dart';
import 'package:msof_front/pages/auth_viewmodel.dart';
import 'package:msof_front/pages/question/widgets/text_editor.dart';
import 'package:msof_front/routes.dart';
import 'package:msof_front/utils/screen_size_util.dart';

import 'widgets/widgets.dart';
import 'question_viewmodel.dart';

class QuestionCreatePage extends StatefulHookWidget {
  final int? questionId;

  const QuestionCreatePage({Key? key, this.questionId}) : super(key: key);

  @override
  _QuestionCreatePageState createState() => _QuestionCreatePageState();
}

class _QuestionCreatePageState extends State<QuestionCreatePage> {
  QuillController? quillController;

  @override
  void dispose() {
    quillController!.dispose();
    super.dispose();
  }

  Widget _buildTextEditor(focusNode) {
    final size = MediaQuery.of(useContext()).size;

    return Container(
      height: size.height * 0.4,
      child: TextEditor(
        controller: quillController!,
        focusNode: focusNode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = useProvider(authViewModelProvider);
    final dio = useProvider(dioProvider);
    authViewModel.configAuthorizationHeader(dio);

    final questionViewModel = useProvider(questionViewModelProvider);

    final titleFocusNode = useFocusNode();
    final contentFocusNode = useFocusNode();

    final titleController = useTextEditingController();

    useIsMounted();

    if (quillController == null) {
      if (widget.questionId != null) {
        titleController.text = questionViewModel.question!.title ?? '';

        final document = Document.fromJson(
            jsonDecode(questionViewModel.question!.content ?? ''));
        quillController = QuillController(
          document: document,
          selection: TextSelection.collapsed(offset: 0),
        );
      } else {
        quillController = QuillController.basic();
      }
    }

    return MSOFScaffold(
      children: questionViewModel.isLoading
          ? [Loading()]
          : [
              Container(
                constraints: BoxConstraints(maxWidth: ScreenSizeUtil.desktop),
                child: Column(
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
                    _buildTextEditor(contentFocusNode),
                    SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () async {
                        final title = titleController.text;
                        final content = jsonEncode(
                          quillController!.document.toDelta().toJson(),
                        );
                        if (widget.questionId != null) {
                          await questionViewModel.updateQuestion(
                              widget.questionId!, title, content);
                          Routes.toNamed(context, Routes.questionDetail,
                              pathParameters: {
                                Routes.question.pathParameterId:
                                    widget.questionId,
                              });
                        } else {
                          await questionViewModel.createQuestion(
                              title, content);
                          Routes.toNamed(context, Routes.questionList);
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ],
    );
  }
}
