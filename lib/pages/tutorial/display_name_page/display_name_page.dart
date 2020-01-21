import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:k_central_app/pages/app/app.dart';
import 'package:k_central_app/pages/feed_page.dart';
import 'package:k_central_app/pages/tutorial/display_name_page/widgets/custom_back_button.dart';
import 'package:k_central_app/pages/tutorial/display_name_page/widgets/custom_continue_button.dart';
import 'package:k_central_app/pages/tutorial/display_name_page/widgets/display_name_input.dart';
import 'package:k_central_app/pages/tutorial/user_tag/user_tag_page.dart';
import 'package:k_central_app/store/user/user.dart';
import 'package:k_central_app/widgets/mini_banner_text.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class DisplayNamePage extends StatefulWidget {
  @override
  _DisplayNamePageState createState() => _DisplayNamePageState();
}

class _DisplayNamePageState extends State<DisplayNamePage>
    with AfterInitMixin<DisplayNamePage> {
  final TextEditingController _displayNameController = TextEditingController();

  @override
  void didInitState() {
    final userState = Provider.of<User>(context);
    userState.setDisplayName('');
  }

  @override
  Widget build(BuildContext context) {
    final userBox = Hive.box('user');
    final userState = Provider.of<User>(context);
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;
    return ValueListenableBuilder(
        valueListenable: Hive.box('user').listenable(),
        builder: (context, box, widget) {
          final Brightness brightnessValue =
              MediaQuery.of(context).platformBrightness;
          bool isDark = brightnessValue == Brightness.dark;
          return Observer(
            builder: (_) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: WillPopScope(
                onWillPop: () {
                  Navigator.pop(context);
                },
                child: GestureDetector(
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: isDark
                              ? [
                                  const Color(0xff2C5364),
                                  const Color(0xff0F2027)
                                ]
                              : [
                                  const Color(0xffEB73B2),
                                  const Color(0xFFBF176E)
                                ]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: _screenHeight / 3),
                              child: MiniBannerText(
                                miniBannerMargin: EdgeInsets.only(top: 1),
                                screenWidth: _screenWidth,
                                bannerText: 'Como gostaria de ser chamado(a)?',
                                textSize: 40,
                                widthRatio: 1.2,
                              ),
                            ),
                            DisplayNameInput(
                              controller: _displayNameController,
                              onChanged: (value) {
                                userState.setDisplayName(value);
                              },
                            ),
                          ],
                        ),
                        // ButtonRow
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CustomBackButton(),
                            CustomContinueButton(
                              isDark: true,
                              onTap: userState.displayName.length == 0
                                  ? () {
                                      print(userState.displayName);
                                    }
                                  : () {
                                      userBox.put('isLogged', true);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => App(),
                                        ),
                                      );
                                    },
                              screenWidth: _screenWidth,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
