import 'package:flutter/material.dart';
import 'package:after_init/after_init.dart';
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

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> with AfterInitMixin<FeedPage> {
  final userBox = Hive.box('user');

  @override
  void didInitState() {
    final feed = Provider.of<Feed>(context);
    feed.getUserTags();
  }

  @override
  Widget build(BuildContext context) {
    
    return ValueListenableBuilder(
          valueListenable: userBox.listenable(),
          builder: (context, box, widget) {
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: <Widget>[
                    GenreRow(),
                    Text('sd'),
                  ],
                ),
                
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