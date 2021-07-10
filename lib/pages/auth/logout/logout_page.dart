import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/common/loading.dart';
import 'package:msof_front/pages/auth_viewmodel.dart';

class LogoutPage extends HookWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = useProvider(authViewModelProvider);

    return FutureBuilder(
      future: authViewModel.logout(),
      builder: (context, snapshot) {
        return Loading();
      },
    );
  }
}
