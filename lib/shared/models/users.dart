import 'dart:convert';

class User {
  User({
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

  factory User.fromMap(Map<String, dynamic> json) => User(
        email: json["email"],
        token: json["token"],
        username: json["username"],
        bio: json["bio"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "token": token,
        "username": username,
        "bio": bio,
        "image": image,
      };
  User userFromMap(String str) => User.fromMap(json.decode(str));

  String userToMap(User data) => json.encode(data.toMap());
}
