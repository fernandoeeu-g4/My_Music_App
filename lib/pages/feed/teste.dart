import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'package:k_central_app/store/user/user.dart';

import 'package:hive_flutter/hive_flutter.dart';

class Teste extends StatelessWidget {
  final userBox = Hive.box('user');
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
          valueListenable: userBox.listenable(),
          builder: (context, box, widget) {
            final userState = Provider.of<User>(context);
            // userState.fetchUserTags();
            return Scaffold(
              body: SafeArea(
                child: Text(box.get('counter').toString()),
                // child: Observer(
                //   builder: (_) => Column(
                //     // children: <Widget>[GenreRow()],
                //     children: <Widget>[Text('oi')],
                //   ),
                // ),
              ),
            );
          },
        );
  }
}