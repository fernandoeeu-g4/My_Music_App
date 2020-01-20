import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'dart:math' as Math;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:k_central_app/models/Tag.dart';
import 'package:k_central_app/pages/tutorial/user_tag/widgets/user_tags_list.dart';
import 'package:k_central_app/store/tag/tag_controller.dart';
import 'package:provider/provider.dart';
import 'package:k_central_app/store/user/user.dart';

class UserTag extends StatefulWidget {
  @override
  _UserTagState createState() => _UserTagState();
}

class _UserTagState extends State<UserTag> with AfterInitMixin<UserTag> {
  GlobalKey _tagsListKey = GlobalKey();
  final ValueNotifier<double> _rowHeight = ValueNotifier<double>(-1);
  @override
  didInitState() {
    final userState = Provider.of<User>(context);
    final double _screenHeight = MediaQuery.of(context).size.height;
    // print((_screenHeight * 0.6 / 100 - 2).floor());

    final tagController = Provider.of<TagController>(context);
    tagController.getItemsToAddPadding((_screenHeight / 100 * 0.6 - 2).floor(), tagController.tags.length);
    tagController.getTags();
  }

  // @override
  // initState() {
    
  //   super.initState();
  // }

  // double _getSize(GlobalKey key) {
  //   print('key');
  //   print(key.currentContext);
  //   // final RenderBox box = key.currentContext.findRenderObject();
  //   // final size = box.size;
  //   // return size.height;
  // }



  @override
  Widget build(BuildContext context) {
    final tagController = Provider.of<TagController>(context);
    // GlobalKey _key = GlobalKey();
    // int _getSize() {
    //   print(_key);
    //   final RenderBox renderBox = _key.currentContext.findRenderObject();
    //   final Size size = renderBox.size;
    //   print( size.height.floor());
    //   return size.height.floor();
    // }
    // int expandedHeigth;
    // WidgetsBinding.instance
    //     .addPostFrameCallback((_) => _getSize());

    final userState = Provider.of<User>(context);
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;
    // final int _gridItems = ((_screenHeight * 0.6) / 100).floor() - 1;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ValueListenableBuilder(
        valueListenable: Hive.box('user').listenable(),
        builder: (context, box, widget) {
          final Brightness brightnessValue =
              MediaQuery.of(context).platformBrightness;
          bool isDark = brightnessValue == Brightness.dark;
          return Container(
            height: _screenHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isDark
                      ? [const Color(0xff2C5364), const Color(0xff0F2027)]
                      : [const Color(0xffEB73B2), const Color(0xFFBF176E)]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 60, 10, 30),
                      child: Container(
                        width: _screenWidth * 0.7,
                        child: Text(
                          'O que você gosta de ouvir?',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Observer(
                  builder: (_) => UserTagsList(
                    tagsListKey: _tagsListKey,
                    expandedHeigth: _screenHeight.floor(),
                    onTap: (index) {
                      tagController.setTutorialSelectedTags(index);
                      tagController.increment();
                    },
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// happening right after build is completed
// WidgetsBinding.instance.addPostFrameCallback((_) => {
//   getItemsToAddPading(3, tags.length),
//   // print(indexes)
// });
