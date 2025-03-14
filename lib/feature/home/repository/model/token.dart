// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'token.freezed.dart';
part 'token.g.dart';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

@freezed
class Token with _$Token {
  const factory Token({
    @JsonKey(name: "access_token") required String accessToken,
    @JsonKey(name: "refresh_token") required String refreshToken,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
