/// home.dart
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:k_central_app/pages/app/app.dart';
import 'package:k_central_app/models/userdata.dart';
import 'package:k_central_app/store/feed/feed.dart';
import 'package:k_central_app/store/signin/signin_controller.dart';
import 'package:k_central_app/store/user/user.dart';
import 'package:k_central_app/store/tag/tag_controller.dart';
import 'package:k_central_app/util/my_constants.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:k_central_app/util/themes.dart' as appTheme;
import 'package:provider/provider.dart';

const darkModeBox = 'darkModeBox';

Future main() async {
   WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Future _openBoxes() async {
    Hive.init(appDocumentDirectory.path);
    Hive.registerAdapter(UserDataAdapter());
    // await Hive.openBox('user');
    return await Hive.openBox('user');
  }

 

  await DotEnv().load('.env');
  runApp(MultiProvider(
    providers: [
      Provider<User>(
        create: (_) => User(),
      ),
      Provider<SigninController>(
        create: (_) => SigninController()
      ),
      Provider<Feed>(
        create: (_) => Feed(),
      ),
      Provider<TagController>(
        create: (_) => TagController(),
      )
    ],
    child: MyConstants(
      child: MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          primaryColorDark: Colors.red,
          accentColor: Colors.red,
        ),
        theme: appTheme.DefaultThemeData,
        home: FutureBuilder(
            future: _openBoxes(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError)
                  return Text(snapshot.error.toString());
                else
                  return App();
              } else {
                return Scaffold();
              }
            }),
      ),
    ),
  ));
}
