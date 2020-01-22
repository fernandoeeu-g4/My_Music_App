import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:k_central_app/app/pages/app/app.dart';
import 'package:k_central_app/app/pages/feed/feed_controller.dart';
import 'package:k_central_app/app/shared/repositories/album_respotory.dart';
import 'package:k_central_app/app/pages/home/home_page.dart';
import 'package:k_central_app/app/shared/repositories/user_repository.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    Bind((i) => FeedController(i.get<AlbumRepository>(), i.get<UserRepository>())),
    Bind((i) => AlbumRepository(i.get<Dio>())),
    Bind((i) => UserRepository(i.get<Dio>())),
    Bind((i) => Dio())
  ];

  @override
  List<Router> get routers => [
    Router('/', child: (_, args) => HomePage()),
    // Router('/signin', child: (_, args) => )https://9850e4f2.ngrok.io/
  ];

  @override
  Widget get bootstrap => AppWidget();

}