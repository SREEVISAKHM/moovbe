// To parse this JSON data, do
//
//     final refreshTokenModel = refreshTokenModelFromJson(jsonString);

import 'dart:convert';

RefreshTokenModel refreshTokenModelFromJson(String str) =>
    RefreshTokenModel.fromJson(json.decode(str));

String refreshTokenModelToJson(RefreshTokenModel data) =>
    json.encode(data.toJson());

class RefreshTokenModel {
  RefreshTokenModel({
    required this.access,
    required this.refresh,
  });

  final String access;
  final String refresh;

  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) =>
      RefreshTokenModel(
        access: json["access"],
        refresh: json["refresh"],
      );

  Map<String, dynamic> toJson() => {
        "access": access,
        "refresh": refresh,
      };
}
