// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameStore on GameStoreBase, Store {
  final _$listAtom = Atom(name: 'GameStoreBase.list');

  @override
  List<Game> get list {
    _$listAtom.context.enforceReadPolicy(_$listAtom);
    _$listAtom.reportObserved();
    return super.list;
  }

  @override
  set list(List<Game> value) {
    _$listAtom.context.conditionallyRunInAction(() {
      super.list = value;
      _$listAtom.reportChanged();
    }, _$listAtom, name: '${_$listAtom.name}_set');
  }

  final _$genresAtom = Atom(name: 'GameStoreBase.genres');

  @override
  List<String> get genres {
    _$genresAtom.context.enforceReadPolicy(_$genresAtom);
    _$genresAtom.reportObserved();
    return super.genres;
  }

  @override
  set genres(List<String> value) {
    _$genresAtom.context.conditionallyRunInAction(() {
      super.genres = value;
      _$genresAtom.reportChanged();
    }, _$genresAtom, name: '${_$genresAtom.name}_set');
  }

  final _$pageAtom = Atom(name: 'GameStoreBase.page');

  @override
  int get page {
    _$pageAtom.context.enforceReadPolicy(_$pageAtom);
    _$pageAtom.reportObserved();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.context.conditionallyRunInAction(() {
      super.page = value;
      _$pageAtom.reportChanged();
    }, _$pageAtom, name: '${_$pageAtom.name}_set');
  }

  final _$totalAtom = Atom(name: 'GameStoreBase.total');

  @override
  int get total {
    _$totalAtom.context.enforceReadPolicy(_$totalAtom);
    _$totalAtom.reportObserved();
    return super.total;
  }

  @override
  set total(int value) {
    _$totalAtom.context.conditionallyRunInAction(() {
      super.total = value;
      _$totalAtom.reportChanged();
    }, _$totalAtom, name: '${_$totalAtom.name}_set');
  }

  final _$isFetchingAtom = Atom(name: 'GameStoreBase.isFetching');

  @override
  bool get isFetching {
    _$isFetchingAtom.context.enforceReadPolicy(_$isFetchingAtom);
    _$isFetchingAtom.reportObserved();
    return super.isFetching;
  }

  @override
  set isFetching(bool value) {
    _$isFetchingAtom.context.conditionallyRunInAction(() {
      super.isFetching = value;
      _$isFetchingAtom.reportChanged();
    }, _$isFetchingAtom, name: '${_$isFetchingAtom.name}_set');
  }

  final _$fetchListAsyncAction = AsyncAction('fetchList');

  @override
  Future<void> fetchList() {
    return _$fetchListAsyncAction.run(() => super.fetchList());
  }

  final _$fetchGenresAsyncAction = AsyncAction('fetchGenres');

  @override
  Future<void> fetchGenres() {
    return _$fetchGenresAsyncAction.run(() => super.fetchGenres());
  }

  final _$GameStoreBaseActionController =
      ActionController(name: 'GameStoreBase');

  @override
  void nextPage() {
    final _$actionInfo = _$GameStoreBaseActionController.startAction();
    try {
      return super.nextPage();
    } finally {
      _$GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void prevPage() {
    final _$actionInfo = _$GameStoreBaseActionController.startAction();
    try {
      return super.prevPage();
    } finally {
      _$GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
