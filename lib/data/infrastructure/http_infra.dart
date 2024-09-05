import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio getDio() {
  final dioOptions = BaseOptions(contentType: "application/json");

  final dio = Dio(dioOptions);

  dio.interceptors.add(PrettyDioLogger(
    request: true,
    requestHeader: true,
    requestBody: true,
    responseHeader: false,
    responseBody: true,
    error: true,
    maxWidth: 90,
    enabled: kDebugMode,
  ));

  return dio;
}
