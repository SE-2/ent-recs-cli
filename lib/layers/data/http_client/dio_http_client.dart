import 'dart:async';

import 'package:dio/dio.dart';

import 'http_client.dart';

class DioHttpClient implements IHttpClient {
  final Dio _dio;

  DioHttpClient({required String baseUrl, Duration? timeout})
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: timeout,
        )) {
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
  }

  @override
  Future<HttpResponse> get(HttpRequest request) async {
    final headers = {
      'Content-Type': 'application/json',
      'Token': request.token,
    };
    final response =
        await _dio.get(request.url, options: Options(headers: headers));
    return HttpResponse(
        response.statusCode ?? -1, response.headers.map, response.data);
  }

  @override
  Future<HttpResponse> post(HttpRequest request) async {
    final headers = {
      'Content-Type': 'application/json',
      'Token': request.token,
    };
    final response = await _dio.post(request.url,
        data: request.body, options: Options(headers: headers));
    return HttpResponse(
        response.statusCode ?? -1, response.headers.map, response.data);
  }

  @override
  Future<HttpResponse> put(HttpRequest request) async {
    final headers = {
      'Content-Type': 'application/json',
      'Token': request.token,
    };
    final response = await _dio.put(request.url,
        data: request.body, options: Options(headers: headers));
    return HttpResponse(
        response.statusCode ?? -1, response.headers.map, response.data);
  }

  @override
  Future<HttpResponse> delete(HttpRequest request) async {
    final headers = {
      'Content-Type': 'application/json',
      'Token': request.token,
    };
    final response = await _dio.delete(request.url,
        data: request.body, options: Options(headers: headers));
    return HttpResponse(
        response.statusCode ?? -1, response.headers.map, response.data);
  }

  @override
  Future<HttpResponse> patch(HttpRequest request) async {
    final headers = {
      'Content-Type': 'application/json',
      'Token': request.token,
    };
    final response = await _dio.patch(request.url,
        data: request.body, options: Options(headers: headers));
    return HttpResponse(
        response.statusCode ?? -1, response.headers.map, response.data);
  }
}
