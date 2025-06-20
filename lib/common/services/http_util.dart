import 'package:dio/dio.dart';

class HttpUtil {
  late Dio dio;
  static final HttpUtil _instance = HttpUtil._();

  factory HttpUtil() {
    return _instance; //to return the instance of the class
  }
  HttpUtil._() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://127.0.0.1:8000",
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        headers: {},
        contentType: "application/json:charset=UTF-8",
        responseType: ResponseType.json,
      ),
    );
  } //gonna create the private class where no object can be created->we can't change the value of bseurl,coneectiontimeout etc
}
