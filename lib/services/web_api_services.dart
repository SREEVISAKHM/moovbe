import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:moovbe/features/auth/model/login_model.dart';
import 'package:moovbe/features/driver_list/model/driver_list_model.dart';
import 'package:moovbe/features/home/model/home_screen_model.dart';
import 'package:moovbe/model/refresh_token_model.dart';
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
            // connectTimeout: 5000,
            // receiveTimeout: 3000,
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

  Future<RefreshTokenModel?> refreshToken(
      String refreshToken, RequestOptions options) async {
    try {
      var body = {"refresh": refreshToken};
      final response = await dio.post(urlRefresh, data: body);

      if (response.statusCode == 200) {
        RefreshTokenModel refreshTokenModel =
            RefreshTokenModel.fromJson(response.data);

        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(spKeyAccessToken, refreshTokenModel.access);
        sp.setString(spKeyRefreshToken, refreshTokenModel.refresh);
        dio.request(options.path,
            options: Options(
              headers: options.headers,
              method: options.method,
            ));
        return refreshTokenModel;
      }
    } on SocketException {
      throw Exception("SocketException");
    } on IOException {
      throw Exception("SomeThing Went Wrong");
    }
    return null;
  }

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

    var body = json.encode({"driver_id": driverId});
    var urlId = await getUrlIdFromSp();
    try {
      var url = '$urlDrivrList${urlId!}';

      final response = await dio.delete(url, data: body);

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

  Future<DriverListModel?> addDriverList(
      String name, String mobile, String licenseNo) async {
    _initTokenToHeader();

    var body = json.encode({
      "name": name,
      "mobile": mobile,
      "license_no": licenseNo,
    });
    var urlId = await getUrlIdFromSp();
    try {
      var url = '$urlDrivrList${urlId!}';

      final response = await dio.post(url, data: body);

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

  Future<void> assignDriverList(String busId, String driverId) async {
    _initTokenToHeader();

    var body = json.encode({
      "bus_id": busId,
      "driver_id": driverId,
    });
    var urlId = await getUrlIdFromSp();
    try {
      var url = '$urlDrivrList${urlId!}';

      final response = await dio.patch(url, data: body);

      if (response.statusCode == 200) {
        log('api is  not working');
        // return DriverListModel.fromJson(response.data);
      }
    } on SocketException {
      throw Exception("SocketException");
    } on IOException {
      throw Exception("SomeThing Went Wrong");
    }
    return;
  }
}
