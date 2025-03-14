// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'product.freezed.dart';
part 'product.g.dart';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class Product with _$Product {
  const factory Product({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "price") required int price,
    @JsonKey(name: "description") required String description,
    @JsonKey(name: "images") required List<String> images,
    @JsonKey(name: "creationAt") required DateTime creationAt,
    @JsonKey(name: "updatedAt") required DateTime updatedAt,
    @JsonKey(name: "category") required Category category,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "image") required String image,
    @JsonKey(name: "creationAt") required DateTime creationAt,
    @JsonKey(name: "updatedAt") required DateTime updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
