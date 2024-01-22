import 'dart:convert';

LoginUserModel loginUserModelFromJson(String str) =>
    LoginUserModel.fromJson(json.decode(str));

class LoginUserModel {
  final String? token;
  final int? userId;
  final String? email;
  final String? name;
  final String? dateOfBirth;

  LoginUserModel({
    this.token,
    this.userId,
    this.email,
    this.name,
    this.dateOfBirth,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
        token: json["token"],
        userId: json["user_id"],
        email: json["email"],
        name: json["name"],
        dateOfBirth: json['date of birth'],
      );
}
