import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../home/model/product_model.dart';
import '../../realm/model/app.dart';
import '../../realm/realm_manager.dart';

part 'cart_control.g.dart';

@Riverpod(keepAlive: true)
class CartControl extends _$CartControl {
  OrderRealm? currentOrder;

  @override
  FutureOr<OrderRealm?> build() async {
    var order = RealmManager().retrieveInitOrder();

    if (order == null) {
      newOrder();
    } else {
      currentOrder = order;
    }
    return currentOrder;
  }

  newOrder() async {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    uid ??= "";
    currentOrder = OrderRealm(
      const Uuid().v4(),
      OrderStatus.init.index,
      uid,
      dateTime: DateTime.now(),
    );

    await RealmManager().saveOrder(currentOrder!);
  }

  removeProduct(ProductRealm product) async {
    if (currentOrder != null) {
      for (var item in currentOrder!.items) {
        if (item.id == product.id) {
          await RealmManager().removeOrderProductItem(currentOrder!, item);
          break;
        }
      }
      state = AsyncData(currentOrder);
    } else {
      print("error: currentOrder == null");
    }
  }

  setPrdouctQuantity(ProductRealm product, int quantity) async {
    if (currentOrder != null) {
      bool found = false;
      for (var item in currentOrder!.items) {
        if (item.id == product.id) {
          found = true;
          await RealmManager()
              .setProductQuntity(currentOrder!, product.id, quantity);
          break;
        }
      }

      if (!found) {
        product.quantity = quantity;
        product.orderId = currentOrder!.id!;
        await RealmManager().addOrderProductItem(currentOrder!, product);
      }
      state = AsyncData(currentOrder);
    } else {
      print("error: currentOrder == null");
    }
  }

  void addProduct(ProductModel product) async {
    if (currentOrder != null) {
      bool notFound = true;
      for (var item in currentOrder!.items) {
        if (item.id == product.id) {
          notFound = false;
          break;
        }
      }

      if (notFound) {
        final item = ProductModel.toProductRealm(product);
        item.orderId = currentOrder!.id!;
        await RealmManager().addOrderProductItem(currentOrder!, item);
        state = AsyncData(currentOrder);
      }
    } else {
      print("error: currentOrder == null");
    }
  }

  int getOrderItemCount() {
    final count = currentOrder?.items.length ?? 0;
    return count;
  }

  int getProductQuantity(int id) {
    int quantity = 1;
    if (currentOrder != null) {
      for (var item in currentOrder!.items) {
        if (item.id == id) {
          quantity = item.quantity;
          break;
        }
      }
    }

    return quantity;
  }

  void updateCurrentOrderStatus(OrderStatus orderStatus) async {
    if (currentOrder != null) {
      await RealmManager().updateCurrentOrderStatus(currentOrder!, orderStatus);

      if (orderStatus == OrderStatus.sentToServer) {
        newOrder();
        state = AsyncData(currentOrder);
      }
    }
  }
}
