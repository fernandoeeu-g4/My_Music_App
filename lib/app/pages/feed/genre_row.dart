import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:k_central_app/app/pages/feed/genre_item.dart';
import 'package:k_central_app/models/Tag.dart';
import 'package:provider/provider.dart';
import 'package:k_central_app/app/pages/feed/feed_controller.dart';

class GenreRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final feedController = Modular.get<FeedController>();
    return Observer(builder: (_) {
      if (feedController.userTags.error != null) {
        return Center(
          child: Text('deu erro'),
        );
      }
      if (feedController.userTags.value == null) {
        return CircularProgressIndicator();
      }
      final List<Tag> userTags = feedController.userTags.value;
      return Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 80,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: userTags.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return GenreItem(
                      name: userTags[index].name,
                      url: userTags[index].url,
                      id: index);
                },
              ),
            ),
          ),
        ],
      );
    }
        //  Row(
        //       children: <Widget>[
        //         Expanded(
        //           child: Container(
        //             height: 80,
        //             padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        //             child: ListView.builder(
        //               scrollDirection: Axis.horizontal,
        //               itemCount: feedController.userTags.value.length,
        //               itemBuilder: (BuildContext ctx, int index) {
        //                 return GenreItem(
        //                     name: feedState.feedTags[index].name,
        //                     url: feedState.feedTags[index].url,
        //                     id: index,);
        //                 // return Text(feedState.feedGenres[index].label);
        //               },
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        );
  }
}
