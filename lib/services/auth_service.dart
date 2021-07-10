import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/api/api_exceptions.dart';
import 'package:msof_front/api/auth_api.dart';
import 'package:msof_front/models/user/user.dart';
import 'package:msof_front/models/user/user_create.dart';
import 'package:msof_front/services/local_storage_service.dart';

final authServiceProvider = ChangeNotifierProvider<AuthService>((ref) {
  final authApi = ref.read(authApiProvider);
  final localStorageService = ref.read(localStorageServiceProvider);

  return AuthService(
    ref.read,
    authApi: authApi,
    localStorageService: localStorageService,
  );
});

/// 유저 정보 저장 및 API 호출 제공 서비스
class AuthService extends ChangeNotifier {
  final Reader read;

  final AuthAPI _authApi;
  final LocalStorageService _localStorageService;

  /// Local storage에 저장되는 키 값
  final userBoxKey = 'tokenUser';

  AuthService(
    this.read, {
    required AuthAPI authApi,
    required LocalStorageService localStorageService,
  })  : _authApi = authApi,
        _localStorageService = localStorageService;

  final _errorMsgStream = StreamController<String>.broadcast();

  TokenUser? _user;

  bool get isAuthenticated => _user != null;
  TokenUser? get user => _user;
  Stream<String> get errorMsgStream => _errorMsgStream.stream;

  /// Json 형식으로 User 저장
  Future<void> saveUser(TokenUser? user) async {
    _user = user;
    if (user == null) {
      _localStorageService.delete(BoxName.auth, userBoxKey);
    } else {
      await _localStorageService.put(BoxName.auth, userBoxKey, user.toJson());
    }
    notifyListeners();
  }

  /// Json 형식으로 저장된 User를 TokenUser 객체로 변환
  void loadUser() {
    final userJson = _localStorageService.get(BoxName.auth, userBoxKey);
    if (userJson == null) {
      _user = null;
    } else {
      _user = TokenUser.fromJson(userJson);
    }
  }

  /// Form error 처리
  void pushError(String errorMsg) {
    _errorMsgStream.add(errorMsg);
  }

  /// Form error 초기화
  void clearError() {
    _errorMsgStream.add('');
  }

  /// 로그인
  Future<void> signin(username, password) {
    clearError();
    return _authApi.signin(username, password).then(
          (result) => result.maybeWhen(
            success: (user) async {
              await saveUser(user);
            },
            failure: (error) {
              pushError(ApiExceptions.getErrorMessage(error));
            },
            orElse: () {},
          ),
        );
  }

  /// 회원가입
  Future<void> signup(UserCreate user, String password1, String password2) {
    clearError();
    return _authApi.signup(user, password1, password2).then(
          (result) => result.maybeWhen(
            success: (user) async {
              await saveUser(user);
            },
            failure: (error) {
              pushError(ApiExceptions.getErrorMessage(error));
            },
            orElse: () {},
          ),
        );
  }

  /// 로그아웃
  Future<void> logout() {
    return _authApi.signout().then((_) async {
      if (_user != null) {
        await saveUser(null);
      }
    });
  }
}
