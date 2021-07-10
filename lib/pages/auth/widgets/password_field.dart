import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordField extends StatelessWidget {
  final bool autofocus;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  PasswordField({
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
      obscureText: true,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: '비밀번호',
        hintText: '비밀번호를 입력해주세요.',
      ),
      validator: validator,
      inputFormatters: inputFormatters,
    );
  }
}
