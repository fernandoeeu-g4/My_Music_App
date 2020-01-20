import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:k_central_app/main.dart';
import 'package:k_central_app/pages/feed/genre_row.dart';
import 'package:k_central_app/pages/reviews_page.dart';
import 'package:k_central_app/store/signin/signin_controller.dart';
import 'package:k_central_app/util/router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:k_central_app/store/feed/feed.dart';
import 'package:k_central_app/store/user/user.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final userBox = Hive.box('user');

@override
  void didChangeDependencies() {
    final userState = Provider.of<User>(context);
    final signinState = Provider.of<SigninController>(context);
    userState.fetchUserTags();
    print('feed page');
    // signinState.doLogout();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    
    return ValueListenableBuilder(
          valueListenable: userBox.listenable(),
          builder: (context, box, widget) {
            return Scaffold(
              body: SafeArea(
                child: Text(box.get('counter').toString()),
                // child: Observer(
                //   builder: (_) => Column(
                //     // children: <Widget>[GenreRow()],
                //     children: <Widget>[Text('oi')],
                //   ),
                // ),
              ),
            );
          },
        );
  }
}


// ValueListenableBuilder(
//           valueListenable: userBox.listenable(),
//           builder: (context, box, widget) {
//             print('-----------------------');
//             print(box.get('displayName'));
//             print(box.get('user').token);
//             print(box.get('user').username);
//             print(box.get('user').email);
//             print(box.get('user').googleId);
//             final userState = Provider.of<User>(context);
//             // userState.fetchUserTags(box);
//             return Scaffold(
//               body: SafeArea(
//                 child: Text('oi'),
//                 // child: Observer(
//                 //   builder: (_) => Column(
//                 //     // children: <Widget>[GenreRow()],
//                 //     children: <Widget>[Text('oi')],
//                 //   ),
//                 // ),
//               ),
//             );
//           },
//         ),