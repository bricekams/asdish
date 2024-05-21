import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String phone;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? password;
  @HiveField(4)
  String? picture;

  User({required this.id, required this.phone, this.email, this.password, this.picture});


    factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      phone: json["phone"],
      email: json["email"],
      picture: json["picture"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "phone": phone,
      "email": email,
      "picture": picture,
    };
  }
}