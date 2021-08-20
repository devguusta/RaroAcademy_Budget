// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpManager on _SignUpManagerBase, Store {
  final _$pageControllerAtom = Atom(name: '_SignUpManagerBase.pageController');

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  final _$pageChangedAtom = Atom(name: '_SignUpManagerBase.pageChanged');

  @override
  int get pageChanged {
    _$pageChangedAtom.reportRead();
    return super.pageChanged;
  }

  @override
  set pageChanged(int value) {
    _$pageChangedAtom.reportWrite(value, super.pageChanged, () {
      super.pageChanged = value;
    });
  }

  final _$loadingAtom = Atom(name: '_SignUpManagerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$changeTrueLoadingAsyncAction =
      AsyncAction('_SignUpManagerBase.changeTrueLoading');

  @override
  Future<void> changeTrueLoading() {
    return _$changeTrueLoadingAsyncAction.run(() => super.changeTrueLoading());
  }

  final _$changeFalseLoadingAsyncAction =
      AsyncAction('_SignUpManagerBase.changeFalseLoading');

  @override
  Future<void> changeFalseLoading() {
    return _$changeFalseLoadingAsyncAction
        .run(() => super.changeFalseLoading());
  }

  final _$nextPageAsyncAction = AsyncAction('_SignUpManagerBase.nextPage');

  @override
  Future<void> nextPage() {
    return _$nextPageAsyncAction.run(() => super.nextPage());
  }

  final _$backPageAsyncAction = AsyncAction('_SignUpManagerBase.backPage');

  @override
  Future<void> backPage() {
    return _$backPageAsyncAction.run(() => super.backPage());
  }

  @override
  String toString() {
    return '''
pageController: ${pageController},
pageChanged: ${pageChanged},
loading: ${loading}
    ''';
  }
}
