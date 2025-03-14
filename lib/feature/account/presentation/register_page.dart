import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../generated/l10n.dart';
import '../../common/widget/myapp_bar.dart';
import 'widget/email_custom_textfield.dart';
import 'widget/auth_button.dart';
import 'widget/password_custom_textfield.dart';
import '../../common/app_router.dart';
import '../../common/app_style.dart';
import '../control/auth_control.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget w;

    Widget child = Container(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 60),
      decoration: BoxDecoration(
        color: AppStyle.inputBoxBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(50),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EmailCustomTextField(
              controller: _emailTextController,
            ),
            PasswordCustomTextField(
              controller: _passwordTextController,
            ),
            PasswordCustomTextField(
              text: S.of(context).account_password_confirm_placeholder,
              controller: _confirmTextController,
              validator: (v) {
                return (_confirmTextController.text.isNotEmpty &&
                        _passwordTextController.text ==
                            _confirmTextController.text)
                    ? null
                    : S.of(context).account_confirm_valid_error;
              },
            ),
            AuthButton(
              text: S.of(context).account_create_account,
              textStyle: AppStyle.textMediumBlack,
              onPressed: () {
                if ((_formKey.currentState as FormState).validate()) {
                  ref.read(authControlProvider.notifier).register(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      );
                }
              },
              afterLogin: RouterPath.routeAccount,
            ),
          ],
        ),
      ),
    );

    final size = MediaQuery.of(context).size;
    w = SingleChildScrollView(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    S.of(context).account_register_content,
                    style: AppStyle.textLarge,
                  ),
                  child,
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: const MyappBar(
        backLeading: true,
        actions: false,
        title: Text(""),
      ),
      backgroundColor: AppStyle.contentBackgroundColor,
      body: w,
    );
  }
}
