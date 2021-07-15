import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;

final dioProvider = Provider((ref) => ApiClient.getDefaultDio());

final apiClientProvider =
    Provider.autoDispose.family<ApiClient, String>((ref, baseUrl) {
  final dio = ref.read(dioProvider);
  return ApiClient(baseUrl, dio);
});

class ApiClient {
  final String baseUrl;

  final Dio _dio;

  final List<Interceptor>? interceptors;

  ApiClient(
    this.baseUrl,
    Dio? dio, {
    this.interceptors,
  }) : _dio = dio ?? getDefaultDio() {
    _dio
      ..options.baseUrl = baseUrl
      ..interceptors.addAll(interceptors ?? []);
  }

  static Dio getDefaultDio() {
    final dio = Dio()
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.contentType = Headers.formUrlEncodedContentType
      ..options.headers.addAll({'Accept-Language': 'ko-KR'});
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          responseBody: false,
          error: false,
          requestHeader: false,
          responseHeader: false,
          request: false,
          requestBody: false,
        ),
      );
    }
    return dio;
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (_) {
      throw FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> patch(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (_) {
      throw FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(
    String uri, {
    data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await _dio.delete(
        uri,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on FormatException catch (_) {
      throw FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }
}
