import 'package:dio/dio.dart';
import 'package:news_app/core/constant_helper.dart';

class ApiHelper {
  static BaseOptions opts = BaseOptions(
    baseUrl: ConstantHelper.baseUrl,
    responseType: ResponseType.json,
    connectTimeout: const Duration(milliseconds: 30000),
    receiveTimeout: const Duration(milliseconds: 30000),
  );

  Dio createDio() {
    return Dio(opts);
  }



}