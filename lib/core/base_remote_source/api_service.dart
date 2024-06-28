import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:news_app/core/error/api_exception.dart';
import 'package:news_app/core/models/error_model.dart';

class BaseRemoteSource {
  final Dio _dio;
  BaseRemoteSource({required Dio dio}) : _dio = dio;

  Future<T> networkRequest<T>(
      {required Future<Response> Function(Dio dio) request,
      required T Function(dynamic data, Headers? headers) onResponse}) async {
    try {
      final response = await request(_dio);
      if (response.statusCode! >= 200 || response.statusCode! < 300) {
        return onResponse(response.data, response.headers);
      } else {
        throw const ApiException.serverException(
            message: "something went wrong");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        ErrorModel? errorModel;
        try {
          if (e.response?.data.runtimeType == String) {
            errorModel = ErrorModel.fromJson(jsonDecode(e.response?.data));
          } else {
            errorModel = ErrorModel.fromJson(jsonDecode(e.response?.data));
          }
        } catch (_) {}
      }
      throw e.error!;
    } catch (_) {
      throw const ApiException.serverException(message: "something went wrong");
    }
  }
}
