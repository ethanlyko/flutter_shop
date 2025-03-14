import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../generated/l10n.dart';
import '../../../product/presentation/widget/quantity_widget.dart';
import '../../../realm/model/app.dart';
import '../../control/cart_control.dart';
import 'custom_dialog.dart';

class CardItemInfo extends StatefulWidget {
  final ProductRealm product;

  const CardItemInfo(this.product, {super.key});

  @override
  State<CardItemInfo> createState() => _CardItemInfoState();
}

class _CardItemInfoState extends State<CardItemInfo> {
  int itemQuantity = 1;

  @override
  void initState() {
    itemQuantity = widget.product.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.product.title,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 100,
          child: Text(
            widget.product.description,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$ ${widget.product.price}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? _) {
                return QuantityWidget(
                  quantity: itemQuantity,
                  isRemovable: true,
                  borderRadius: 20,
                  result: (quantity) async {
                    bool? remove;
                    if (quantity == 0) {
                      remove = await customConfirmDialog(
                        context: context,
                        title: S.of(context).cart_remove_title,
                        content: S.of(context).cart_remove_content,
                      );
                    }

                    remove ??= false;

                    if (remove == true) {
                      await ref
                          .read(cartControlProvider.notifier)
                          .removeProduct(widget.product);
                    } else if (quantity > 0) {
                      setState(() {
                        itemQuantity = quantity;
                      });
                      await ref
                          .read(cartControlProvider.notifier)
                          .setPrdouctQuantity(widget.product, quantity);
                    }
                  },
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
