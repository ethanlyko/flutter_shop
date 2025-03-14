import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import 'custom_textfield.dart';

class EmailCustomTextField extends StatelessWidget {
  final Function? onResult;
  final TextEditingController? controller;
  const EmailCustomTextField({
    this.onResult,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      autofocuse: true,
      validator: (v) {
        return EmailValidator.validate(v!)
            ? null
            : S.of(context).account_email_valid_error;
      },
      icon: Icons.mail,
      label: S.of(context).account_email_placeholder,
    );
  }
}
