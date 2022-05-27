import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:moovbe/features/auth/model/login_model.dart';
import 'package:moovbe/features/driver_list/model/driver_list_model.dart';
import 'package:moovbe/features/home/model/home_screen_model.dart';
import 'package:moovbe/utils/sp_keys.dart';
import 'package:moovbe/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebApiServices {
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
                // responseHeader: true,
                responseBody: true,
                // requestBody: true,
                requestHeader: true,
              ),
            ],
          );

  Future<String?> getTokenFromSharedPref() => SharedPreferences.getInstance()
      .then<String?>((sp) => sp.getString(spKeyAccessToken));

  Future<String?> getUrlIdFromSp() => SharedPreferences.getInstance()
      .then<String?>((sp) => sp.getString(spKeyUrl));

  Future<bool> _initTokenToHeader() =>
      getTokenFromSharedPref().then((token) async {
        if (_dio.options.headers.containsKey('Authorization')) {
          _dio.options.headers.remove('Authorization');
        }
        _dio.options.headers
            .putIfAbsent('Authorization', () => 'Bearer $token');

        return true;
      });

  void refreshToken() {}

  Future<LoginModel?> userLogin({String? username, String? password}) async {
    var body = {"username": username, "password": password};
    log(body.toString());
    log('login started');
    try {
      final response = await dio.post(urlLogin, data: body);
      if (response.statusCode == 200) {
        // log(loginModelToJson(response.data));
        return LoginModel.fromJson(response.data);
      }
    } on SocketException {
      throw Exception("SocketException");
    } on IOException {
      throw Exception("SomeThing Went Wrong");
    }
    return null;
  }

  Future<HomeScreenModel?> getHomeScreenData() async {
    _initTokenToHeader();
    var urlId = await getUrlIdFromSp();
    try {
      final response = await dio.get(urlHomeScreen + urlId!);
      if (response.statusCode == 200) {
        return HomeScreenModel.fromJson(response.data);
      }
    } on SocketException {
      throw Exception("SocketException");
    } on IOException {
      throw Exception("SomeThing Went Wrong");
    }
    return null;
  }

  Future<DriverListModel?> getDriverList() async {
    _initTokenToHeader();
    var urlId = await getUrlIdFromSp();
    try {
      final response = await dio.get(urlDrivrList + urlId!);
      if (response.statusCode == 200) {
        return DriverListModel.fromJson(response.data);
      }
    } on SocketException {
      throw Exception("SocketException");
    } on IOException {
      throw Exception("SomeThing Went Wrong");
    }
    return null;
  }

  Future<DriverListModel?> deleteDriverList(String driverId) async {
    _initTokenToHeader();
    var urlId = await getUrlIdFromSp();
    try {
      final response = await dio.delete(urlDrivrList + urlId!,
          queryParameters: {"driver_id": driverId});
      if (response.statusCode == 200) {
        return DriverListModel.fromJson(response.data);
      }
    } on SocketException {
      throw Exception("SocketException");
    } on IOException {
      throw Exception("SomeThing Went Wrong");
    }
    return null;
  }
}
