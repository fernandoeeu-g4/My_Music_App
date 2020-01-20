import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserService {
  final dio = Dio();
  final userBox = Hive.box('user');
  Future<Response> getUserData(user) async {
    try {
      final String _url = '${DotEnv().env['ADONIS_URL']}/signup';
      final _data = {"email": user.email, "google_id": user.id};
      userBox.put('signinLoading', true);
      Response response = await dio.post(_url, data: _data);
      userBox.put('signinLoading', false);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
