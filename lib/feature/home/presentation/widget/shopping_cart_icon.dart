import 'package:flutter/material.dart';

import '../../../common/app_style.dart';

class ShoppingCartIcon extends StatelessWidget {
  final VoidCallback onPressed;
  const ShoppingCartIcon({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        color: AppStyle.yellowColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.add_shopping_cart_outlined,
          size: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
