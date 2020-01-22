import 'package:flutter/material.dart';
import 'package:k_central_app/app/pages/feed_page.dart';
import 'package:k_central_app/app/pages/reviews_page.dart';
import 'package:k_central_app/app/pages/signin/signin_view_controller.dart';

class AppConstants {
  static const List<BottomNavigationBarItem> bottomNavigationItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Feed')),
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Reviews')),
    BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('Profile')),
  ];
  static List<Widget> bodyList = [
    FeedPage(),
    ReviewsPage(),
    SigninViewController()
  ];
}