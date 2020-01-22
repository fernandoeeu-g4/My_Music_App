import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:k_central_app/models/Tag.dart';

class UserRepository {
  final userBox = Hive.box('user');
  final Dio dio;
  String token;

  UserRepository(this.dio) {
    this.token = userBox.get('user').token;
  }

  Future<List<Tag>> getUserTags() async {
    final String _url = '${DotEnv().env['ADONIS_URL']}/user/tags';
    Response response = await dio.get(_url,options: Options(headers: {'authorization': "Bearer $token"} ));
    List<Tag> userTags = [];
    userTags.add(
      Tag(
        id: -1,
        name: 'Descubra',
        url: null
      )
    );
    for (var json in (response.data as List)) {
      Tag tag = Tag(
        id: json['id'],
        name: json['name'],
        url: json['url']
      );
      userTags.add(tag);
    }
    return userTags;
  }

}
