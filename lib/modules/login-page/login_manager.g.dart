// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginManager on _LoginManagerBase, Store {
  final _$passwordVisibleAtom = Atom(name: '_LoginManagerBase.passwordVisible');

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  final _$changePasswordVisibleAsyncAction =
      AsyncAction('_LoginManagerBase.changePasswordVisible');

  @override
  Future<void> changePasswordVisible() {
    return _$changePasswordVisibleAsyncAction
        .run(() => super.changePasswordVisible());
  }

  @override
  String toString() {
    return '''
passwordVisible: ${passwordVisible}
    ''';
  }
}
