import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/api/api_exceptions.dart';
import 'package:msof_front/api/auth_api.dart';
import 'package:msof_front/models/user/user.dart';
import 'package:msof_front/models/user/user_create.dart';
import 'package:msof_front/utils/loading_notifier_mixin.dart';
import 'package:msof_front/utils/logger.dart';

final signupViewModelProvider =
    ChangeNotifierProvider.autoDispose<SignupViewModel>((ref) {
  // dispose -> dio 요청 취소
  final cancelToken = CancelToken();
  ref.onDispose(() => cancelToken.cancel());

  final authApi = ref.read(authApiProvider);
  return SignupViewModel(
    ref.read,
    authApi: authApi,
  );
});

class SignupViewModel extends LoadingNotifierMixin {
  final Reader read;

  final AuthAPI authApi;

  SignupViewModel(
    this.read, {
    required this.authApi,
  });

  final _errorMsgStream = StreamController<String>.broadcast();

  TokenUser? _user;

  bool get isAuthenticated => _user != null;
  TokenUser? get user => _user;
  Stream<String> get errorMsgStream => _errorMsgStream.stream;

  void pushError(String errorMsg) {
    _errorMsgStream.add(errorMsg);
  }

  void clearError() {
    _errorMsgStream.add('');
  }

  Future<void> login(String username, String password) {
    clearError();
    return whileLoading(
      () => authApi.signin(username, password).then(
            (result) => result.maybeWhen(
              success: (user) {
                _user = user;
              },
              failure: (error) {
                pushError(ApiExceptions.getErrorMessage(error));
              },
              orElse: () {},
            ),
          ),
    );
  }

  Future<void> logout() {
    return whileLoading(
      () => authApi
          .signout()
          .then((_) => _user = null)
          .whenComplete(notifyListeners),
    );
  }

  Future<void> signup(UserCreate user, String password1, String password2) {
    clearError();
    return whileLoading(
      () => authApi.signup(user, password1, password2).then(
            (result) => result.maybeWhen(
              success: (user) {
                _user = user;
              },
              failure: (error) {
                logger.w(error);
                pushError(ApiExceptions.getErrorMessage(error));
              },
              orElse: () {},
            ),
          ),
    );
  }
}
