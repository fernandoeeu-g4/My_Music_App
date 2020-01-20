import 'package:k_central_app/models/Tag.dart';
import 'package:mobx/mobx.dart';
import 'package:k_central_app/service/tags_service.dart';

part 'tag_controller.g.dart';

class TagController = _TagController with _$TagController;

abstract class _TagController with Store {
  final _tagsService = TagsService();

  @observable
  int counter = 0;

  @observable
  ObservableList<int> indexes = ObservableList<int>();

  @observable
  ObservableList<Tag> userSelectedTags = ObservableList<Tag>();

  @observable
  ObservableList<int> tutorialSelectedTags = ObservableList<int>();

  @observable
  ObservableList<Tag> tags = ObservableList<Tag>();

  @action
  Future getTags() async {
    tags.clear();
    userSelectedTags.clear();
    try {
      var tagsResponse = await _tagsService.getTopTags();
      List aux = tagsResponse.data;
      aux.forEach((e) => tags.add(Tag(name: e['name'], url: e['url'])));
    } catch (e) {
      print(e);
    }
  }

  @action
  void setTutorialSelectedTags(index) {
    if (tutorialSelectedTags.contains(index)) {
      tutorialSelectedTags.removeAt(tutorialSelectedTags.indexOf(index));
    } else {
      tutorialSelectedTags.add(index);
    }
  }

  @action
  void getItemsToAddPadding(offset, length) {
    bool hasToAdd = false;
    int count = 0;
    for (int i = 0; i < length; i++) {
      if (count < offset) {
        if (hasToAdd) {
          indexes.add(i);
        }
        count++;
      }
      if (count == offset) {
        hasToAdd = !hasToAdd;
        count = 0;
      }
    }
  }

  @action
  void increment() {
    counter++;
  }
}
