import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:k_central_app/pages/app/widgets/app_indexed_stack.dart';

import 'package:k_central_app/pages/feed_page.dart';
import 'package:k_central_app/pages/reviews_page.dart';
import 'package:k_central_app/pages/signin/signin_view_controller.dart';
import 'package:k_central_app/pages/signin_page.dart';
import 'package:k_central_app/pages/tutorial/tutorial_page.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Feed')),
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Reviews')),
    BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('Profile')),
  ];

  final List<Widget> bodyList = [
    FeedPage(),
    ReviewsPage(),
    SigninViewController()
  ];
  int currentIndex = 0;
  int _pState = 0;
  Future<bool> _onWillPop() {
    setState(() {
      currentIndex = _pState;
    });
  }

  void onTap(int index) {
    setState(() {
      _pState = currentIndex;
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userBox = Hive.box('user');
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: userBox.listenable(),
          builder: (context, box, widget) {
            // TODO verificar pq o hasCompleted está vindo null!
            return box.get(
              'isLogged',
            ) /*&& box.get('hasCompletedTutorial', defaultValue: false)*/
                ? BottomNavigationBar(
                    items: items,
                    currentIndex: currentIndex,
                    onTap: onTap,
                  )
                : Container(
                    height: 0,
                  );
          },
        ),
        // body: AppViewController(
        //   currentIndex: currentIndex,
        //   bodyList: bodyList,
        // ),
        body: userBox.get('isLogged')
            ? AppIndexedStack(
                bodyList: bodyList,
                currentIndex: currentIndex,
              )
            : TutorialPage(),
      ),
    );
  }
}
