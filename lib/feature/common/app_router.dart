import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/about/presentation/about_page.dart';
import '../account/presentation/account_page.dart';
import '../account/presentation/login_page.dart';
import '../../feature/account/presentation/register_page.dart';
import '../../feature/home/model/product_model.dart';
import '../home/presentation/widget/bottom_navigation.dart';
import '../category/presentation/category_page.dart';
import '../favorite/presentation/favorite_page.dart';
import '../home/presentation/home_page.dart';
import '../product/presentation/product_detail_page.dart';
import '../setting/presentation/setting_page.dart';
import '../shopping_cart/presentation/shopping_cart_page.dart';
import 'app_style.dart';
import 'widget/myapp_bar.dart';

abstract class RouterPath {
  static const String routeNavigationHome = "/home";
  static const String routeNavigationCategory = "/category";
  static const String routeNavigationFavorite = "/favorite";
  static const String routeNavigationSetting = "/setting";

  static const String routeAbout = "/about";
  static const String routeProductDetail = "/productDetail";
  static const String routeSignIn = "/signIn";
  static const String routeRegister = "/register";
  static const String routeAccount = "/account";
  static const String routeCart = "/cart";
}

final appRouter = GoRouter(
  initialLocation: RouterPath.routeNavigationHome,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          appBar: const MyappBar(),
          backgroundColor: AppStyle.contentBackgroundColor,
          body: child,
          bottomNavigationBar: MyBottomNavigationBar(
            currentIndex: _calcCurrentIndex(state.fullPath),
            onTapped: (index) {
              switch (index) {
                case 0:
                  if (state.fullPath != RouterPath.routeNavigationHome) {
                    context.go(RouterPath.routeNavigationHome);
                  }
                  break;
                case 1:
                  if (state.fullPath != RouterPath.routeNavigationCategory) {
                    context.go(RouterPath.routeNavigationCategory);
                  }
                  break;
                case 2:
                  if (state.fullPath != RouterPath.routeNavigationFavorite) {
                    context.go(RouterPath.routeNavigationFavorite);
                  }
                  break;
                case 3:
                  if (state.fullPath != RouterPath.routeNavigationSetting) {
                    context.go(RouterPath.routeNavigationSetting);
                  }
                  break;
              }
            },
          ),
        );
      },
      routes: [
        GoRoute(
          path: RouterPath.routeNavigationHome,
          builder: (context, state) => HomePage(key: state.pageKey),
        ),
        GoRoute(
          path: RouterPath.routeNavigationCategory,
          builder: (context, state) => CategoryPage(key: state.pageKey),
        ),
        GoRoute(
          path: RouterPath.routeNavigationFavorite,
          builder: (context, state) => FavoritePage(key: state.pageKey),
        ),
        GoRoute(
          path: RouterPath.routeNavigationSetting,
          builder: (context, state) => SettingPage(key: state.pageKey),
        ),
      ],
    ),
    GoRoute(
      path: RouterPath.routeAbout,
      builder: (context, state) => AboutPage(key: state.pageKey),
    ),
    GoRoute(
      path: RouterPath.routeProductDetail,
      builder: (context, state) => ProductDetailPage(
        state.extra as ProductModel,
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RouterPath.routeSignIn,
      builder: (context, state) {
        var afterLogin = state.extra as String?;
        afterLogin ??= RouterPath.routeAccount;
        return LoginPage(
          afterLogin: afterLogin,
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: RouterPath.routeRegister,
      builder: (context, state) => RegisterPage(key: state.pageKey),
    ),
    GoRoute(
      path: RouterPath.routeAccount,
      builder: (context, state) => AccountPage(key: state.pageKey),
    ),
    GoRoute(
      path: RouterPath.routeCart,
      builder: (context, state) => ShoppingCartPage(key: state.pageKey),
    ),
  ],
);

_calcCurrentIndex(String? fullPath) {
  switch (fullPath) {
    case RouterPath.routeNavigationSetting:
      return 3;

    case RouterPath.routeNavigationCategory:
      return 1;

    case RouterPath.routeNavigationFavorite:
      return 2;

    case RouterPath.routeNavigationHome:
    default:
      return 0;
  }
}
