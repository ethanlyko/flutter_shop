import 'package:flutter/material.dart';

abstract class AppStyle {
  // Color
  static Color appBarBackgroundColor =
      const Color.fromRGBO(0x00, 0x00, 0x40, 0.8);
  static Color appBarForegroundColor =
      const Color.fromRGBO(0xff, 0xff, 0xff, 0.9);

  static Color buttomNavigationBackgroundColor =
      const Color.fromRGBO(0x00, 0x00, 0x30, 0.9);

  static Color iconColor = const Color.fromRGBO(0xff, 0xff, 0xff, 0.5);

  static Color contentBackgroundColor =
      const Color.fromRGBO(0x00, 0x00, 0x50, 0.7);

  static Color dialogBackgroundColor = const Color.fromARGB(255, 17, 10, 10);

  static Color navigationBackgroundColor =
      const Color.fromARGB(0xE0, 0x20, 0x20, 0x20);
  static Color navigationSelectedColor =
      const Color.fromARGB(255, 255, 255, 255);
  static Color navigationUnselectedColor = yellowColor;

  static Color inputBoxBackgroundColor = Colors.white.withOpacity(0.8);

  static Color progressIndicatorColor = Colors.blue;
  static Color favoriteColor = Colors.cyan;
  static Color nonFavoriteColor = Colors.grey;
  static Color containerBackgroundColor = Colors.grey.withOpacity(0.3);
  static Color yellowColor = const Color(0xFFFFD54E);

  // Button
  static ButtonStyle selectedButtonStyle = IconButton.styleFrom(
    backgroundColor: Colors.amber.shade300.withOpacity(0.3),
  );
  static ButtonStyle transparentButtonStyle = IconButton.styleFrom(
    backgroundColor: Colors.transparent,
  );

  // Text
  static TextStyle textLarge = const TextStyle(
    fontSize: 32,
    color: Color.fromRGBO(0xff, 0xff, 0xff, 0.9),
  );
  static TextStyle textMedium = const TextStyle(
    fontSize: 28,
    color: Color.fromRGBO(0xff, 0xff, 0xff, 0.9),
  );
  static TextStyle textMediumBlack = const TextStyle(
    fontSize: 28,
    color: Color.fromRGBO(0x00, 0x00, 0x00, 0.9),
  );
  static TextStyle textSmall = const TextStyle(
    fontSize: 24,
    color: Color.fromRGBO(0xff, 0xff, 0xff, 0.9),
  );
  static TextStyle textSmallBlack = const TextStyle(
    fontSize: 24,
    color: Color.fromRGBO(0x00, 0x00, 0x00, 0.9),
  );
  static TextStyle textSmaller = const TextStyle(
    fontSize: 20,
    color: Color.fromRGBO(0xff, 0xff, 0xff, 0.9),
  );
  static TextStyle textSmallerBlack = const TextStyle(
    fontSize: 20,
    color: Color.fromRGBO(0x00, 0x00, 0x00, 0.9),
  );

  static TextStyle textSearchHint = const TextStyle(
    fontSize: 20,
    color: Color.fromRGBO(0xff, 0xff, 0xff, 0.9),
  );
}
