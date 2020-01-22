import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:k_central_app/app/pages/feed/feed_controller.dart';
import 'package:k_central_app/models/Album.dart';

class TopAlbumsByTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final feedController = Modular.get<FeedController>();
    return Expanded(
      child: Observer(
        builder: (_) {
          if (feedController.topAlbums.error != null) {
            return Center(
              child: Text('Deu erro!'),
            );
          }
          if (feedController.topAlbums.value == null) {
            return CircularProgressIndicator();
          }
          final topAlbums = feedController.topAlbums.value; 
          return ListView.builder(
            // scrollDirection: Axis.horizontal,
            itemCount: topAlbums.length,
            itemBuilder: (BuildContext ctx, int index) {
              final Album album = topAlbums[index];
              return Text(album.name);
            },
          );
        },
      ),
    );
  }
}
