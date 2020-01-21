import 'package:after_init/after_init.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:k_central_app/pages/signin/widgets/custom_google_button.dart';
import 'package:k_central_app/pages/tutorial/display_name_page/display_name_page.dart';
import 'package:k_central_app/widgets/mini_banner_text.dart';
import 'package:provider/provider.dart';
import 'package:k_central_app/store/signin/signin_controller.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> with AfterInitMixin<SigninPage> {

  @override
  void didInitState() async {
    // print('teste');
    // final signinState = Provider.of<SigninController>(context);
    // await signinState.doLogout();
  }

  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;
    // final signinState = SigninController();
    final signinState = Provider.of<SigninController>(context);
    final userBox = Hive.box('user');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ValueListenableBuilder(
        valueListenable: userBox.listenable(),
        builder: (context, box, widget) {
          // box.put('signinLoading', false);
          final Brightness brightnessValue =
              MediaQuery.of(context).platformBrightness;
          bool isDark = brightnessValue == Brightness.dark;
          return Container(
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
                    Container(
                      padding:
                          EdgeInsets.only(top: _screenWidth / 1.8, left: 30),
                      child: MiniBannerText(
                        miniBannerMargin: EdgeInsets.all(10),
                        screenWidth: _screenWidth / 1.2,
                        bannerText: 'Entre com sua conta do Google.',
                        textSize: 40,
                        widthRatio: 1.2,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    CustomGoogleButton(
                      loading: false,
                      // loading: false,
                      onTap: () async {
                        try {
                          var response = await signinState.doLogin();
                          if (response) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DisplayNamePage()),
                            );
                          }
                        } catch (error) {
                          userBox.put('isLogged', false);
                          EasyDialog(
                            title: Text(
                              "Basic Easy Dialog Title",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              textScaleFactor: 1.2,
                            ),
                            description: Text(
                              'Por favor, tente fazer login novamente.',
                              style: TextStyle(color: Colors.black),
                            ),
                          ).show(context);
                          print(error);
                        }
                      },
                      screenWidth: _screenWidth,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: _screenHeight / 6,
                      ),
                      child: Text(
                        'Cancelar',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                // Text(
                //   box.get('isLogged', defaultValue: false).toString(),
                // ),
                RaisedButton(
                  onPressed: () {
                    signinState.doLogout();
                  },
                  child: Text('sair'),
                ),

                // ValueListenableBuilder(
                //     valueListenable: userBox.listenable(),
                //     builder: (context, box, widget) {
                //       return Text(box.get('isLogged').toString());
                //     })
              ],
            ),
          );
        },
      ),
    );
  }
}
