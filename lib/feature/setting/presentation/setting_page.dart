// ignore_for_file: constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../util/control/locale_control.dart';
import '../../common/widget/myapp_bar.dart';
import '../../common/app_router.dart';
import '../../../generated/l10n.dart';
import '../../common/app_style.dart';

enum SettingItems {
  setting_lang,
  setting_about,
}

class SettingPage extends ConsumerStatefulWidget {
  const SettingPage({super.key});

  @override
  ConsumerState<SettingPage> createState() => _SettingState();
}

class _SettingState extends ConsumerState<SettingPage> {
  static const _keySettingItem = 'item';
  static const _keySettingIcon = 'icon';
  static const _keySettingFunction = 'function';

  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();

    items = [
      {
        _keySettingItem: SettingItems.setting_lang,
        _keySettingIcon: Feather.globe,
        _keySettingFunction: () {},
      },
      {
        _keySettingItem: SettingItems.setting_about,
        _keySettingIcon: Feather.info,
        _keySettingFunction: () {
          context.push(RouterPath.routeAbout);
        },
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    Widget w = Scaffold(
      backgroundColor: AppStyle.contentBackgroundColor,
      appBar: MyappBar(
        title: Text(
          S.of(context).setting_title,
          style: AppStyle.textMedium,
        ),
        actions: false,
      ),
      body: Column(
        children: [
          ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              String text = "";
              Widget? trailing;

              switch (items[index][_keySettingItem] as SettingItems) {
                case SettingItems.setting_about:
                  text = S.of(context).setting_about;

                case SettingItems.setting_lang:
                  text = S.of(context).setting_lang;
                  trailing = LangDropItemButton([
                    S.of(context).setting_lang_en,
                    S.of(context).setting_lang_hant,
                  ]);
              }

              return ListTile(
                leading: Icon(
                  items[index][_keySettingIcon] as IconData,
                  color: AppStyle.iconColor,
                ),
                title: Text(text, style: AppStyle.textSmall),
                onTap: items[index][_keySettingFunction] as Function(),
                trailing: trailing,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemCount: items.length,
          ),
          const Spacer(),
          Container(
            height: 50,
            color: AppStyle.yellowColor.withOpacity(0.2),
            child: InkWell(
              onTap: () {
                if (FirebaseAuth.instance.currentUser != null) {
                  context.push(RouterPath.routeAccount);
                } else {
                  context.push(RouterPath.routeSignIn);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_2_outlined,
                    size: 32,
                    color: AppStyle.iconColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    S.of(context).setting_account,
                    style: AppStyle.textSmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return w;
  }
}

class LangDropItemButton extends ConsumerStatefulWidget {
  final List<String> items;
  const LangDropItemButton(this.items, {super.key});

  @override
  ConsumerState<LangDropItemButton> createState() => _LangDropItemButton();
}

class _LangDropItemButton extends ConsumerState<LangDropItemButton> {
  String _selectedItem = "English";

  @override
  void initState() {
    super.initState();

    _selectedItem = ref.read(localeControlProvider.notifier).getDisplayLocale();
  }

  @override
  Widget build(BuildContext context) {
    Widget w = DropdownButton<String>(
        value: _selectedItem,
        style: AppStyle.textSmaller,
        dropdownColor: AppStyle.appBarBackgroundColor.withOpacity(0.3),
        items: widget.items.map((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (e) {
          ref.read(localeControlProvider.notifier).setLocale(e);
          setState(() {
            e ??= S.of(context).setting_lang_en;
            _selectedItem = e!;
          });
        });

    return w;
  }
}
