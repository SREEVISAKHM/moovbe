import 'dart:developer';

import 'package:moovbe/features/auth/model/login_model.dart';
import 'package:moovbe/providers/base_provider.dart';
import 'package:moovbe/services/web_api_services.dart';
import 'package:moovbe/utils/sp_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends BaseProvider {
  static final LoginProvider _instance = LoginProvider._initialise();

  LoginProvider._initialise() : super(name: 'LoginProvider');

  factory LoginProvider() => _instance;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> _saveDataToSP(
          String accesstoken, String refreshtoken, String urlId) =>
      SharedPreferences.getInstance().then((sp) {
        sp.setString(spKeyAccessToken, accesstoken);
        sp.setString(spKeyRefreshToken, refreshtoken);
        sp.setString(spKeyUrl, urlId);
        return true;
      });
  LoginModel? loginModel;
  Future<void> login({String? username, String? password}) async {
    isLoading = true;

    try {
      await WebApiServices()
          .userLogin(username: username, password: password)
          .then((value) => {
                _saveDataToSP(value!.access, value.refresh, value.urlId),
                loginModel = value,
                isLoading = false
              });
      notifyListeners();
    } catch (e) {
      isLoading = false;
      log(e.toString());
    }
  }
}
