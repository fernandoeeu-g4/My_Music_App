// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Feed on _Feed, Store {
  Computed<int> _$getCurrentFeedGenreIdComputed;

  @override
  int get getCurrentFeedGenreId => (_$getCurrentFeedGenreIdComputed ??=
          Computed<int>(() => super.getCurrentFeedGenreId))
      .value;

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

  final _$feedGenresAtom = Atom(name: '_Feed.feedGenres');

  @override
  ObservableList<FeedGenre> get feedGenres {
    _$feedGenresAtom.context.enforceReadPolicy(_$feedGenresAtom);
    _$feedGenresAtom.reportObserved();
    return super.feedGenres;
  }

  @override
  set feedGenres(ObservableList<FeedGenre> value) {
    _$feedGenresAtom.context.conditionallyRunInAction(() {
      super.feedGenres = value;
      _$feedGenresAtom.reportChanged();
    }, _$feedGenresAtom, name: '${_$feedGenresAtom.name}_set');
  }

  final _$_currentFeedGenreIdAtom = Atom(name: '_Feed._currentFeedGenreId');

  @override
  int get _currentFeedGenreId {
    _$_currentFeedGenreIdAtom.context
        .enforceReadPolicy(_$_currentFeedGenreIdAtom);
    _$_currentFeedGenreIdAtom.reportObserved();
    return super._currentFeedGenreId;
  }

  @override
  set _currentFeedGenreId(int value) {
    _$_currentFeedGenreIdAtom.context.conditionallyRunInAction(() {
      super._currentFeedGenreId = value;
      _$_currentFeedGenreIdAtom.reportChanged();
    }, _$_currentFeedGenreIdAtom,
        name: '${_$_currentFeedGenreIdAtom.name}_set');
  }

  final _$_FeedActionController = ActionController(name: '_Feed');

  @override
  void initFeedGenres() {
    final _$actionInfo = _$_FeedActionController.startAction();
    try {
      return super.initFeedGenres();
    } finally {
      _$_FeedActionController.endAction(_$actionInfo);
    }
  }

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
  void setCurrentFeedGenreId(int id) {
    final _$actionInfo = _$_FeedActionController.startAction();
    try {
      return super.setCurrentFeedGenreId(id);
    } finally {
      _$_FeedActionController.endAction(_$actionInfo);
    }
  }
}
