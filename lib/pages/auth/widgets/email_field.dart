import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailField extends StatelessWidget {
  final bool autofocus;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  EmailField({
    required this.controller,
    this.autofocus = false,
    this.validator,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      controller: controller,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: '이메일',
        hintText: '이메일을 입력해주세요.',
      ),
      validator: validator,
      inputFormatters: inputFormatters,
    );
  }
}
