import 'package:flutter/material.dart';

class QuantityWidget extends StatelessWidget {
  final int quantity;
  final Function(int) result;
  final bool isRemovable;
  final double borderRadius;

  const QuantityWidget({
    required this.quantity,
    required this.result,
    this.isRemovable = false,
    this.borderRadius = 30,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget w;

    w = Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 4,
            blurRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _quantityButton(
            icon: !isRemovable || quantity > 1
                ? Icons.remove
                : Icons.delete_forever,
            color: !isRemovable || quantity > 1 ? Colors.black : Colors.white,
            onPressed: () {
              if (quantity == 1 && !isRemovable) return;
              int resultCount = quantity - 1;
              result(resultCount);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              '$quantity',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _quantityButton(
            icon: Icons.add,
            color: Colors.black,
            onPressed: () {
              int resultCount = quantity + 1;
              result(resultCount);
            },
          ),
        ],
      ),
    );

    return w;
  }

  Widget _quantityButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      color: Colors.black,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onPressed,
        child: Ink(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.grey,
            size: 20,
          ),
        ),
      ),
    );
  }
}
