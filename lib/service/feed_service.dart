import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';

final dio = Dio();
final userBox = Hive.box('user');

class FeedService {
    String token = userBox.get('user').token;

    Future<Response> getUserTags() async {
      final String _url = '${DotEnv().env['ADONIS_URL']}/user/tags';
      Response response = await dio.get(_url,options: Options(headers: {'authorization': "Bearer $token"} ));
      return response;
    }
}
