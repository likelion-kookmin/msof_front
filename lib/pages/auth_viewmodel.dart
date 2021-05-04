import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/api/api_exceptions.dart';
import 'package:msof_front/api/auth_api.dart';
import 'package:msof_front/models/user/user.dart';
import 'package:msof_front/models/user/user_create.dart';

final authViewModelProvider = ChangeNotifierProvider(
  (ref) => AuthViewModel(
    ref.read(authApiProvider),
  ),
);

class AuthViewModel extends ChangeNotifier {
  AuthViewModel(this.api);

  final AuthAPI api;

  String? _errorMsg;
  User? _user;

  bool get isAuthenticated => _user != null;
  User? get user => _user;
  String get errorMsg => _errorMsg ?? '';

  void notifyError(String errorMsg) {
    _errorMsg = errorMsg;
    notifyListeners();
  }

  Future<void> login(String username, String password) {
    return api.signin(username, password).then(
          (result) => result.maybeWhen(
            success: (user) {
              _user = user;
              notifyListeners();
            },
            failure: (error) {
              notifyError(ApiExceptions.getErrorMessage(error));
            },
            orElse: () {},
          ),
        );
  }

  Future<void> logout() {
    return api
        .signout()
        .then((_) => _user = null)
        .whenComplete(notifyListeners);
  }

  Future<void> signup(UserCreate user, String password1, String password2) {
    return api.signup(user, password1, password2).then(
          (result) => result.maybeWhen(
            success: (user) {
              _user = user;
              notifyListeners();
            },
            failure: (error) {
              throw error;
            },
            orElse: () {},
          ),
        );
  }
}
