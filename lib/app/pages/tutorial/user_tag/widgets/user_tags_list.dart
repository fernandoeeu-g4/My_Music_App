import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:k_central_app/models/Tag.dart';
import 'package:k_central_app/store/tag/tag_controller.dart';
import 'package:provider/provider.dart';
import 'package:k_central_app/store/user/user.dart';

class UserTagsList extends StatelessWidget {
  const UserTagsList({
    Key key,
    @required GlobalKey tagsListKey,
    @required this.expandedHeigth,
    @required this.onTap,
  }) : super(key: key);

  final int expandedHeigth;
  final onTap;

  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<User>(context);
    final tagController = Provider.of<TagController>(context);
    // print(userState.indexes);
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    bool isDark = brightnessValue == Brightness.dark;
    int h = (expandedHeigth / 100).floor() - 1;
    return Observer(
      builder: (_) => Column(
        children: <Widget>[
          SizedBox(height: 0, child: Text(tagController.counter.toString())),
          SizedBox(
            // key: _tagsListKey,
            height: expandedHeigth * 0.6,
            child: tagController.tags.length == 0
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          ((expandedHeigth * 0.6) / 100).floor() - 2,
                    ),
                    itemCount: tagController.tags.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return GestureDetector(
                        onTap: () => onTap(index),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: tagController.indexes.contains(index)
                                      ? 20
                                      : 0),
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: !tagController.tutorialSelectedTags
                                          .contains(index)
                                      ? Color(0xff30363B)
                                      : Color(0xffDFF8EB),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      tagController.tags[index].name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: tagController.tutorialSelectedTags
                                                .contains(index)
                                            ? Color(0xff30363B)
                                            : Color(0xffFBF5F3),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
