import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../preference/shared_preference.dart';

part 'locale_control.g.dart';

@riverpod
class LocaleControl extends _$LocaleControl {
  @override
  Locale build() {
    final code = SharedPref.getLocale() ?? "en";
    var locale = _appSupportedLocale[code]?.$2;
    locale ??= const Locale('en', '');

    return locale;
  }

  void setLocale(String? lang) {
    lang ??= "English";

    var locale = const Locale('en', '');
    for (var value in _appSupportedLocale.values) {
      if (value.$3 == lang) {
        locale = value.$2;
        SharedPref.setLocale(value.$1);
      }
    }

    state = locale;
  }

  String getDisplayLocale() {
    final code = SharedPref.getLocale() ?? "en";
    var display = _appSupportedLocale[code]?.$3;
    display ??= "English";

    return display;
  }
}

Map<String, (String, Locale, String)> _appSupportedLocale = {
  'en': ('en', const Locale('en', ''), 'English'),
  'zh_tw': ('zh_tw', const Locale('zh', 'TW'), '繁中'),
};
