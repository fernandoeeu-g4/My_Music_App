// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$App on _App, Store {
  final _$tabAtom = Atom(name: '_App.tab');

  @override
  TabItem get tab {
    _$tabAtom.context.enforceReadPolicy(_$tabAtom);
    _$tabAtom.reportObserved();
    return super.tab;
  }

  @override
  set tab(TabItem value) {
    _$tabAtom.context.conditionallyRunInAction(() {
      super.tab = value;
      _$tabAtom.reportChanged();
    }, _$tabAtom, name: '${_$tabAtom.name}_set');
  }

  final _$bottomNavigationIndexAtom = Atom(name: '_App.bottomNavigationIndex');

  @override
  int get bottomNavigationIndex {
    _$bottomNavigationIndexAtom.context
        .enforceReadPolicy(_$bottomNavigationIndexAtom);
    _$bottomNavigationIndexAtom.reportObserved();
    return super.bottomNavigationIndex;
  }

  @override
  set bottomNavigationIndex(int value) {
    _$bottomNavigationIndexAtom.context.conditionallyRunInAction(() {
      super.bottomNavigationIndex = value;
      _$bottomNavigationIndexAtom.reportChanged();
    }, _$bottomNavigationIndexAtom,
        name: '${_$bottomNavigationIndexAtom.name}_set');
  }

  final _$_AppActionController = ActionController(name: '_App');

  @override
  void changeTab(TabItem tab) {
    final _$actionInfo = _$_AppActionController.startAction();
    try {
      return super.changeTab(tab);
    } finally {
      _$_AppActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBottomNavigationIndex(dynamic index) {
    final _$actionInfo = _$_AppActionController.startAction();
    try {
      return super.setBottomNavigationIndex(index);
    } finally {
      _$_AppActionController.endAction(_$actionInfo);
    }
  }
}
