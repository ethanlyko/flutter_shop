// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user.freezed.dart';
part 'user.g.dart';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "password") required String password,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "role") required String role,
    @JsonKey(name: "avatar") required String avatar,
    @JsonKey(name: "creationAt") required DateTime creationAt,
    @JsonKey(name: "updatedAt") required DateTime updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
