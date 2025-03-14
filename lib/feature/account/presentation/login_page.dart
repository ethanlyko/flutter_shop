import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../generated/l10n.dart';
import '../../common/widget/myapp_bar.dart';
import '../../shopping_cart/presentation/widget/custom_dialog.dart';
import 'widget/auth_button.dart';
import 'widget/email_custom_textfield.dart';
import 'widget/password_custom_textfield.dart';
import 'widget/register_button.dart';
import '../../common/app_router.dart';
import '../../common/app_style.dart';
import '../control/auth_control.dart';

class LoginPage extends ConsumerStatefulWidget {
  final String? afterLogin;
  const LoginPage({this.afterLogin, super.key});

  @override
  ConsumerState<LoginPage> createState() => _SignInState();
}

class _SignInState extends ConsumerState<LoginPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

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
            AuthButton(
              onPressed: () {
                if ((_formKey.currentState as FormState).validate()) {
                  ref
                      .read(authControlProvider.notifier)
                      .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      );
                }
              },
              afterLogin: widget.afterLogin,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _forgotPassword,
                child: Text(S.of(context).account_forgot_password),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(S.of(context).common_or),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
            ),
            RegisterButton(
              borderSide: const BorderSide(color: Colors.grey),
              onPressed: () {
                context.pushReplacement(RouterPath.routeRegister);
              },
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
                  appTitleText(context),
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

  _forgotPassword() async {
    debugPrint("forgot password");
    await customConfirmDialog(
      context: context,
      content: S.of(context).common_not_implemented,
      infoOnly: true,
      barrierDismissible: false,
    );
  }
}
