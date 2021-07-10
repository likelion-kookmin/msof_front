import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/models/user/user.dart';
import 'package:msof_front/models/user/user_create.dart';
import 'package:msof_front/services/auth_service.dart';

final authViewModelProvider = ChangeNotifierProvider<AuthViewModel>((ref) {
  final authService = ref.watch(authServiceProvider);

  return AuthViewModel(
    authService,
  );
});

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService;

  AuthViewModel(
    this._authService,
  );

  bool get isAuthenticated => _authService.isAuthenticated;
  TokenUser? get user => _authService.user;
  Stream<String> get errorMsgStream => _authService.errorMsgStream;

  Future<void> saveUser(TokenUser user) async => _authService.saveUser(user);
  void loadUser() => _authService.loadUser();
  void pushError(String errorMsg) => _authService.pushError(errorMsg);
  void clearError() => _authService.clearError();
  Future<void> signin(username, password) =>
      _authService.signin(username, password);
  Future<void> signup(UserCreate user, String password1, String password2) =>
      _authService.signup(user, password1, password2);
  Future<void> logout() => _authService.logout();
}
