import 'package:flutter/material.dart';

import '../app_style.dart';

class MyRoundButton extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onPressed;
  const MyRoundButton({
    required this.name,
    required this.isSelected,
    this.onPressed = _default,
    super.key,
  });

  static _default() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey : AppStyle.yellowColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          name,
          style: AppStyle.textSmaller,
        ),
      ),
    );
  }
}
