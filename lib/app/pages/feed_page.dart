import 'package:flutter/material.dart';
import 'package:after_init/after_init.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:k_central_app/app/pages/feed/feed_controller.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:k_central_app/app/pages/feed/top_albums_by_tag.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'feed/genre_row.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> with AfterInitMixin<FeedPage> {
  final userBox = Hive.box('user');

  @override
  void didInitState() {
    final feedController = Modular.get<FeedController>();
    feedController.loadUserTags();
    // feed.loadTopAlbumsByTag('kpop');
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    final feedController = Modular.get<FeedController>();
    return ValueListenableBuilder(
      valueListenable: userBox.listenable(),
      builder: (context, box, widget) {
        return Scaffold(
          body: SafeArea(
            child: SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              onRefresh: () async {
                feedController.loadUserTags();
                feedController.loadTopAlbumsByTag('kpop');
                _refreshController.refreshCompleted();
              },
              onLoading: () {
                
              },
              child: Column(
                children: <Widget>[
                  GenreRow(),
                  Text('Top ALbums by Genre'),
                  TopAlbumsByTag()
                ],
              ),
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
