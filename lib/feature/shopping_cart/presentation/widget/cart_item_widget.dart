import 'package:flutter/material.dart';

import '../../../common/app_style.dart';
import '../../../common/widget/clip_rrec_image.dart';
import '../../../realm/model/app.dart';
import 'cart_item_info.dart';

class CartItemWidget extends StatefulWidget {
  final ProductRealm product;
  const CartItemWidget({
    required this.product,
    super.key,
  });

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int itemQuantity = 1;

  @override
  void initState() {
    itemQuantity = widget.product.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget w;

    String? url = widget.product.images[0];
    url ??= "";

    w = Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: AppStyle.yellowColor.withOpacity(0.9),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            ClipRRectImage(url),
            const SizedBox(width: 10),
            Expanded(
              child: CardItemInfo(widget.product),
            ),
          ],
        ),
      ),
    );

    return w;
  }
}
