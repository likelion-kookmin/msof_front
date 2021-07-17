import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class TextEditorToolbar extends StatelessWidget with PreferredSizeWidget {
  final QuillController controller;
  final bool readOnly;
  final List<Widget> actions;

  const TextEditorToolbar({
    Key? key,
    required this.controller,
    this.readOnly = false,
    this.actions = const [],
  }) : super(key: key);

  Future<String> _onImagePickCallback(File file) async {
    // Copies the picked file from temporary cache to applications directory
    final appDocDir = await getApplicationDocumentsDirectory();
    final copiedFile =
        await file.copy('${appDocDir.path}/${basename(file.path)}');
    return copiedFile.path.toString();
  }

  Future<String?> _webImagePickImpl(
      OnImagePickCallback onImagePickCallback) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    late final toolbar;
    if (kIsWeb) {
      toolbar = QuillToolbar.basic(
        controller: controller,
        multiRowsDisplay: false,
        onImagePickCallback: _onImagePickCallback,
        webImagePickImpl: _webImagePickImpl,
        showBoldButton: true,
        showItalicButton: true,
        showUnderLineButton: true,
        showStrikeThrough: true,
        showColorButton: true,
        showBackgroundColorButton: true,
        showClearFormat: true,
        showHeaderStyle: true,
        showListNumbers: true,
        showListBullets: true,
        showListCheck: false,
        showCodeBlock: true,
        showQuote: true,
        showIndent: true,
        showLink: true,
        showHistory: false,
        showHorizontalRule: false,
        showCamera: false,
      );
    } else {
      toolbar = QuillToolbar.basic(
        controller: controller,
        multiRowsDisplay: false,
        showBoldButton: true,
        showItalicButton: true,
        showUnderLineButton: true,
        showStrikeThrough: true,
        showColorButton: true,
        showBackgroundColorButton: true,
        showClearFormat: true,
        showHeaderStyle: true,
        showListNumbers: true,
        showListBullets: true,
        showListCheck: true,
        showCodeBlock: true,
        showQuote: true,
        showIndent: true,
        showLink: true,
        showHistory: true,
        showHorizontalRule: false,
        showCamera: false,
      );
    }

    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).canvasColor,
      centerTitle: false,
      titleSpacing: 0,
      leading: null,
      title: toolbar,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
