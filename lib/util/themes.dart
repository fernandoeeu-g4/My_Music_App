import 'package:flutter/material.dart';

final ThemeData DefaultThemeData = ThemeData(
    primaryColor: KCentralColors.k_pink,
    primaryColorDark: KCentralColors.k_dark_pink);

final ThemeData DarkThemeData = ThemeData(
  primaryColor: KCentralColors.k_blue,
  primaryColorDark: KCentralColors.k_dark_blue,
);

class KCentralColors {
  KCentralColors._();
  static const Color k_pink = Color(0xffEB73B2);
  static const Color k_dark_pink = Color(0xffC83983);
  static const Color k_blue = Color(0xff2C5364);
  static const Color k_dark_blue = Color(0xff0F2027);
}
