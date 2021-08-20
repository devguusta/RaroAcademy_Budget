import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:raro_academy_budget/util/extensions.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  String errorMessage = '';

  @observable
  bool isInternet = true;
  
  @observable
  AppStatus appStatus = AppStatus.empty;

  @observable
  late StreamSubscription sub;

  @action
  Future<void> checkInternet() async{
    try{
      appStatus = AppStatus.loading;

       sub = await Connectivity().onConnectivityChanged.listen((result) {   
          isInternet = (result != ConnectivityResult.none);
          print(isInternet);
      });
      appStatus = isInternet ? AppStatus.success : AppStatus.empty;
      // print(isInternet);
    } on PlatformException catch (e) {
      errorMessage = e.message.toString();
      appStatus = AppStatus.error;
      // print(isInternet);
    } catch(e){
      errorMessage = e.toString();
      appStatus = AppStatus.error;
      appStatus.message();
      // print(isInternet);
    }
   

  }
  
}