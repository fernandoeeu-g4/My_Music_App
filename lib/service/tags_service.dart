import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';

final dio = Dio();
final userBox = Hive.box('user');

class TagsService {
  // TagsService() {
  //   dio.options.headers['content-Type'] = 'application/json';
  //   dio.options.headers["authorization"] =
  //       "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsImlhdCI6MTU3OTUzNDM5N30.4RMlm7h-2epBHKHG383UBKaPPe_BqeQ-Slc71S_dWD0";
  // }
  String token = userBox.get('user').token;
  Future<Response> getTopTags() async {
    try {
      final String _url = '${DotEnv().env['ADONIS_URL']}/tags/top';
      Response response = await dio.get(_url,
          options: Options(headers: {'authorization': "Bearer $token"}));
      return response;
    } catch (e) {
      throw e;
    }
  }
}
