import 'package:flutter/material.dart';
import 'package:k_central_app/app/pages/feed_page.dart';
import 'package:k_central_app/app/pages/reviews_page.dart';
import 'package:k_central_app/util/constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case feedRoute:
        return MaterialPageRoute(
          builder: (_) => FeedPage(),
        );
      case reviewsRoute:
        return MaterialPageRoute(
          builder: (_) => ReviewsPage(),
        );
      // case '/profile':
      //   return MaterialPageRoute(
      //     builder: (_) => ReviewsPage(),
      //   );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),),);
    }
  }
}
