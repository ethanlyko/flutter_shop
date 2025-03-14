import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../common/app_style.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTapped;
  const MyBottomNavigationBar(
      {required this.currentIndex, required this.onTapped, super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppStyle.navigationBackgroundColor,
      selectedItemColor: AppStyle.navigationUnselectedColor,
      unselectedItemColor: AppStyle.navigationSelectedColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) => onTapped(index),
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: S.of(context).home_nav_home,
          tooltip: '',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.category),
          label: S.of(context).home_nav_category,
          tooltip: '',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          label: S.of(context).home_nav_favorite,
          tooltip: '',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: S.of(context).home_nav_setting,
          tooltip: '',
        ),
      ],
    );
  }
}
