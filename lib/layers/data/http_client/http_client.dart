import 'dart:async';

abstract class IHttpClient {
  Future<HttpResponse> get(HttpRequest request);

  Future<HttpResponse> post(HttpRequest request);

  Future<HttpResponse> put(HttpRequest request);

  Future<HttpResponse> delete(HttpRequest request);

  Future<HttpResponse> patch(HttpRequest request);
}

class HttpRequest {
  final String url;
  final dynamic body;

  HttpRequest(this.url, {this.body});
}

class HttpResponse {
  final int statusCode;
  final Map<String, dynamic> headers;
  final dynamic body;

  HttpResponse(this.statusCode, this.headers, this.body);
}
