import 'package:uuid/uuid.dart';

import '../../home/model/product_model.dart';

enum PayStatus {
  no,
  paid,
}

enum ShoppingCartStatus {
  empty,
  completed,
}

class ShoppingOrder {
  String userEmail = "";
  String id = const Uuid().v4();
  DateTime createdTime = DateTime.now();
  PayStatus payStatus = PayStatus.no;
  List<ProductModel> items = List.empty(growable: true);
}
