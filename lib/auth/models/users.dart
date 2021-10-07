import 'package:meta/meta.dart';
import 'dart:convert';

class User {
  User({
    required this.user,
  });

  final UserClass user;

  factory User.fromRawJson(String str) =>
      User.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        user: UserClass.fromJson(json["user"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class UserClass {
  UserClass({
    required this.email,
    required this.token,
    required this.username,
    required this.bio,
    required this.image,
  });

  final String email;
  final String token;
  final String username;
  final String bio;
  final String image;

  factory UserClass.fromRawJson(String str) =>
      UserClass.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        email: json["email"].toString(),
        token: json["token"].toString(),
        username: json["username"].toString(),
        bio: json["bio"].toString(),
        image: json["image"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "token": token,
        "username": username,
        "bio": bio,
        "image": image,
      };
}
