import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:moovbe/features/auth/model/login_model.dart';
import 'package:moovbe/utils/urls.dart';

class WebApiServices extends InterceptorsWrapper {
  static final WebApiServices _singleton = WebApiServices._initialise();

  final Dio _dio;
  Dio get dio => _dio;
  factory WebApiServices() => _singleton;

  WebApiServices._initialise()
      : _dio = Dio(
          BaseOptions(
            headers: {
              "Content-Type": "application/json",
            },
            connectTimeout: 5000,
            receiveTimeout: 3000,
          ),
        )..interceptors.addAll(
            [
              LogInterceptor(
                responseHeader: true,
                responseBody: true,
                requestBody: true,
                requestHeader: true,
              ),
            ],
          );
  //  InterceptorsWrapper(
  //       onError: (error, errorInterceptorHandler) async {
  //         if (error.response?.statusCode == 401 ||
  //             error.response?.statusCode == 401) {
  //           // await refreshToken();

  //           final options = Options(
  //             method: error.response?.requestOptions.method,
  //             headers: error.response?.requestOptions.headers,
  //           );
  //           dio.request(error.response!.requestOptions.path,
  //               queryParameters:
  //                   error.response?.requestOptions.queryParameters,
  //               options: options,
  //               data: error.response?.requestOptions.data);
  //         }
  //       },
  //       onRequest: (request, requestInterceptorHandler) {
  //         log("${request.method} | ${request.path}");
  //       },
  //       onResponse: (response, responseInterceptorHandler) {
  //         log('${response.statusCode} ${response.statusCode} ${response.data}');
  //       },
  //     ),

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('wrapper is working');
    if (err.response?.statusCode == 401 || err.response?.statusCode == 401) {
      // await refreshToken();

      final options = Options(
        method: err.response?.requestOptions.method,
        headers: err.response?.requestOptions.headers,
      );
      dio.request(err.response!.requestOptions.path,
          queryParameters: err.response?.requestOptions.queryParameters,
          options: options,
          data: err.response?.requestOptions.data);
    }
    super.onError(err, handler);
  }

  void refreshToken() {}

  Future<LoginModel?> userLogin({String? username, String? password}) async {
    var body = {"username": username, "password": password};
    log(body.toString());
    log('login started');
    final response = await dio.post(urlLogin, data: body);

    if (response.statusCode == 200) {
      log(loginModelToJson(response.data));
      return LoginModel.fromJson(response.data);
    }
    return null;
  }
}
