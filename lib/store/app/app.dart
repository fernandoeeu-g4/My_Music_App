import 'package:mobx/mobx.dart';

part 'app.g.dart';

class App = _App with _$App;

enum TabItem { feed, reviews, profile }

abstract class _App with Store {
  @observable
  TabItem tab = TabItem.feed;

  @observable
  int bottomNavigationIndex = 0;

  // actions

  @action
  void changeTab(TabItem tab) => this.tab = tab;

  @action
  void setBottomNavigationIndex(index) {
    bottomNavigationIndex = index;
  }
}