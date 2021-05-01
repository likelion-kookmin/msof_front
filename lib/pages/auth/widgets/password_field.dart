import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;

  PasswordField({
    required this.controller,
    this.validator,
    this.focusNode,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(labelText: 'password'),
      validator: validator,
      inputFormatters: inputFormatters,
    );
  }
}
