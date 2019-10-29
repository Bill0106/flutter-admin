// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on UserStoreBase, Store {
  Computed<String> _$sessionComputed;

  @override
  String get session =>
      (_$sessionComputed ??= Computed<String>(() => super.session)).value;

  final _$isPostingAtom = Atom(name: 'UserStoreBase.isPosting');

  @override
  bool get isPosting {
    _$isPostingAtom.context.enforceReadPolicy(_$isPostingAtom);
    _$isPostingAtom.reportObserved();
    return super.isPosting;
  }

  @override
  set isPosting(bool value) {
    _$isPostingAtom.context.conditionallyRunInAction(() {
      super.isPosting = value;
      _$isPostingAtom.reportChanged();
    }, _$isPostingAtom, name: '${_$isPostingAtom.name}_set');
  }

  final _$loginAsyncAction = AsyncAction('login');

  @override
  Future<void> login({String username, String password}) {
    return _$loginAsyncAction
        .run(() => super.login(username: username, password: password));
  }

  final _$UserStoreBaseActionController =
      ActionController(name: 'UserStoreBase');

  @override
  void logout() {
    final _$actionInfo = _$UserStoreBaseActionController.startAction();
    try {
      return super.logout();
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
