import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../generated/l10n.dart';
import '../../common/widget/myapp_bar.dart';
import '../../common/app_style.dart';
import '../../home/model/product_model.dart';
import '../../realm/realm_manager.dart';
import '../../shopping_cart/control/cart_control.dart';
import 'widget/quantity_widget.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final ProductModel product;
  const ProductDetailPage(this.product, {super.key});

  @override
  ConsumerState<ProductDetailPage> createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetailPage> {
  int itemQuantity = 1;
  final ValueNotifier<bool> _favorite = ValueNotifier(false);

  @override
  void initState() {
    itemQuantity = ref
        .read(cartControlProvider.notifier)
        .getProductQuantity(widget.product.id);

    _checkFavorite();
    super.initState();
  }

  _checkFavorite() {
    final object = RealmManager().retrieveFavorite(widget.product);
    _favorite.value = (object != null);
  }

  _toggleFavorite() {
    _favorite.value = !_favorite.value;
    if (_favorite.value) {
      RealmManager()
          .createFavorite(ProductModel.toFavoriteRealm(widget.product));
    } else {
      RealmManager()
          .deleteFavorite(ProductModel.toFavoriteRealm(widget.product));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget w;
    Widget body;

    body = Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Hero(
            tag: widget.product.id,
            child: CachedNetworkImage(
              imageUrl: widget.product.images[0],
              height: 300,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) {
                debugPrint("error url: $url");
                return Image.asset('assets/images/No_Image.jpg');
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Stack(children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: BoxDecoration(
                color: AppStyle.yellowColor.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.product.title,
                    style: AppStyle.textSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('\$ ${widget.product.price}',
                          style: AppStyle.textSmall),
                      QuantityWidget(
                        quantity: itemQuantity,
                        result: (quantity) {
                          setState(() {
                            itemQuantity = quantity;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(widget.product.description,
                              style: AppStyle.textSmaller),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  AnimatedButton(
                    product: widget.product,
                    quantity: itemQuantity,
                  ),
                ],
              ),
            ),
            Positioned(
              top: -10,
              right: -10,
              child: ValueListenableBuilder(
                valueListenable: _favorite,
                builder: (context, value, _) {
                  return IconButton(
                    onPressed: () => _toggleFavorite(),
                    icon: const Icon(Icons.favorite, size: 32),
                    color: (_favorite.value)
                        ? AppStyle.favoriteColor
                        : AppStyle.nonFavoriteColor,
                  );
                },
              ),
            ),
          ]),
        ),
      ],
    );

    w = Scaffold(
      backgroundColor: AppStyle.contentBackgroundColor,
      appBar: const MyappBar(backLeading: true),
      body: SafeArea(child: body),
    );

    return w;
  }
}

class AnimatedButton extends StatefulWidget {
  final int quantity;
  final ProductModel product;
  const AnimatedButton({required this.product, this.quantity = 1, super.key});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isSuccess = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 40,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: _isSuccess ? Colors.red.withOpacity(0.7) : Colors.black,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? _) {
          return ElevatedButton(
            onPressed: (() async {
              setState(() {
                _isSuccess = !_isSuccess;
              });
              await ref.read(cartControlProvider.notifier).setPrdouctQuantity(
                    ProductModel.toProductRealm(widget.product),
                    widget.quantity,
                  );
            }),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppStyle.yellowColor.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: const BorderSide(color: Colors.grey, width: 2.0),
              ),
            ),
            child: _isSuccess
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.check, color: Colors.white),
                      const SizedBox(width: 10),
                      Text(
                        S.of(context).cart_add_done,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.shopping_cart, color: Colors.white),
                      const SizedBox(width: 10),
                      Text(
                        S.of(context).cart_add_item,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
