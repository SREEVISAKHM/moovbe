import 'dart:developer';

import 'package:moovbe/features/driver_list/model/driver_list_model.dart';
import 'package:moovbe/providers/base_provider.dart';

import '../../../services/web_api_services.dart';

class DriverListProvider extends BaseProvider {
  static final DriverListProvider _instance = DriverListProvider._initialise();

  DriverListProvider._initialise() : super(name: 'DriverListProvider');
  factory DriverListProvider() => _instance;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  DriverListModel? driverListModel;

  Future<void> fetchDriverListData() async {
    isLoading = true;
    try {
      await WebApiServices().getDriverList().then((value) =>
          {driverListModel = value, isLoading = false, notifyListeners()});
    } catch (e) {
      log(e.toString());
    }
  }

  //for deleting driver

  Future<void> deleteDriver(String driverId) async {
    isLoading = true;
    try {
      await WebApiServices().deleteDriverList(driverId).then((value) => {
            driverListModel = value,
            isLoading = false,
            notifyListeners(),
          });
    } catch (e) {
      isLoading = false;
      log(e.toString());
    }
  }

  //for adding driver

  Future<void> addDriver(String name, String mobile, String licenseNo) async {
    isLoading = true;
    try {
      await WebApiServices()
          .addDriverList(name, mobile, licenseNo)
          .then((value) => {
                driverListModel = value,
                isLoading = false,
                notifyListeners(),
              });
    } catch (e) {
      isLoading = false;
      log(e.toString());
    }
  }
}
