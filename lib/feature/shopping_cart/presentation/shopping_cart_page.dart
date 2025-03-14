import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../generated/l10n.dart';
import '../../common/widget/myapp_bar.dart';
import '../../common/app_router.dart';
import '../../common/app_style.dart';
import '../../realm/model/app.dart';
import '../control/cart_control.dart';
import 'widget/cart_item_widget.dart';
import 'widget/custom_dialog.dart';

class ShoppingCartPage extends ConsumerStatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  ConsumerState<ShoppingCartPage> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends ConsumerState<ShoppingCartPage> {
  final ValueNotifier<double> _total = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(cartControlProvider);
    Widget asyncData = provider.when(
      data: (data) {
        if (data == null || data.items.isEmpty) {
          return Center(
            child: Text(
              S.of(context).cart_no_item,
              style: AppStyle.textLarge,
            ),
          );
        }

        var total = 0.0;
        for (var item in data.items) {
          total += item.price * item.quantity;
        }

        return ListView.builder(
          itemCount: data.items.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _total.value = total;
              });
            }

            final item = data.items[index];

            return CartItemWidget(
              product: item,
            );
          },
        );
      },
      loading: () {
        return const CircularProgressIndicator();
      },
      error: (e, s) {
        return Text(e.toString());
      },
    );

    Widget orderContainer = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: AppStyle.inputBoxBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            S.of(context).cart_total,
            style: AppStyle.textMediumBlack,
          ),
          ValueListenableBuilder(
            valueListenable: _total,
            builder: (BuildContext c, double value, Widget? _) {
              return Text(
                "\$ ${_total.value}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              );
            },
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                if (FirebaseAuth.instance.currentUser == null) {
                  context.pushReplacement(
                    RouterPath.routeSignIn,
                    extra: RouterPath.routeCart,
                  );
                } else {
                  ref
                      .read(cartControlProvider.notifier)
                      .updateCurrentOrderStatus(OrderStatus.sentToServer);

                  _total.value = 0;

                  await customConfirmDialog(
                    context: context,
                    content: S.of(context).cart_order_sent,
                    infoOnly: true,
                    barrierDismissible: false,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: 1,
                backgroundColor: Colors.amber.withOpacity(0.7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: Colors.grey, width: 0.1),
                ),
              ),
              child: Text(
                S.of(context).cart_buy_now,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );

    Widget w = Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: asyncData,
          ),
        ),
        orderContainer,
      ],
    );

    return Scaffold(
      appBar: MyappBar(
        backLeading: true,
        actions: false,
        title: Text(
          S.of(context).cart_title,
          style: AppStyle.textMedium,
        ),
      ),
      backgroundColor: AppStyle.contentBackgroundColor,
      body: SafeArea(child: w),
    );
  }
}
