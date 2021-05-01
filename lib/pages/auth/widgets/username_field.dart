import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;

  UsernameField({
    required this.controller,
    this.validator,
    this.focusNode,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(labelText: 'username'),
      validator: validator,
      inputFormatters: inputFormatters,
    );
  }
}
