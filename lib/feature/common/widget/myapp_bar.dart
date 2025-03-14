import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../generated/l10n.dart';
import '../app_router.dart';
import '../app_style.dart';
import '../../shopping_cart/control/cart_control.dart';

Text appTitleText(BuildContext context) {
  return Text.rich(
    TextSpan(style: AppStyle.textLarge, children: [
      TextSpan(
        text: S.of(context).app_title,
        style: TextStyle(
          color: AppStyle.yellowColor,
        ),
      ),
      const TextSpan(
        text: 'App',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    ]),
  );
}

class MyappBar extends StatelessWidget implements PreferredSizeWidget {
  final Text? title;
  final Widget? leadingIcon;
  final bool? backLeading;
  final bool? actions;
  const MyappBar({
    this.title,
    this.backLeading = false,
    this.leadingIcon,
    this.actions = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppStyle.appBarBackgroundColor,
      centerTitle: true,
      title: (title == null) ? appTitleText(context) : title,
      leading: (leadingIcon != null)
          ? leadingIcon
          : (backLeading == true
              ? IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      context.go(RouterPath.routeNavigationHome);
                    }
                  },
                )
              : null),
      actions: (actions == true)
          ? [
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 16),
                child: GestureDetector(
                  onTap: () {
                    context.push(RouterPath.routeCart);
                  },
                  child: Consumer(builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    final provider = ref.watch(cartControlProvider);
                    final count = provider.value?.items.length ?? 0;
                    return badges.Badge(
                      badgeStyle: const badges.BadgeStyle(
                        badgeColor: Colors.white,
                      ),
                      badgeContent: Text(
                        "$count",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      badgeAnimation: const badges.BadgeAnimation.scale(
                        animationDuration: Duration(seconds: 1),
                        colorChangeAnimationDuration: Duration(seconds: 1),
                        loopAnimation: false,
                        curve: Curves.fastOutSlowIn,
                        colorChangeAnimationCurve: Curves.easeInCubic,
                      ),
                      child: Icon(
                        Icons.shopping_cart_rounded,
                        color: AppStyle.yellowColor,
                        size: 24,
                      ),
                    );
                  }),
                ),
              )
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
