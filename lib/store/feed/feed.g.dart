// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Feed on _Feed, Store {
  final _$counterAtom = Atom(name: '_Feed.counter');

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

  final _$feedTagsAtom = Atom(name: '_Feed.feedTags');

  @override
  ObservableList<Tag> get feedTags {
    _$feedTagsAtom.context.enforceReadPolicy(_$feedTagsAtom);
    _$feedTagsAtom.reportObserved();
    return super.feedTags;
  }

  @override
  set feedTags(ObservableList<Tag> value) {
    _$feedTagsAtom.context.conditionallyRunInAction(() {
      super.feedTags = value;
      _$feedTagsAtom.reportChanged();
    }, _$feedTagsAtom, name: '${_$feedTagsAtom.name}_set');
  }

  final _$currentTagAtom = Atom(name: '_Feed.currentTag');

  @override
  int get currentTag {
    _$currentTagAtom.context.enforceReadPolicy(_$currentTagAtom);
    _$currentTagAtom.reportObserved();
    return super.currentTag;
  }

  @override
  set currentTag(int value) {
    _$currentTagAtom.context.conditionallyRunInAction(() {
      super.currentTag = value;
      _$currentTagAtom.reportChanged();
    }, _$currentTagAtom, name: '${_$currentTagAtom.name}_set');
  }

  final _$getUserTagsAsyncAction = AsyncAction('getUserTags');

  @override
  Future getUserTags() {
    return _$getUserTagsAsyncAction.run(() => super.getUserTags());
  }

  final _$_FeedActionController = ActionController(name: '_Feed');

  @override
  void increment() {
    final _$actionInfo = _$_FeedActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_FeedActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentTag(int tagId) {
    final _$actionInfo = _$_FeedActionController.startAction();
    try {
      return super.setCurrentTag(tagId);
    } finally {
      _$_FeedActionController.endAction(_$actionInfo);
    }
  }
}
