// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

class UserData {
  final String fullName;
  final String email;
  final String password;
  final int numberOfLogins;

  UserData({
    required this.fullName,
    required this.email,
    required this.password,
    required this.numberOfLogins,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        fullName: json["fullName"],
        email: json["email"],
        password: json["password"],
        numberOfLogins: json["numberOfLogins"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "password": password,
        "numberOfLogins": numberOfLogins,
      };

  static UserData userDataFromJson(String str) =>
      UserData.fromJson(json.decode(str));

  String userDataToJson() => json.encode(toJson());
}
