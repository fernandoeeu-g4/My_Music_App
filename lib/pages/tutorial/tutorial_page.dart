import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:k_central_app/pages/signin/signin_view_controller.dart';
import 'package:k_central_app/pages/signin_page.dart';
import 'package:k_central_app/pages/tutorial/display_name_page/display_name_page.dart';
import 'package:k_central_app/util/my_constants.dart';
import 'package:k_central_app/widgets/mini_banner_text.dart';
import 'package:k_central_app/widgets/tutorial_button.dart';

class TutorialPage extends StatefulWidget {
  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    const TextStyle _bannerTextStyle =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 60.0, height: 0.9);
    return ValueListenableBuilder(
      valueListenable: Hive.box('user').listenable(),
      builder: (context, box, widget) {
        final Brightness brightnessValue =
            MediaQuery.of(context).platformBrightness;
        bool isDark = brightnessValue == Brightness.dark;

        return Scaffold(
          body: Container(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: MyConstants.of(context).mainBannerMargin,
                      child: Wrap(
                        direction: Axis.vertical,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Pesquise,',
                            style: _bannerTextStyle,
                          ),
                          Text(
                            'Descubra,',
                            style: _bannerTextStyle,
                          ),
                          Text(
                            'Critique.',
                            style: _bannerTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        MiniBannerText(
                          miniBannerMargin:
                              MyConstants.of(context).miniBannerMargin,
                          screenWidth: _screenWidth,
                          bannerText:
                              'Pesquise por álbuns, músicas e artistas.',
                          textSize: 24,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        MiniBannerText(
                          miniBannerMargin:
                              MyConstants.of(context).miniBannerMargin,
                          screenWidth: _screenWidth,
                          bannerText: 'Faça reviews e exponha sua opinião.',
                          textSize: 24,
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // await L
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //       type: PageTransitionType.rightToLeft,
                    //       child: DisplayNamePage(),
                    //     ));

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SigninPage()),
                    );
                  },
                  child: TutorialButton(
                      isDark: isDark,
                      screenWidth: _screenWidth,
                      label: 'Continuar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
