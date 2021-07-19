import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/models/user/user.dart';
import 'package:msof_front/pages/auth_viewmodel.dart';
import 'package:msof_front/utils/loading_notifier_mixin.dart';

final signupViewModelProvider =
    ChangeNotifierProvider.autoDispose<SignupViewModel>((ref) {
  // dispose -> dio 요청 취소
  final cancelToken = CancelToken();
  ref.onDispose(() => cancelToken.cancel());

  final authViewModel = ref.watch(authViewModelProvider);
  return SignupViewModel(authViewModel);
});

class SignupViewModel extends LoadingNotifierMixin {
  final AuthViewModel authViewModel;

  SignupViewModel(this.authViewModel);

  bool get isAuthenticated => authViewModel.isAuthenticated;
  TokenUser? get user => authViewModel.user;
  Stream<String> get errorMsgStream => authViewModel.errorMsgStream;

  Future<void> signup(UserCreate user, String password1, String password2) =>
      whileLoading(() => authViewModel.signup(user, password1, password2));
}
