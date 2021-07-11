import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../api/api_exceptions.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success({required T data}) = Success<T>;

  const factory Result.failure({required ApiExceptions error}) = Failure<T>;

  static Result<T> guard<T>(T Function() body) {
    try {
      return Result.success(data: body());
    } on Exception catch (e) {
      return Result.failure(error: ApiExceptions.getDioException(e));
    }
  }

  static Future<Result<T>> guardFuture<T>(Future<T> Function() future) async {
    try {
      return Result.success(data: await future());
    } on Exception catch (e) {
      return Result.failure(error: ApiExceptions.getDioException(e));
    }
  }
}
