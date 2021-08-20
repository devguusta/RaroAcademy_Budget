// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginManager on _LoginManagerBase, Store {
  final _$enabledAtom = Atom(name: '_LoginManagerBase.enabled');

  @override
  bool get enabled {
    _$enabledAtom.reportRead();
    return super.enabled;
  }

  @override
  set enabled(bool value) {
    _$enabledAtom.reportWrite(value, super.enabled, () {
      super.enabled = value;
    });
  }

  final _$resultAtom = Atom(name: '_LoginManagerBase.result');

  @override
  bool get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(bool value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  @override
  String toString() {
    return '''
enabled: ${enabled},
result: ${result}
    ''';
  }
}
