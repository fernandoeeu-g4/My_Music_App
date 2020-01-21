import 'package:k_central_app/models/Tag.dart';
import 'package:k_central_app/store/tag/tag_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

part 'user.g.dart';

class User = _User with _$User;

abstract class _User with Store {
  var dio = Dio();
  final tagController = TagController();
  final userBox = Hive.box('user');
  // final darkModeBox = Hive.box('darkModeBox');

  @observable
  ObservableList<Tag> userTags = ObservableList<Tag>();

  @observable
  int counter = 0;

  @observable
  String displayName = '';

  @observable
  ObservableList<int> tutorialSelectedTags = ObservableList<int>();

  @observable
  GlobalKey expandedKey;
  
  

  @action
  void setUserFavoriteTags(lista) {
    print(lista);
  }

  @action
  void setExpandedKey(GlobalKey key) {
    expandedKey = key;
  }

  @action
  void increment() {
    counter++;
  }

  @action
  void finishStart() {
    userBox.put('isLogged', true);
  }

  @action
  void setDisplayName(val) {
    print(val);
    displayName = val;
    userBox.put('displayName', val);
  }

  @action
  fetchUserTags() async {
    userBox.put('counter', counter);
    final String url = '${DotEnv().env['ADONIS_URL']}/user/tag';
  }
}
