import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:k_central_app/models/Album.dart';
import 'package:k_central_app/models/Tag.dart';

class AlbumRepository {
  final userBox = Hive.box('user');
  final Dio dio;
  String token;

  AlbumRepository(this.dio) {
    this.token = userBox.get('user').token;
  }

  Future<List<Album>> getTopAlbumsByTag(String tag) async {
    final String _url = '${DotEnv().env['ADONIS_URL']}/top/albums/$tag';
    Response response = await dio.post(_url,
        data: {'limit': 10},
        options: Options(headers: {'authorization': "Bearer $token"}));
    List<Album> topAlbums = [];
    // List list = response.data['albums']['album'];
    for (var json in (response.data['albums']['album'] as List)) {
      Album album = Album.fromJson(json);
      topAlbums.add(album);
    }
    return topAlbums;
  }
}
