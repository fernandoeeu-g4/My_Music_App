// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$User on _User, Store {
  final _$userTagsAtom = Atom(name: '_User.userTags');

  @override
  ObservableList<Tag> get userTags {
    _$userTagsAtom.context.enforceReadPolicy(_$userTagsAtom);
    _$userTagsAtom.reportObserved();
    return super.userTags;
  }

  @override
  set userTags(ObservableList<Tag> value) {
    _$userTagsAtom.context.conditionallyRunInAction(() {
      super.userTags = value;
      _$userTagsAtom.reportChanged();
    }, _$userTagsAtom, name: '${_$userTagsAtom.name}_set');
  }

  final _$counterAtom = Atom(name: '_User.counter');

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

  final _$displayNameAtom = Atom(name: '_User.displayName');

  @override
  String get displayName {
    _$displayNameAtom.context.enforceReadPolicy(_$displayNameAtom);
    _$displayNameAtom.reportObserved();
    return super.displayName;
  }

  @override
  set displayName(String value) {
    _$displayNameAtom.context.conditionallyRunInAction(() {
      super.displayName = value;
      _$displayNameAtom.reportChanged();
    }, _$displayNameAtom, name: '${_$displayNameAtom.name}_set');
  }

  final _$tutorialSelectedTagsAtom = Atom(name: '_User.tutorialSelectedTags');

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

  final _$expandedKeyAtom = Atom(name: '_User.expandedKey');

  @override
  GlobalKey<State<StatefulWidget>> get expandedKey {
    _$expandedKeyAtom.context.enforceReadPolicy(_$expandedKeyAtom);
    _$expandedKeyAtom.reportObserved();
    return super.expandedKey;
  }

  @override
  set expandedKey(GlobalKey<State<StatefulWidget>> value) {
    _$expandedKeyAtom.context.conditionallyRunInAction(() {
      super.expandedKey = value;
      _$expandedKeyAtom.reportChanged();
    }, _$expandedKeyAtom, name: '${_$expandedKeyAtom.name}_set');
  }

  final _$fetchUserTagsAsyncAction = AsyncAction('fetchUserTags');

  @override
  Future fetchUserTags() {
    return _$fetchUserTagsAsyncAction.run(() => super.fetchUserTags());
  }

  final _$_UserActionController = ActionController(name: '_User');

  @override
  void setUserFavoriteTags(dynamic lista) {
    final _$actionInfo = _$_UserActionController.startAction();
    try {
      return super.setUserFavoriteTags(lista);
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExpandedKey(GlobalKey<State<StatefulWidget>> key) {
    final _$actionInfo = _$_UserActionController.startAction();
    try {
      return super.setExpandedKey(key);
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo = _$_UserActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }

  @override
  void finishStart() {
    final _$actionInfo = _$_UserActionController.startAction();
    try {
      return super.finishStart();
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDisplayName(dynamic val) {
    final _$actionInfo = _$_UserActionController.startAction();
    try {
      return super.setDisplayName(val);
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }
}
