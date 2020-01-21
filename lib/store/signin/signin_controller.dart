import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:k_central_app/models/userdata.dart';
import 'package:k_central_app/service/user_service.dart';
import 'package:mobx/mobx.dart';

part 'signin_controller.g.dart';

class SigninController = _SigninController with _$SigninController;

abstract class _SigninController with Store {
  var dio = Dio();
  final UserService userService = UserService();
  final storage = FlutterSecureStorage();
  final userBox = Hive.box('user');
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @observable
  bool isSignedIn = false;

  @observable
  bool showErrorDialog = false;

  @action
  void setIsSignedIn(val) {
    isSignedIn = val;
  }

  void initialize() {
    isSignedIn = userBox.get('isLogged');
  }

  @action
  void toggleShowErrorDialog() => showErrorDialog = !showErrorDialog;

  // @action
  // initLogin() {
  //   _googleSignIn.onCurrentUserChanged
  //       .listen((GoogleSignInAccount account) async {
  //     if (account != null) {
  //     } else {}
  //   });
  //   _googleSignIn.signInSilently().whenComplete(() => print('logado'));
  // }

  @action
  doLogout() async {
    try {
      print('saindo');
      bool isL = await _googleSignIn.isSignedIn();
      // print('esá logado? ' + isL.toString());
      // if (isL) {
      await _googleSignIn.signOut();
      userBox.put('isLogged', false);
      // }
    } catch (error) {
      print(error);
    }
  }

  bool _saveUserData(UserData user) {
    userBox.put('user', user);
    // return true;
    return true;
    // return true;
    // userBox.put('google_id', user.googleId);
    // userBox.put('token', user.token);
  }

  @action
  doLogin() async {
    print('begin sign method');
    try {
      bool isL = await _googleSignIn.isSignedIn();
      if (isL) {
        await doLogout();
      }

      final res = await _googleSignIn.signIn();
      Response response = await userService.getUserData(res);
      UserData user = UserData(
        email: response.data['user']['email'],
        username: response.data['user']['username'],
        googleId: response.data['user']['google_id'],
        token: response.data['token'],
      );
      bool result = _saveUserData(user);
      return result;
    } catch (error) {
      print(error);
    }
  }
}
