import 'package:k_central_app/models/Tag.dart';
import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

part 'user.g.dart';

class User = _User with _$User;

abstract class _User with Store {
  var dio = Dio();
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
  void setExpandedKey(GlobalKey key) {
    expandedKey = key;
  }

  @action
  void increment() {
    counter++;
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
