import 'package:flutter/material.dart';

import '../../../common/app_style.dart';

class RowText extends StatelessWidget {
  final String name;
  final String? value;
  final Function()? onTap;

  const RowText({
    required this.name,
    this.value,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget w;
    w = GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.textSmaller,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              (value != null) ? value! : "",
              // overflow: TextOverflow.ellipsis,
              style: AppStyle.textSmaller,
            ),
          ),
        ],
      ),
    );

    return w;
  }
}
