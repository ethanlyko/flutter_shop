import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../generated/l10n.dart';
import 'widget/logout_buttion.dart';
import 'widget/row_text.dart';
import '../../common/app_router.dart';
import '../../common/app_style.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget w;

    final currentUser = FirebaseAuth.instance.currentUser;

    w = SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: ListView(
                children: [
                  RowText(
                    name: S.of(context).account_name,
                    value: currentUser?.displayName,
                  ),
                  const Divider(),
                  RowText(
                    name: S.of(context).account_email,
                    value: currentUser?.email,
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: LogoutButton(),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
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
        ),
        backgroundColor: AppStyle.appBarBackgroundColor,
        centerTitle: true,
        title: Text(
          S.of(context).account_title,
          style: AppStyle.textMedium,
        ),
      ),
      backgroundColor: AppStyle.contentBackgroundColor,
      body: w,
    );
  }
}
