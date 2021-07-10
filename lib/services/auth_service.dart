import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/api/auth_api.dart';
import 'package:msof_front/models/user/user.dart';
import 'package:msof_front/utils/loading_notifier_mixin.dart';
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
class AuthService extends LoadingNotifierMixin {
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
  Future<void> saveUser(TokenUser user) async {
    _user = user;
    await _localStorageService.put(BoxName.auth, userBoxKey, user.toJson());
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

  /// 로그아웃
  Future<void> logout() {
    return whileLoading(
      () => _authApi.signout().then((_) {
        _user = null;
        _localStorageService.delete(BoxName.auth, userBoxKey);
      }).whenComplete(notifyListeners),
    );
  }
}
