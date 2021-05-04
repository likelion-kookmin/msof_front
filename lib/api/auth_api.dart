import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/models/result.dart';
import 'package:msof_front/api/api_client.dart';
import 'package:msof_front/api/api_exceptions.dart';
import 'package:msof_front/constants.dart';
import 'package:msof_front/models/user/user.dart';
import 'package:msof_front/models/user/user_create.dart';

final authApiProvider = Provider<AuthAPI>((ref) => AuthAPI());

abstract class AbstractAuthAPI {
  Future<Result<User>> signin(String username, String password);
  Future<void> signout();
  Future<Result<User>> signup(
      UserCreate user, String password1, String password2);
}

class AuthAPI extends AbstractAuthAPI {
  late ApiClient _client;
  final _baseUrl = '${Constants.of().baseApiUrl}/rest-auth';

  AuthAPI() {
    _client = ApiClient(_baseUrl, Dio());
  }

  @override
  Future<Result<User>> signin(String username, String password) async {
    try {
      final response = await _client.post('/login/', data: {
        'username': username,
        'password': password,
      });
      return Result.success(data: response);
    } catch (e) {
      return Result.failure(error: ApiExceptions.getDioException(e));
    }
  }

  @override
  Future<Result<void>> signout() async {
    try {
      await _client.post('/logout/', data: {});
      return Result.success(data: null);
    } catch (e) {
      return Result.failure(error: ApiExceptions.getDioException(e));
    }
  }

  @override
  Future<Result<User>> signup(
      UserCreate user, String password1, String password2) async {
    try {
      final data = user.toJson();
      data.addAll({
        'password1': password1,
        'password2': password2,
      });
      final response = await _client.post('/registration/', data: data);
      return Result.success(data: response);
    } catch (e) {
      return Result.failure(error: ApiExceptions.getDioException(e));
    }
  }
}
