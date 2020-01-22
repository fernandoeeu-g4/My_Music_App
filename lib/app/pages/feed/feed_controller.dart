import 'package:k_central_app/app/shared/repositories/album_respotory.dart';
import 'package:k_central_app/app/shared/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
part 'feed_controller.g.dart';

class FeedController = _FeedControllerBase with _$FeedController;

abstract class _FeedControllerBase with Store {
  _FeedControllerBase(this.albumRepository, this.userRepository);

  final AlbumRepository albumRepository;
  final UserRepository userRepository;

  @observable
  ObservableFuture topAlbums;

  @observable
  ObservableFuture userTags;

  @observable
  int currentTag = 0;

  @action
  void setCurrentTag(int tagId) {
    currentTag = tagId;
  }

  @action
  void loadTopAlbumsByTag(String tag) {
    topAlbums = albumRepository.getTopAlbumsByTag(tag).asObservable();
  }

  @action
  void loadUserTags() {
    userTags = userRepository.getUserTags().asObservable();
  }


}