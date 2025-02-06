// To parse this JSON data, do
//
//     final otpListModel = otpListModelFromJson(jsonString);

import 'dart:convert';

OtpListModel otpListModelFromJson(String str) => OtpListModel.fromJson(json.decode(str));

String otpListModelToJson(OtpListModel data) => json.encode(data.toJson());

class OtpListModel {
    String? otp;
    bool? user;

    OtpListModel({
        this.otp,
        this.user,
    });

    factory OtpListModel.fromJson(Map<String, dynamic> json) => OtpListModel(
        otp: json["otp"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "otp": otp,
        "user": user,
    };
}
