import 'package:dio/dio.dart';
import 'package:learner/common/utils/constants.dart';
import 'package:learner/global/global.dart';

class HttpUtil {
  late Dio dio;
  static final HttpUtil _instance = HttpUtil._();

  factory HttpUtil() {
    return _instance; //to return the instance of the class
  }
  HttpUtil._() {
    dio = Dio(
      BaseOptions(
        baseUrl: Appconstants.SERVER_API_URL,
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        headers: {},
        contentType: "application/json:charset=UTF-8",
        responseType: ResponseType.json,
      ),
    );
  } //gonna create the private class where no object can be created->we can't change the value of bseurl,coneectiontimeout etc

  Map<String, dynamic> getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var access_token = Global.storageService.getUserToken();
    if (access_token.isNotEmpty) {
      headers['Authorization'] = "Bearer $access_token";
    }
    return headers;
  }

  Future<dynamic> post({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic> authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(
        authorization,
      ); //replace the same key of both with new value of key
    }
    print("before response");

    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );
    print("Response is printed");

    print(response.data);
    print(response.data["message"]);
    return response.data; //response->repo->data model->controller->UI
  }
}
