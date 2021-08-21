// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$isInternetAtom = Atom(name: '_HomeControllerBase.isInternet');

  @override
  bool get isInternet {
    _$isInternetAtom.reportRead();
    return super.isInternet;
  }

  @override
  set isInternet(bool value) {
    _$isInternetAtom.reportWrite(value, super.isInternet, () {
      super.isInternet = value;
    });
  }

  final _$appStatusAtom = Atom(name: '_HomeControllerBase.appStatus');

  @override
  AppStatus get appStatus {
    _$appStatusAtom.reportRead();
    return super.appStatus;
  }

  @override
  set appStatus(AppStatus value) {
    _$appStatusAtom.reportWrite(value, super.appStatus, () {
      super.appStatus = value;
    });
  }

  final _$subAtom = Atom(name: '_HomeControllerBase.sub');

  @override
  StreamSubscription<dynamic> get sub {
    _$subAtom.reportRead();
    return super.sub;
  }

  @override
  set sub(StreamSubscription<dynamic> value) {
    _$subAtom.reportWrite(value, super.sub, () {
      super.sub = value;
    });
  }

  final _$checkInternetAsyncAction =
      AsyncAction('_HomeControllerBase.checkInternet');

  @override
  ObservableFuture<void> checkInternet() {
    return ObservableFuture<void>(
        _$checkInternetAsyncAction.run(() => super.checkInternet()));
  }

  @override
  String toString() {
    return '''
isInternet: ${isInternet},
appStatus: ${appStatus},
sub: ${sub}
    ''';
  }
}
