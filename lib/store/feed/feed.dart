import 'package:k_central_app/models/Tag.dart';
import 'package:k_central_app/models/feed_genre.dart';
import 'package:k_central_app/service/feed_service.dart';
import 'package:mobx/mobx.dart';

part 'feed.g.dart';

class Feed = _Feed with _$Feed;

abstract class _Feed with Store {
  final feedService = FeedService();

  @observable
  int counter = 0;

  @observable
  ObservableList<Tag> feedTags = ObservableList<Tag>();
  
  @observable
  int currentTag = 0;
  // actions

  @action
  void increment() {
    counter++;
  }

  @action
  void setCurrentTag(int tagId) {
    currentTag = tagId;
  }

  @action
  Future getUserTags() async {
    var response = await feedService.getUserTags();
    print(response.data);
    List aux = response.data;
    aux.forEach((i) => print(i));
    feedTags.add(
      Tag(
        id: -1,
        name: 'Descubra',
        url: null
      )
    );
    aux.forEach((tag) => feedTags.add(
      Tag(
        name: tag['name'],
        url: tag['url'],
        id: tag['id']
      )
    ));
    print(feedTags.length);
  }

 


}