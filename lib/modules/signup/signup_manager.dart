import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'signup_manager.g.dart';

class SignUpManager = _SignUpManagerBase with _$SignUpManager;

abstract class _SignUpManagerBase with Store {
  @observable
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 1,
  );
  @observable
  int pageChanged = 0;

  @action
  Future<void> nextPage() async {
   await pageController.nextPage(
      duration: const Duration(microseconds: 400),
      curve: Curves.easeIn,
    );
  }

  @action
    Future<void> backPage() async {
      await pageController.previousPage(
        duration: const Duration(microseconds: 400),
        curve: Curves.easeIn,
      );
    }

  @observable
  bool loading = false;

  @action
  Future<void> changeTrueLoading() async{
    loading = await true;
  }
  @action
  Future<void> changeFalseLoading() async{
    loading = await false;
  }

  @observable
  bool checkComboBox = false;

  @action
  Future<bool> changeComboBox(bool? value) async {
   return checkComboBox = value!;
   
  }

  @observable
  bool passwordVisible = false;

 @action
  Future<void> changePasswordVisible() async {
    passwordVisible = !passwordVisible;
  }
  
  @observable
  bool confirmPasswordVisible = false;

 @action
  Future<void> changeconfirmPasswordVisible() async {
    confirmPasswordVisible = !confirmPasswordVisible;
  }

  

}
enum SingingCharacter { yes, no }
