import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learner/common/utils/constants.dart';
import 'package:learner/global/global.dart';

class HttpUtil {
  late final Dio dio;
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() => _instance;

  HttpUtil._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: Appconstants.SERVER_API_URL,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        contentType: "application/json; charset=UTF-8",
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("➡️ Request: ${options.method} ${options.path}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print(" Response: ${response.statusCode} ${response.data}");
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print(" DioError: $e");
          final eInfo = createErrorEntity(e);
          onError(eInfo);
          handler.next(e);
        },
      ),
    );
  }

  Map<String, dynamic> getAuthorizationHeader() {
    final headers = <String, dynamic>{};
    final accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = "Bearer $accessToken";
    }
    return headers;
  }

  Future<dynamic> post({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final requestOptions = options ?? Options();
    requestOptions.headers ??= {};
    requestOptions.headers!.addAll(getAuthorizationHeader());

    print("📡 Sending POST to $path");

    final response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    print("✅ Response Data: ${response.data}");
    return response.data;
  }
}

class ErrorEntity implements Exception {
  final int code;
  final String message;

  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    return "Exception: code=$code, message=$message";
  }
}

ErrorEntity createErrorEntity(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: "Connection timed out");
    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: -1, message: "Send timed out");
    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: "Receive timed out");
    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: "Bad SSL certificate");
    case DioExceptionType.badResponse:
      print("Bad response...");
      switch (e.response!.statusCode) {
        case 400:
          return ErrorEntity(code: 400, message: "Request Syntax error");
        case 401:
          return ErrorEntity(code: 401, message: "Permission denied");

        default:
          return ErrorEntity(code: -1, message: "Server Bad response");
      }
    case DioExceptionType.cancel:
      return ErrorEntity(code: -1, message: "Request cancelled");
    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: "Connection error");
    case DioExceptionType.unknown:
      return ErrorEntity(code: -1, message: "Unknown error: ${e.message}");
  }
}

void onError(ErrorEntity eInfo) {
  print("Error code:${eInfo.code} and Message :${eInfo.message}");
  switch (eInfo.code) {
    case 400:
      print("Server Syntax error");
      break;
    case 401:
      print("You are denied to continue");
      break;
    case 500:
      print("Server Internal error");
      break;
    default:
      print("Unknown error");
  }
}
