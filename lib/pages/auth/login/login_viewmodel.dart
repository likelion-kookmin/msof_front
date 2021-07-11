import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/models/user/user.dart';
import 'package:msof_front/pages/auth_viewmodel.dart';
import 'package:msof_front/utils/loading_notifier_mixin.dart';

final loginViewModelProvider =
    ChangeNotifierProvider.autoDispose<LoginViewModel>((ref) {
  // dispose -> dio 요청 취소
  final cancelToken = CancelToken();
  ref.onDispose(() => cancelToken.cancel());

  final authViewModel = ref.watch(authViewModelProvider);
  return LoginViewModel(authViewModel);
});

class LoginViewModel extends LoadingNotifierMixin {
  final AuthViewModel authViewModel;

  LoginViewModel(this.authViewModel);

  bool get isAuthenticated => authViewModel.isAuthenticated;
  TokenUser? get user => authViewModel.user;
  Stream<String> get errorMsgStream => authViewModel.errorMsgStream;

  Future<void> login(String username, String password) =>
      whileLoading(() => authViewModel.signin(username, password));
}
