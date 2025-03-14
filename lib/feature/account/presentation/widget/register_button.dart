import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../common/app_style.dart';
import 'custom_buttom.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final BorderSide? borderSide;
  const RegisterButton({
    required this.onPressed,
    this.backgroundColor,
    this.borderSide,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyCustomButton(
      text: S.of(context).account_create_account,
      textStyle: AppStyle.textMediumBlack,
      borderSide: borderSide,
      backgroundColor:
          (backgroundColor != null) ? backgroundColor! : Colors.white.withOpacity(0.9),
      onPressed: onPressed,
    );
  }
}
