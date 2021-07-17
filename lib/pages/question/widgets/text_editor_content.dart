import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

import '../universal_ui/universal_ui.dart';

class TextEditorContent extends HookWidget {
  final QuillController controller;
  final FocusNode focusNode;
  final bool readOnly;
  final Widget? floatingActionButton;
  final DefaultStyles? customStyle;
  final String hintText;

  const TextEditorContent({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.readOnly = false,
    this.floatingActionButton,
    this.customStyle,
    this.hintText = 'Add content',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = useMemoized(
      () => DefaultStyles(),
    );

    final quillEditor = useMemoized(() {
      final contentPadding = const EdgeInsets.all(8);

      if (kIsWeb) {
        return QuillEditor(
          controller: controller,
          scrollController: ScrollController(),
          scrollable: true,
          focusNode: focusNode,
          autoFocus: false,
          readOnly: readOnly,
          showCursor: true,
          placeholder: hintText,
          expands: true,
          padding: contentPadding,
          customStyles: customStyle ?? defaultStyle,
          scrollPhysics: readOnly ? NeverScrollableScrollPhysics() : null,
          embedBuilder: defaultEmbedBuilderWeb,
        );
      } else {
        return QuillEditor(
          controller: controller,
          scrollController: ScrollController(),
          scrollable: true,
          focusNode: focusNode,
          autoFocus: false,
          readOnly: readOnly,
          showCursor: true,
          placeholder: hintText,
          expands: true,
          padding: contentPadding,
          customStyles: customStyle ?? defaultStyle,
          scrollPhysics: readOnly ? NeverScrollableScrollPhysics() : null,
        );
      }
    });

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: readOnly
          ? null
          : BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade200),
            ),
      child: quillEditor,
    );
  }
}
