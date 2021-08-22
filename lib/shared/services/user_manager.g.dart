// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserManager on _UserManagerBase, Store {
  final _$userAtom = Atom(name: '_UserManagerBase.user');

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$initialAccessAtom = Atom(name: '_UserManagerBase.initialAccess');

  @override
  bool get initialAccess {
    _$initialAccessAtom.reportRead();
    return super.initialAccess;
  }

  @override
  set initialAccess(bool value) {
    _$initialAccessAtom.reportWrite(value, super.initialAccess, () {
      super.initialAccess = value;
    });
  }

  final _$isLoggedInAtom = Atom(name: '_UserManagerBase.isLoggedIn');

  @override
  bool? get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool? value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_UserManagerBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_UserManagerBaseActionController =
      ActionController(name: '_UserManagerBase');

  @override
  void setUser(UserModel? value) {
    final _$actionInfo = _$_UserManagerBaseActionController.startAction(
        name: '_UserManagerBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_UserManagerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
initialAccess: ${initialAccess},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
