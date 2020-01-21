import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:k_central_app/pages/feed/genre_item.dart';
import 'package:k_central_app/store/feed/feed.dart';
import 'package:provider/provider.dart';

class GenreRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final feedState = Provider.of<Feed>(context);
    print(feedState.feedTags);
    return Observer(
          builder: (_) => Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 80,
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: feedState.feedTags.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return GenreItem(
                              name: feedState.feedTags[index].name,
                              url: feedState.feedTags[index].url,
                              id: index,);
                          // return Text(feedState.feedGenres[index].label);
                        },
                      ),
                    ),
                  ),
                ],
              ),
    );
  }
}
