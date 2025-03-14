import 'package:realm/realm.dart';

import '../home/model/product_model.dart';
import 'model/app.dart';

class RealmManager {
  RealmManager._internal();
  static final RealmManager _instance = RealmManager._internal();
  factory RealmManager() => _instance;

  var realm = Realm(Configuration.local(
    [
      ProductRealm.schema,
      OrderRealm.schema,
      FavoriteRealm.schema,
    ],
    schemaVersion: 2,
    migrationCallback: (migration, oldSchemaVersion) {
      final olds = migration.oldRealm.all("ProductRealm");
      for (var old in olds) {
        final newOne = migration.findInNewRealm<ProductRealm>(old);
        if (newOne == null) {
          continue;
        }

        newOne.orderId = "";
      }
    },
  ));

  void close() {
    realm.close();
  }

  deleteAll() async {
    await realm.writeAsync(() {
      realm.deleteAll<ProductRealm>();
    });
  }

  OrderRealm? retrieveInitOrder() {
    return _retrieveOrder(OrderStatus.init.index);
  }

  OrderRealm? _retrieveOrder(int status) {
    return realm.query<OrderRealm>("status == \$0", [status]).firstOrNull;
  }

  ProductRealm? retrieveProduct(int id) {
    return realm.find<ProductRealm>(id);
  }

  Future<void> addOrderProductItem(
      OrderRealm order, ProductRealm product) async {
    await realm.writeAsync(() {
      order.items.add(product);
    });
  }

  Future<void> removeOrderProductItem(
      OrderRealm order, ProductRealm product) async {
    await realm.writeAsync(() {
      order.items.remove(product);
      realm.delete(product);
    });
  }

  Future<void> setProductQuntity(OrderRealm order, int id, int quantity) async {
    for (var p in order.items) {
      if (p.id == id) {
        await realm.writeAsync(() {
          p.quantity = quantity;
        });
        break;
      }
    }
  }

  Future<void> saveOrder(OrderRealm order) async {
    await realm.writeAsync(() {
      realm.add(order);
    });
  }

  Future<void> updateCurrentOrderStatus(
      OrderRealm order, OrderStatus orderStatus) async {
    await realm.writeAsync(() {
      order.status = orderStatus.index;

      if (orderStatus == OrderStatus.sentToServer) {
        final products = realm.all<ProductRealm>();
        for (var product in products) {
          realm.delete(product);
        }
      }
    });
  }

  void createFavorite(FavoriteRealm realmObject) async {
    await realm.writeAsync(() {
      realm.add(realmObject);
    });
  }

  FavoriteRealm? _queryFavorite(int productId) {
    return realm
        .query<FavoriteRealm>("productId == \$0", [productId]).firstOrNull;
  }

  void deleteFavorite(FavoriteRealm realmObject) async {
    final object = _queryFavorite(realmObject.productId);
    if (object != null) {
      await realm.writeAsync(() {
        realm.delete(object);
      });
    }
  }

  FavoriteRealm? retrieveFavorite(ProductModel product) {
    return _queryFavorite(product.id);
  }

  List<FavoriteRealm> retrieveFavorites() {
    return realm.all<FavoriteRealm>().toList();
  }
}
