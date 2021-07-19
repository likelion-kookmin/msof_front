import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/models/question/question.dart';
import 'package:msof_front/models/response/response.dart';
import 'package:msof_front/models/result.dart';
import 'package:msof_front/api/api_client.dart';
import 'package:msof_front/api/api_exceptions.dart';
import 'package:msof_front/constants.dart';

final questionApiProvider =
    Provider.autoDispose<QuestionAPI>((ref) => QuestionAPI(ref.read));

abstract class AbstractQuestionAPI {
  Future<Result<MSOFResponse<Question>>> create(String title, String content);
  Future<Result<MSOFResponse>> delete(int id);
  Future<Result<MSOFResponse<Question>>> detail(int id);
  Future<Result<MSOFResponse<QuestionList>>> list();
  Future<Result<MSOFResponse<void>>> update(
      int id, String title, String content);
}

class QuestionAPI extends AbstractQuestionAPI {
  final ApiClient _client;
  static final _baseUrl = '${Constants.of().baseApiUrl}/question';

  QuestionAPI(Reader read) : _client = read(apiClientProvider(_baseUrl));

  @override
  Future<Result<MSOFResponse<Question>>> create(
      String title, String content) async {
    try {
      final response = await _client.post('/new/',
          data: FormData.fromMap({
            'title': title,
            'content': content,
          }));
      final question = MSOFResponse<Question>.fromJson(
        response,
        fromJsonT: Question.fromJsonT,
      );
      return Result.success(data: question);
    } catch (e) {
      return Result.failure(error: ApiExceptions.getDioException(e));
    }
  }

  @override
  Future<Result<MSOFResponse<void>>> delete(int id) async {
    try {
      final response = await _client.delete('/$id/destroy/');
      final result = MSOFResponse<void>.fromJson(
        response,
        fromJsonT: (_) {},
      );
      return Result.success(data: result);
    } catch (e) {
      return Result.failure(error: ApiExceptions.getDioException(e));
    }
  }

  @override
  Future<Result<MSOFResponse<Question>>> detail(int id) async {
    try {
      final response = await _client.get('/$id/');
      final question = MSOFResponse<Question>.fromJson(
        response,
        fromJsonT: Question.fromJsonT,
      );
      return Result.success(data: question);
    } catch (e) {
      return Result.failure(error: ApiExceptions.getDioException(e));
    }
  }

  @override
  Future<Result<MSOFResponse<QuestionList>>> list() async {
    try {
      final response = await _client.get('/');
      final questions = MSOFResponse<QuestionList>.fromJson(
        response,
        fromJsonT: QuestionList.fromJsonT,
      );
      return Result.success(data: questions);
    } catch (e) {
      return Result.failure(error: ApiExceptions.getDioException(e));
    }
  }

  @override
  Future<Result<MSOFResponse<void>>> update(
      int id, String title, String content) async {
    try {
      final response = await _client.patch('/$id/edit/',
          data: jsonEncode({
            'title': title,
            'content': content,
          }));
      final result = MSOFResponse<void>.fromJson(
        response,
        fromJsonT: (_) {},
      );
      return Result.success(data: result);
    } catch (e) {
      return Result.failure(error: ApiExceptions.getDioException(e));
    }
  }
}
