import 'dart:developer';

import 'package:moovbe/features/home/model/home_screen_model.dart';
import 'package:moovbe/providers/base_provider.dart';
import 'package:moovbe/services/web_api_services.dart';

class HomeProvider extends BaseProvider {
  static final HomeProvider _instance = HomeProvider._initialise();

  HomeProvider._initialise() : super(name: 'HomeProvider');

  factory HomeProvider() => _instance;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  HomeScreenModel? homeScreenModel;
  Future<void> fetchHomeScreenData() async {
    isLoading = true;
    try {
      await WebApiServices().getHomeScreenData().then((value) =>
          {homeScreenModel = value, isLoading = false, notifyListeners()});
    } catch (e) {
      log(e.toString());
    }
  }
}
