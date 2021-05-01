import 'package:flutter/services.dart';

class ValidationMixin {
  final trimInputFormatter =
      FilteringTextInputFormatter.deny(RegExp(r'\s\b|\b\s'));

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return '* 필수 항목입니다.';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '* 필수 항목입니다.';
    } else if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    final minLength = 8;
    if (value!.length < minLength) {
      return '$minLength자리 이상 입력해주세요.';
    }
    return null;
  }
}
