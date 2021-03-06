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

  final _$checkComboBoxAtom = Atom(name: '_SignUpManagerBase.checkComboBox');

  @override
  bool get checkComboBox {
    _$checkComboBoxAtom.reportRead();
    return super.checkComboBox;
  }

  @override
  set checkComboBox(bool value) {
    _$checkComboBoxAtom.reportWrite(value, super.checkComboBox, () {
      super.checkComboBox = value;
    });
  }

  final _$passwordVisibleAtom =
      Atom(name: '_SignUpManagerBase.passwordVisible');

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

  final _$confirmPasswordVisibleAtom =
      Atom(name: '_SignUpManagerBase.confirmPasswordVisible');

  @override
  bool get confirmPasswordVisible {
    _$confirmPasswordVisibleAtom.reportRead();
    return super.confirmPasswordVisible;
  }

  @override
  set confirmPasswordVisible(bool value) {
    _$confirmPasswordVisibleAtom
        .reportWrite(value, super.confirmPasswordVisible, () {
      super.confirmPasswordVisible = value;
    });
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

  final _$changeComboBoxAsyncAction =
      AsyncAction('_SignUpManagerBase.changeComboBox');

  @override
  Future<bool> changeComboBox(bool? value) {
    return _$changeComboBoxAsyncAction.run(() => super.changeComboBox(value));
  }

  final _$changePasswordVisibleAsyncAction =
      AsyncAction('_SignUpManagerBase.changePasswordVisible');

  @override
  Future<void> changePasswordVisible() {
    return _$changePasswordVisibleAsyncAction
        .run(() => super.changePasswordVisible());
  }

  final _$changeconfirmPasswordVisibleAsyncAction =
      AsyncAction('_SignUpManagerBase.changeconfirmPasswordVisible');

  @override
  Future<void> changeconfirmPasswordVisible() {
    return _$changeconfirmPasswordVisibleAsyncAction
        .run(() => super.changeconfirmPasswordVisible());
  }

  @override
  String toString() {
    return '''
pageController: ${pageController},
pageChanged: ${pageChanged},
loading: ${loading},
checkComboBox: ${checkComboBox},
passwordVisible: ${passwordVisible},
confirmPasswordVisible: ${confirmPasswordVisible}
    ''';
  }
}
