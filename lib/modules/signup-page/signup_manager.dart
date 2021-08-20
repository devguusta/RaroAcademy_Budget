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
  @observable
  bool loading = false;


  @action
  Future<void> changeTrueLoading() async{
    loading =  true;
  }
  
  @action
  Future<void> changeFalseLoading() async{
    loading =  false;
  }

  @action
  Future<void> nextPage() async {
    pageController.nextPage(
      duration: const Duration(microseconds: 400),
      curve: Curves.easeIn,
    );
  }

  @action
    Future<void> backPage() async {
      pageController.previousPage(
        duration: const Duration(microseconds: 400),
        curve: Curves.easeIn,
      );
    }

}
