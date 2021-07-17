import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:msof_front/utils/logger.dart';

import 'text_editor_content.dart';
import 'text_editor_toolbar.dart';

class TextEditor extends StatelessWidget {
  final double? height;
  final bool readOnly;
  final QuillController controller;
  final FocusNode focusNode;

  const TextEditor({
    Key? key,
    this.height,
    this.readOnly = false,
    required this.controller,
    required this.focusNode,
  }) : super(key: key);

  void _formatSection(String attribute) {
    late final attributeObj;

    switch (attribute) {
      case 'bold':
        attributeObj = Attribute.bold;
        break;
      case 'italic':
        attributeObj = Attribute.italic;
        break;
      case 'underline':
        attributeObj = Attribute.underline;
        break;
    }

    if (controller.getSelectionStyle().attributes.keys.contains(attribute)) {
      controller.formatSelection(Attribute.clone(attributeObj, null));
    } else {
      controller.formatSelection(attributeObj);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      height: height ?? size.height * 0.4,
      child: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: readOnly
            ? null
            : (event) {
                if (event.data.isControlPressed) {
                  if (event.character != null) {
                    final character = event.character!.toLowerCase();
                    logger.d(character);
                    if (character == 'b') {
                      _formatSection('bold');
                    } else if (character == 'i') {
                      _formatSection('italic');
                    } else if (character == 'u') {
                      _formatSection('underline');
                    }
                  }
                }
              },
        child: Scaffold(
          appBar: readOnly
              ? null
              : TextEditorToolbar(
                  controller: controller,
                ),
          body: TextSelectionTheme(
            data: TextSelectionThemeData(
              cursorColor: readOnly ? Colors.white : null,
            ),
            child: TextEditorContent(
              controller: controller,
              focusNode: focusNode,
              hintText: '',
              readOnly: readOnly,
            ),
          ),
        ),
      ),
    );
  }
}
