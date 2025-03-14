import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../generated/l10n.dart';
import '../../control/auth_control.dart';
import '../../../common/app_router.dart';
import '../../../common/app_style.dart';
import 'custom_buttom.dart';

class LogoutButton extends ConsumerWidget {
  final Color? backgroundColor;
  final BorderSide? borderSide;
  const LogoutButton({
    this.backgroundColor,
    this.borderSide,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyCustomButton(
        text: S.of(context).account_logout,
        textStyle: AppStyle.textMediumBlack,
        borderSide: borderSide,
        backgroundColor: (backgroundColor != null)
            ? backgroundColor!
            : Colors.white.withOpacity(0.7),
        onPressed: () {
          ref.read(authControlProvider.notifier).signOut();
          context.go(RouterPath.routeNavigationHome);
        });
  }
}
