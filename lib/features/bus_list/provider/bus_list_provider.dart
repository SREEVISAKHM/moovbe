import 'dart:developer';

import 'package:moovbe/providers/base_provider.dart';
import 'package:moovbe/services/web_api_services.dart';

class BusListProvider extends BaseProvider {
  static final BusListProvider _instance = BusListProvider._initialise();

  BusListProvider._initialise() : super(name: 'BusListProvider');

  factory BusListProvider() {
    return _instance;
  }

  static BusListProvider get instance => _instance;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> assignDriver(String busId, String driverId) async {
    isLoading = true;
    try {
      await WebApiServices()
          .assignDriverList(busId, driverId)
          .then((value) => isLoading = false);
    } catch (e) {
      isLoading = false;
      log(e.toString());
    }
  }
}
