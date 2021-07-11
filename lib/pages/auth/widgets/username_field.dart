import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UsernameField extends StatelessWidget {
  final bool autofocus;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  UsernameField({
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
        labelText: '사용자 이름',
        hintText: '사용자 이름을 입력해주세요.',
      ),
      validator: validator,
      inputFormatters: inputFormatters,
    );
  }
}
