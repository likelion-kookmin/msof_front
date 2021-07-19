import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/models/result.dart';
import 'package:msof_front/api/api_client.dart';
import 'package:msof_front/api/api_exceptions.dart';
import 'package:msof_front/constants.dart';
import 'package:msof_front/models/user/user.dart';

final authApiProvider =
    Provider.autoDispose<AuthAPI>((ref) => AuthAPI(ref.read));

abstract class AbstractAuthAPI {
  Future<Result<TokenUser>> signin(String username, String password);
  Future<void> signout();
  Future<Result<TokenUser>> signup(
      UserCreate user, String password1, String password2);
}

class AuthAPI extends AbstractAuthAPI {
  final ApiClient _client;
  static final _baseUrl = '${Constants.of().baseApiUrl}/accounts/rest-auth';

  AuthAPI(Reader read) : _client = read(apiClientProvider(_baseUrl));

  @override
  Future<Result<TokenUser>> signin(String username, String password) async {
    try {
      final response = await _client.post('/login/', data: {
        'username': username,
        'password': password,
      });
      final responseUser = TokenUser.fromJson(response);
      return Result.success(data: responseUser);
    } catch (e) {
      return Result.failure(error: ApiExceptions.getDioException(e));
    }
  }

  @override
  Future<Result<void>> signout() async {
    try {
      await _client.post('/logout/');
      return Result.success(data: null);
    } catch (e) {
      return Result.failure(error: ApiExceptions.getDioException(e));
    }
  }

  @override
  Future<Result<TokenUser>> signup(
      UserCreate user, String password1, String password2) async {
    try {
      final data = user.toJson();
      data.addAll({
        'password1': password1,
        'password2': password2,
      });
      final response = await _client.post('/registration/', data: data);
      final responseUser = TokenUser.fromJson(response);
      return Result.success(data: responseUser);
    } catch (e) {
      final exception = ApiExceptions.getDioException(e);
      if (exception == ApiExceptions.unauthorisedRequest()) {
        // 중복된 사용자 이름, 이메일 에러 처리
        if (e is DioError && e.response!.data is Map) {
          final responseData = e.response!.data as Map;
          var errorMessage = '';
          responseData.forEach((key, value) {
            errorMessage += '\n${value.toString()}\n';
          });
          errorMessage = errorMessage.replaceAll('[', '');
          errorMessage = errorMessage.replaceAll(']', '');
          return Result.failure(
            error: ApiExceptions.defaultError(errorMessage.trim()),
          );
        }
      }
      return Result.failure(error: exception);
    }
  }
}
