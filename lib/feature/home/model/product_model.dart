import 'package:uuid/uuid.dart';

import '../../realm/model/app.dart';

class ProductModel {
  final int id;
  final String title;
  final int price;
  final String description;
  final List<String> images;
  final DateTime? creationAt;
  final DateTime? updatedAt;
  final CategoryModel? category;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });

  @override
  String toString() =>
      "category=${category?.id}, id=$id, title=$title, price=$price, images=$images";

  static ProductRealm toProductRealm(ProductModel product) {
    return ProductRealm(
      product.id,
      product.title,
      product.price,
      product.description,
      images: product.images,
    );
  }

  static FavoriteRealm toFavoriteRealm(ProductModel product) {
    return FavoriteRealm(
      const Uuid().v4(),
      product.id,
      product.title,
      product.price,
      product.description,
      images: product.images,
    );
  }
}

class CategoryModel {
  final int id;
  final String name;
  final String image;
  final DateTime creationAt;
  final DateTime updatedAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  @override
  String toString() => "category: id=$id, name=$name";
}
