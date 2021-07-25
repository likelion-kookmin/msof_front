import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/models/question/question.dart';
import 'package:msof_front/models/result.dart';
import 'package:msof_front/api/api_client.dart';
import 'package:msof_front/api/api_exceptions.dart';
import 'package:msof_front/constants.dart';

final questionApiProvider =
    Provider.autoDispose<QuestionAPI>((ref) => QuestionAPI(ref.read));

abstract class AbstractQuestionAPI {
  Future<Result<Question>> create(String title, String content);
  Future<Result<void>> delete(int id);
  Future<Result<Question>> detail(int id);
  Future<Result<QuestionList>> list();
  Future<Result<Question>> update(int id, String title, String content);
}

class QuestionAPI extends AbstractQuestionAPI {
  final ApiClient _client;
  static final _baseUrl = '${Constants.of().baseApiUrl}/questions';

  QuestionAPI(Reader read) : _client = read(apiClientProvider(_baseUrl));

  @override
  Future<Result<Question>> create(String title, String content) async {
    try {
      final response = await _client.post('/new/',
          data: FormData.fromMap({
            'title': title,
            'content': content,
          }));
      final question = Question.fromJsonT(response);
      return Result.success(data: question);
    } catch (e) {
      return Result.failure(error: ApiExceptions.getDioException(e));
    }
  }

  @override
  Future<Result<void>> delete(int id) async {
    try {
      final response = await _client.delete('/$id/destroy/');
      return Result.success(data: response);
    } catch (e) {
      return Result.failure(error: ApiExceptions.getDioException(e));
    }
  }

  @override
  Future<Result<Question>> detail(int id) async {
    try {
      final response = await _client.get('/$id/');
      final question = Question.fromJsonT(response);
      return Result.success(data: question);
    } catch (e) {
      return Result.failure(error: ApiExceptions.getDioException(e));
    }
  }

  @override
  Future<Result<QuestionList>> list() async {
    try {
      final response = await _client.get('/');
      final questions = QuestionList.fromJsonT(response);
      return Result.success(data: questions);
    } catch (e) {
      return Result.failure(error: ApiExceptions.getDioException(e));
    }
  }

  @override
  Future<Result<Question>> update(int id, String title, String content) async {
    try {
      final response = await _client.patch('/$id/edit/',
          data: jsonEncode({
            'title': title,
            'content': content,
          }));
      final question = Question.fromJsonT(response);
      return Result.success(data: question);
    } catch (e) {
      return Result.failure(error: ApiExceptions.getDioException(e));
    }
  }
}
