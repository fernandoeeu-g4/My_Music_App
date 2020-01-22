import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:k_central_app/app/pages/tutorial/display_name_page/widgets/custom_back_button.dart';
import 'package:k_central_app/app/pages/tutorial/display_name_page/widgets/custom_continue_button.dart';
import 'package:k_central_app/app/pages/tutorial/user_tag/widgets/user_tags_list.dart';
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
    final double _screenHeight = MediaQuery.of(context).size.height;
    // print((_screenHeight * 0.6 / 100 - 2).floor());

    final tagController = Provider.of<TagController>(context);
    int offset = (_screenHeight / 100 * 0.6 - 2).floor();
    tagController.setScreenHeight(offset);
    tagController.getTags();
  }

  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<User>(context);
    final tagController = Provider.of<TagController>(context);
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomBackButton(),
                    CustomContinueButton(
                      screenWidth: _screenWidth,
                      isDark: true,
                      onTap: () {
                        userState.setUserFavoriteTags(tagController.tutorialSelectedTags);
                        
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
