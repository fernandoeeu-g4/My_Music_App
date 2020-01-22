// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedController on _FeedControllerBase, Store {
  final _$topAlbumsAtom = Atom(name: '_FeedControllerBase.topAlbums');

  @override
  ObservableFuture get topAlbums {
    _$topAlbumsAtom.context.enforceReadPolicy(_$topAlbumsAtom);
    _$topAlbumsAtom.reportObserved();
    return super.topAlbums;
  }

  @override
  set topAlbums(ObservableFuture value) {
    _$topAlbumsAtom.context.conditionallyRunInAction(() {
      super.topAlbums = value;
      _$topAlbumsAtom.reportChanged();
    }, _$topAlbumsAtom, name: '${_$topAlbumsAtom.name}_set');
  }

  final _$userTagsAtom = Atom(name: '_FeedControllerBase.userTags');

  @override
  ObservableFuture get userTags {
    _$userTagsAtom.context.enforceReadPolicy(_$userTagsAtom);
    _$userTagsAtom.reportObserved();
    return super.userTags;
  }

  @override
  set userTags(ObservableFuture value) {
    _$userTagsAtom.context.conditionallyRunInAction(() {
      super.userTags = value;
      _$userTagsAtom.reportChanged();
    }, _$userTagsAtom, name: '${_$userTagsAtom.name}_set');
  }

  final _$currentTagAtom = Atom(name: '_FeedControllerBase.currentTag');

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

  final _$_FeedControllerBaseActionController =
      ActionController(name: '_FeedControllerBase');

  @override
  void setCurrentTag(int tagId) {
    final _$actionInfo = _$_FeedControllerBaseActionController.startAction();
    try {
      return super.setCurrentTag(tagId);
    } finally {
      _$_FeedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadTopAlbumsByTag(String tag) {
    final _$actionInfo = _$_FeedControllerBaseActionController.startAction();
    try {
      return super.loadTopAlbumsByTag(tag);
    } finally {
      _$_FeedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadUserTags() {
    final _$actionInfo = _$_FeedControllerBaseActionController.startAction();
    try {
      return super.loadUserTags();
    } finally {
      _$_FeedControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
