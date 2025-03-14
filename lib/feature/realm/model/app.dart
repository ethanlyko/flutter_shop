import 'package:realm/realm.dart';

part 'app.realm.dart';

@RealmModel()
class _ProductRealm {
  @PrimaryKey()
  late int id;

  late String title;
  late int price;
  int quantity = 1;
  late String description;
  String? orderId;
  late List<String?> images;

  @override
  String toString() =>
      "Product: id=$id, title=$title, price=$price, quantity=$quantity, order=${orderId?.substring(0, 9)}";
}

@RealmModel()
class _OrderRealm {
  @PrimaryKey()
  late String? id;
  late DateTime? dateTime;
  late int status;
  late String uid; // uid of Firebase: Can be anonymous or register

  late List<_ProductRealm> items;

  @override
  String toString() {
    var string =
        "OrderReam: id=$id, status=$status, uid=$uid, dateTime=$dateTime, items=$items";

    return string;
  }
}

enum OrderStatus {
  init,
  sentToServer, // order is updated in server
  paid, // user paid
  closed;
}

@RealmModel()
class _FavoriteRealm {
  @PrimaryKey()
  late String? uuid;
  late int productId;

  late String title;
  late int price;
  late String description;
  late List<String?> images;

  @override
  String toString() =>
      "uuid=${uuid?.substring(0, 9)}, Product: id=$productId, title=$title, price=$price";
}
