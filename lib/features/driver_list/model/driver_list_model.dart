// To parse this JSON data, do
//
//     final driverListModel = driverListModelFromJson(jsonString);

import 'dart:convert';

DriverListModel driverListModelFromJson(String str) =>
    DriverListModel.fromJson(json.decode(str));

String driverListModelToJson(DriverListModel data) =>
    json.encode(data.toJson());

class DriverListModel {
  DriverListModel({
    required this.status,
    required this.driverList,
  });

  final bool status;
  final List<DriverList> driverList;

  factory DriverListModel.fromJson(Map<String, dynamic> json) =>
      DriverListModel(
        status: json["status"],
        driverList: List<DriverList>.from(
            json["driver_list"].map((x) => DriverList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "driver_list": List<dynamic>.from(driverList.map((x) => x.toJson())),
      };
}

class DriverList {
  DriverList({
    required this.id,
    required this.name,
    required this.mobile,
    required this.licenseNo,
  });

  final String id;
  final String name;
  final String mobile;
  final String licenseNo;

  factory DriverList.fromJson(Map<String, dynamic> json) => DriverList(
        id: json["id"].toString(),
        name: json["name"],
        mobile: json["mobile"].toString(),
        licenseNo: json["license_no"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "license_no": licenseNo,
      };
}
