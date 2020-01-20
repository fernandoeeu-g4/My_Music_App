import 'package:k_central_app/models/feed_genre.dart';
import 'package:mobx/mobx.dart';

part 'feed.g.dart';

class Feed = _Feed with _$Feed;

abstract class _Feed with Store {
  @observable
  int counter = 0;

  @observable
  ObservableList<FeedGenre> feedGenres = ObservableList<FeedGenre>();

  @action
  void initFeedGenres() {
    feedGenres.add(FeedGenre(title: 'kpop', label: 'k-pop', id: 0));
    feedGenres.add(FeedGenre(title: 'hip-hop', label: 'hip-hop', id: 1));
    feedGenres.add(FeedGenre(title: 'pop', label: 'pop', id: 2));
    feedGenres.add(FeedGenre(title: 'r&b', label: 'r&b', id: 3));
    feedGenres.add(FeedGenre(title: 'jazz', label: 'jazz', id: 4));
    feedGenres.add(FeedGenre(title: 'soul', label: 'soul', id: 5));
  }

  @observable
  int _currentFeedGenreId = 0;

  @computed
  int get getCurrentFeedGenreId => _currentFeedGenreId;
  

  // actions

  @action
  void increment() {
    counter++;
  }

  @action
  void setCurrentFeedGenreId(int id) {
    _currentFeedGenreId = id;
  }


}