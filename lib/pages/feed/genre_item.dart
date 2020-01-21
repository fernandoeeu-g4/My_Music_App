import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:k_central_app/store/feed/feed.dart';
import 'package:provider/provider.dart';

class GenreItem extends StatelessWidget {
  GenreItem({this.name, this.url, this.id});


  final String name;
  final String url;
  final int id;

  @override
  Widget build(BuildContext context) {
    final feedState = Provider.of<Feed>(context);
    return Observer(
      builder: (_) => Row(
        children: <Widget>[
          // Text(feedState.counter.toString()),
          SizedBox(
            width: id == 0 ? 15 : 5.0,
          ),
          GestureDetector(
            onTap: () => feedState.setCurrentTag(id),
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                color: feedState.currentTag == id ? Colors.pinkAccent : Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: Center(
                  child: Text(
                    name,
                    style: TextStyle(
                        color: feedState.currentTag == id ? Colors.white : Colors.black,
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
