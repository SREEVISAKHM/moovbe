// To parse this JSON data, do
//
//     final homeScreenModel = homeScreenModelFromJson(jsonString);

import 'dart:convert';

HomeScreenModel homeScreenModelFromJson(String str) =>
    HomeScreenModel.fromJson(json.decode(str));

String homeScreenModelToJson(HomeScreenModel data) =>
    json.encode(data.toJson());

class HomeScreenModel {
  HomeScreenModel({
    required this.status,
    required this.busList,
  });

  final bool status;
  final List<BusList> busList;

  factory HomeScreenModel.fromJson(Map<String, dynamic> json) =>
      HomeScreenModel(
        status: json["status"],
        busList: List<BusList>.from(
            json["bus_list"].map((x) => BusList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "bus_list": List<dynamic>.from(busList.map((x) => x.toJson())),
      };
}

class BusList {
  BusList({
    required this.id,
    required this.name,
    required this.image,
    required this.seatCount,
    required this.type,
    this.driver,
  });

  final String id;
  final String name;
  final String image;
  final String seatCount;
  final String type;
  final dynamic driver;

  factory BusList.fromJson(Map<String, dynamic> json) => BusList(
        id: json["id"].toString(),
        name: json["name"],
        image: json["image"],
        seatCount: json["seat_count"],
        type: json["type"],
        driver: json["driver"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "seat_count": seatCount,
        "type": type,
        "driver": driver,
      };
}
