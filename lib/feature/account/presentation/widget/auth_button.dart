import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../generated/l10n.dart';
import '../../control/auth_control.dart';
import '../../../common/app_style.dart';

class AuthButton extends ConsumerWidget {
  final VoidCallback onPressed;
  final double height;
  final String? text;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final BorderSide? borderSide;
  final String? afterLogin;

  const AuthButton({
    this.text,
    required this.onPressed,
    this.height = 50,
    this.backgroundColor,
    this.textStyle,
    this.borderSide,
    this.afterLogin,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget w;

    final state = ref.watch(authControlProvider);
    w = SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: (backgroundColor != null)
              ? backgroundColor
              : AppStyle.yellowColor.withOpacity(0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: (borderSide != null) ? borderSide! : BorderSide.none,
          ),
        ),
        onPressed: state.isLoading ? null : onPressed,
        child: state.when(
          data: (data) {
            if (data != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.go(afterLogin!);
              });
            }

            return Text(
              (text != null) ? text! : S.of(context).account_login,
              style: (textStyle != null) ? textStyle : AppStyle.textMediumBlack,
            );
          },
          loading: () {
            return const CircularProgressIndicator();
          },
          error: (e, s) {
            return Text(e.toString());
          },
        ),
      ),
    );

    return w;
  }
}
