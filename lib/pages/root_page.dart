import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/common/loading.dart';
import 'package:msof_front/pages/auth_viewmodel.dart';
import 'package:msof_front/routes.dart';

/// Auth route와 Non Auth route 분기
class RootPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useProvider(authViewModelProvider);
    Future.microtask(() {
      if (context.read(authViewModelProvider).isAuthenticated) {
        Navigator.pushReplacementNamed(context, Routes.home);
      } else {
        Navigator.pushReplacementNamed(context, Routes.login);
      }
    });
    return Loading();
  }
}
