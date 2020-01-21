// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TagController on _TagController, Store {
  final _$screenHeightAtom = Atom(name: '_TagController.screenHeight');

  @override
  int get screenHeight {
    _$screenHeightAtom.context.enforceReadPolicy(_$screenHeightAtom);
    _$screenHeightAtom.reportObserved();
    return super.screenHeight;
  }

  @override
  set screenHeight(int value) {
    _$screenHeightAtom.context.conditionallyRunInAction(() {
      super.screenHeight = value;
      _$screenHeightAtom.reportChanged();
    }, _$screenHeightAtom, name: '${_$screenHeightAtom.name}_set');
  }

  final _$counterAtom = Atom(name: '_TagController.counter');

  @override
  int get counter {
    _$counterAtom.context.enforceReadPolicy(_$counterAtom);
    _$counterAtom.reportObserved();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.context.conditionallyRunInAction(() {
      super.counter = value;
      _$counterAtom.reportChanged();
    }, _$counterAtom, name: '${_$counterAtom.name}_set');
  }

  final _$indexesAtom = Atom(name: '_TagController.indexes');

  @override
  ObservableList<int> get indexes {
    _$indexesAtom.context.enforceReadPolicy(_$indexesAtom);
    _$indexesAtom.reportObserved();
    return super.indexes;
  }

  @override
  set indexes(ObservableList<int> value) {
    _$indexesAtom.context.conditionallyRunInAction(() {
      super.indexes = value;
      _$indexesAtom.reportChanged();
    }, _$indexesAtom, name: '${_$indexesAtom.name}_set');
  }

  final _$userSelectedTagsAtom = Atom(name: '_TagController.userSelectedTags');

  @override
  ObservableList<Tag> get userSelectedTags {
    _$userSelectedTagsAtom.context.enforceReadPolicy(_$userSelectedTagsAtom);
    _$userSelectedTagsAtom.reportObserved();
    return super.userSelectedTags;
  }

  @override
  set userSelectedTags(ObservableList<Tag> value) {
    _$userSelectedTagsAtom.context.conditionallyRunInAction(() {
      super.userSelectedTags = value;
      _$userSelectedTagsAtom.reportChanged();
    }, _$userSelectedTagsAtom, name: '${_$userSelectedTagsAtom.name}_set');
  }

  final _$tutorialSelectedTagsAtom =
      Atom(name: '_TagController.tutorialSelectedTags');

  @override
  ObservableList<int> get tutorialSelectedTags {
    _$tutorialSelectedTagsAtom.context
        .enforceReadPolicy(_$tutorialSelectedTagsAtom);
    _$tutorialSelectedTagsAtom.reportObserved();
    return super.tutorialSelectedTags;
  }

  @override
  set tutorialSelectedTags(ObservableList<int> value) {
    _$tutorialSelectedTagsAtom.context.conditionallyRunInAction(() {
      super.tutorialSelectedTags = value;
      _$tutorialSelectedTagsAtom.reportChanged();
    }, _$tutorialSelectedTagsAtom,
        name: '${_$tutorialSelectedTagsAtom.name}_set');
  }

  final _$tagsAtom = Atom(name: '_TagController.tags');

  @override
  ObservableList<Tag> get tags {
    _$tagsAtom.context.enforceReadPolicy(_$tagsAtom);
    _$tagsAtom.reportObserved();
    return super.tags;
  }

  @override
  set tags(ObservableList<Tag> value) {
    _$tagsAtom.context.conditionallyRunInAction(() {
      super.tags = value;
      _$tagsAtom.reportChanged();
    }, _$tagsAtom, name: '${_$tagsAtom.name}_set');
  }

  final _$getTagsAsyncAction = AsyncAction('getTags');

  @override
  Future getTags() {
    return _$getTagsAsyncAction.run(() => super.getTags());
  }

  final _$_TagControllerActionController =
      ActionController(name: '_TagController');

  @override
  void setScreenHeight(int val) {
    final _$actionInfo = _$_TagControllerActionController.startAction();
    try {
      return super.setScreenHeight(val);
    } finally {
      _$_TagControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTutorialSelectedTags(dynamic index) {
    final _$actionInfo = _$_TagControllerActionController.startAction();
    try {
      return super.setTutorialSelectedTags(index);
    } finally {
      _$_TagControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getItemsToAddPadding(dynamic offset, dynamic length) {
    final _$actionInfo = _$_TagControllerActionController.startAction();
    try {
      return super.getItemsToAddPadding(offset, length);
    } finally {
      _$_TagControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo = _$_TagControllerActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_TagControllerActionController.endAction(_$actionInfo);
    }
  }
}
