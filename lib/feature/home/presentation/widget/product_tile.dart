import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/app_router.dart';
import '../../../common/app_style.dart';
import '../../../shopping_cart/control/cart_control.dart';
import '../../model/product_model.dart';
import 'shopping_cart_icon.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;

  const ProductTile(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget w;
    w = Stack(
      children: [
        GestureDetector(
          onTap: () => context.push(
            RouterPath.routeProductDetail,
            extra: product,
          ),
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Hero(
                    tag: product.id,
                    child: CachedNetworkImage(
                      imageUrl: product.images[0],
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) {
                        debugPrint("error url: $url");
                        return const Icon(
                          Icons.error,
                          size: 100,
                        );
                      },
                    ),
                  ),
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "\$ ${product.price}",
                    textAlign: TextAlign.center,
                    style: AppStyle.textSmallerBlack,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return ShoppingCartIcon(onPressed: () {
              ref.read(cartControlProvider.notifier).addProduct(product);
            });
          }),
        )
      ],
    );

    return w;
  }
}
