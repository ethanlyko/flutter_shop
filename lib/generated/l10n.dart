// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Setting`
  String get setting_title {
    return Intl.message(
      'Setting',
      name: 'setting_title',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get setting_about {
    return Intl.message(
      'About',
      name: 'setting_about',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get setting_lang {
    return Intl.message(
      'Language',
      name: 'setting_lang',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get setting_lang_en {
    return Intl.message(
      'English',
      name: 'setting_lang_en',
      desc: '',
      args: [],
    );
  }

  /// `繁中`
  String get setting_lang_hant {
    return Intl.message(
      '繁中',
      name: 'setting_lang_hant',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get setting_account {
    return Intl.message(
      'My Account',
      name: 'setting_account',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about_title {
    return Intl.message(
      'About',
      name: 'about_title',
      desc: '',
      args: [],
    );
  }

  /// `This is my app`
  String get about_content {
    return Intl.message(
      'This is my app',
      name: 'about_content',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home_nav_home {
    return Intl.message(
      'Home',
      name: 'home_nav_home',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get home_nav_category {
    return Intl.message(
      'Category',
      name: 'home_nav_category',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get home_nav_favorite {
    return Intl.message(
      'Favorite',
      name: 'home_nav_favorite',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get home_nav_setting {
    return Intl.message(
      'Setting',
      name: 'home_nav_setting',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get account_email_placeholder {
    return Intl.message(
      'Enter your email',
      name: 'account_email_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get account_password_placeholder {
    return Intl.message(
      'Enter your password',
      name: 'account_password_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get account_password_confirm_placeholder {
    return Intl.message(
      'Confirm password',
      name: 'account_password_confirm_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get account_login {
    return Intl.message(
      'Sign in',
      name: 'account_login',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get account_forgot_password {
    return Intl.message(
      'Forgot password?',
      name: 'account_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get account_create_account {
    return Intl.message(
      'Create account',
      name: 'account_create_account',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get account_name {
    return Intl.message(
      'Name',
      name: 'account_name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get account_email {
    return Intl.message(
      'Email',
      name: 'account_email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get account_password {
    return Intl.message(
      'Password',
      name: 'account_password',
      desc: '',
      args: [],
    );
  }

  /// `Create Your Account`
  String get account_register_content {
    return Intl.message(
      'Create Your Account',
      name: 'account_register_content',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get account_logout {
    return Intl.message(
      'Logout',
      name: 'account_logout',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get account_email_valid_error {
    return Intl.message(
      'Enter a valid email',
      name: 'account_email_valid_error',
      desc: '',
      args: [],
    );
  }

  /// `Password is less than 6-digit`
  String get account_password_valid_error {
    return Intl.message(
      'Password is less than 6-digit',
      name: 'account_password_valid_error',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do NOT match`
  String get account_confirm_valid_error {
    return Intl.message(
      'Passwords do NOT match',
      name: 'account_confirm_valid_error',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account_title {
    return Intl.message(
      'Account',
      name: 'account_title',
      desc: '',
      args: [],
    );
  }

  /// `Shopping List`
  String get cart_title {
    return Intl.message(
      'Shopping List',
      name: 'cart_title',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now`
  String get cart_buy_now {
    return Intl.message(
      'Buy Now',
      name: 'cart_buy_now',
      desc: '',
      args: [],
    );
  }

  /// `Order Total`
  String get cart_total {
    return Intl.message(
      'Order Total',
      name: 'cart_total',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get cart_remove_title {
    return Intl.message(
      'Confirmation',
      name: 'cart_remove_title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to remove?`
  String get cart_remove_content {
    return Intl.message(
      'Are you sure to remove?',
      name: 'cart_remove_content',
      desc: '',
      args: [],
    );
  }

  /// `Add Item`
  String get cart_add_item {
    return Intl.message(
      'Add Item',
      name: 'cart_add_item',
      desc: '',
      args: [],
    );
  }

  /// `Added`
  String get cart_add_done {
    return Intl.message(
      'Added',
      name: 'cart_add_done',
      desc: '',
      args: [],
    );
  }

  /// `No Item`
  String get cart_no_item {
    return Intl.message(
      'No Item',
      name: 'cart_no_item',
      desc: '',
      args: [],
    );
  }

  /// `Order sent`
  String get cart_order_sent {
    return Intl.message(
      'Order sent',
      name: 'cart_order_sent',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get common_yes {
    return Intl.message(
      'Yes',
      name: 'common_yes',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get common_cancel {
    return Intl.message(
      'Cancel',
      name: 'common_cancel',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get common_or {
    return Intl.message(
      'or',
      name: 'common_or',
      desc: '',
      args: [],
    );
  }

  /// `Got it`
  String get common_got_it {
    return Intl.message(
      'Got it',
      name: 'common_got_it',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get common_no_data {
    return Intl.message(
      'No Data',
      name: 'common_no_data',
      desc: '',
      args: [],
    );
  }

  /// `Not implemented`
  String get common_not_implemented {
    return Intl.message(
      'Not implemented',
      name: 'common_not_implemented',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search_hint {
    return Intl.message(
      'Search',
      name: 'search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Shop`
  String get app_title {
    return Intl.message(
      'Flutter Shop',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
