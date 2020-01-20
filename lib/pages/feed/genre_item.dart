import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:k_central_app/store/feed/feed.dart';
import 'package:provider/provider.dart';

class GenreItem extends StatelessWidget {
  GenreItem({this.label, this.current, this.local});


  final String label;
  final int current;
  final int local;

  @override
  Widget build(BuildContext context) {
    final feedState = Provider.of<Feed>(context);
    return Observer(
      builder: (_) => Row(
        children: <Widget>[
          // Text(feedState.counter.toString()),
          SizedBox(
            width: local == 0 ? 15 : 5.0,
          ),
          GestureDetector(
            onTap: () => feedState.setCurrentFeedGenreId(local),
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                color: feedState.getCurrentFeedGenreId == local ? Colors.pinkAccent : Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                        color: feedState.getCurrentFeedGenreId == local ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
