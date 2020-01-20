import 'package:flutter/material.dart';

class MyConstants extends InheritedWidget {
  static MyConstants of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<MyConstants>();

  const MyConstants({ Widget child, Key key}): super(key: key, child: child);

  // main.dart

  // final ThemeData defaultTheme = ThemeData(
  //   primaryColor: Color(0xffEB73B2),
  // );

  // tutorial_page.dart
  final EdgeInsets mainBannerMargin = const EdgeInsets.only(top: 100, left: 30);
  final EdgeInsets miniBannerMargin = const EdgeInsets.only(left: 30);



  // final BoxDecoration mainBoxGradient = const BoxDecoration(
    
  // );

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}