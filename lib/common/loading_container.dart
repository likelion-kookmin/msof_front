import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/pages/loding_viewmodel.dart';

import 'loading.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      child,
      HookBuilder(
        builder: (context) {
          final loadingViewModel = useProvider(loadingViewModelProvider);
          return loadingViewModel.isLoading
              ? const Loading()
              : const SizedBox();
        },
      ),
    ]);
  }
}
