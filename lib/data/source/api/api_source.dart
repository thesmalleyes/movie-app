import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

enum RequestType { post, put, delete, get }

const jsonContentType = Headers.jsonContentType;

@LazySingleton()
class ApiSource {
  final Dio _dio;

  ApiSource(this._dio);

  addInterception(Map<String, dynamic>? params) {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      RequestOptions newOptions = options;
      return handler.next(newOptions);
    }));
  }

  Future<Response> request(
    RequestType type,
    String url, {
    Map<String, dynamic>? params,
  }) async {
    addInterception(params);
    Response response;
    switch (type) {
      case RequestType.get:
        response = await _dio.get(url, queryParameters: params);
        break;
      case RequestType.delete:
        response = await _dio.delete(url, data: params);
        break;
      case RequestType.put:
        response = await _dio.put(url, data: params);
        break;
      default:
        response = await _dio.post(url, data: params);
    }
    return response;
  }
}
