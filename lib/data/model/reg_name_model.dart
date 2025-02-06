// To parse this JSON data, do
//
//     final regNameModel = regNameModelFromJson(jsonString);

import 'dart:convert';

RegNameModel regNameModelFromJson(String str) => RegNameModel.fromJson(json.decode(str));

String regNameModelToJson(RegNameModel data) => json.encode(data.toJson());

class RegNameModel {
    Token? token;
    String? userId;
    String? message;

    RegNameModel({
        this.token,
        this.userId,
        this.message,
    });

    factory RegNameModel.fromJson(Map<String, dynamic> json) => RegNameModel(
        token: json["token"] == null ? null : Token.fromJson(json["token"]),
        userId: json["user_id"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "token": token?.toJson(),
        "user_id": userId,
        "message": message,
    };
}

class Token {
    String? access;

    Token({
        this.access,
    });

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        access: json["access"],
    );

    Map<String, dynamic> toJson() => {
        "access": access,
    };
}
