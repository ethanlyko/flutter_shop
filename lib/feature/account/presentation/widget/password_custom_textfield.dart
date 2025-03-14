import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import 'custom_textfield.dart';

class PasswordCustomTextField extends StatelessWidget {
  final String? text;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const PasswordCustomTextField({
    this.text,
    this.controller,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      validator: (validator != null)
          ? validator
          : (v) {
              return v!.trim().length > 7
                  ? null
                  : S.of(context).account_password_valid_error;
            },
      icon: Icons.lock,
      label:
          (text != null) ? text! : S.of(context).account_password_placeholder,
      isSecret: true,
    );
  }
}
