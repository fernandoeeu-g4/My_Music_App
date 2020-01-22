import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:k_central_app/app/pages/app/widgets/app_indexed_stack.dart';
import 'package:k_central_app/app/pages/tutorial/tutorial_page.dart';
import 'package:k_central_app/utils/app_constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            return box.get('isLogged')
                ? BottomNavigationBar(
                    items: AppConstants.bottomNavigationItems,
                    currentIndex: currentIndex,
                    onTap: onTap,
                  )
                : Container(
                    height: 0,
                  );
          },
        ),
        body: ValueListenableBuilder(
          valueListenable: userBox.listenable(),
          builder: (context, box, widget) {
            return userBox.get('isLogged')
            ? AppIndexedStack(
              bodyList: AppConstants.bodyList,
              currentIndex: currentIndex,
            )
            : TutorialPage();
          },
        ),
      ),
    );
  }
}
